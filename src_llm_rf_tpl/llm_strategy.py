import re
import time
from typing import TypedDict, Literal

# Imports from local modules
from src_llm_rf_tpl.chat_interface import chat_interface
from src_llm_rf_tpl.svm_ranker_adapter import SVMRanker

class RankingResult(TypedDict):
    status: Literal["TERM", "NONTERM"]
    kind: str

def parse_ranking_output(output: str) -> RankingResult:
    """
    Parse the answer content of ask_question_of_ranking_function_type.
    """
    text = output.strip()
    m = re.search(
        r'\[(TERM(?:INATING)?|NONTERM(?:INATING)?)\]\s*(\w+)',
        text,
        re.IGNORECASE
    )
    if not m:
        # Fallback loose regex if strict format fails
        if "single" in text.lower():
             return {"status": "TERM", "kind": "Single"}
        if "nested" in text.lower():
             return {"status": "TERM", "kind": "Nested"}
        if "multi" in text.lower():
             return {"status": "TERM", "kind": "Multi"}
             
        # raise ValueError(f"无法解析输出: {output!r}")
        # Return unknown instead of crash
        return {"status": "TERM", "kind": "Unknown"}

    raw_status = m.group(1).upper()
    kind       = m.group(2)

    if raw_status.startswith("NONTERM"):
        status = "NONTERM"
    else:
        status = "TERM"

    return {"status": status, "kind": kind}

def extract_nested_phase_num(output_str):
    """
    从 GPT 的输出中提取 [PHASE_NUM]k 形式的最小 phase 数。
    """
    # 1. Strict match [PHASE_NUM]k
    strict_match = re.search(r"\[PHASE_NUM\](\d+)", output_str)
    if strict_match:
        return int(strict_match.group(1))

    # 2. Relaxed match
    relaxed_match = re.search(r"(?:minimum\s*)?phase(?:s)?(?:\s*needed)?\D*(\d+)", output_str, re.IGNORECASE)
    if relaxed_match:
        return int(relaxed_match.group(1))

    # 3. Fallback to first standalone number
    loose_match = re.search(r"\b(\d+)\b", output_str)
    if loose_match:
        return int(loose_match.group(1))

    return None

def terminating_nested_phase_judge(interface: chat_interface, boogie_program: str):
    answer = interface.ask_question_of_nested_phase_judge(boogie_program)
    answer_content = answer.content
    print(f"[LLM Response Nested Phase]: {answer_content}")
    result_phase_num = extract_nested_phase_num(answer_content)
    return result_phase_num

def terminating_multi_phase_judge(interface: chat_interface, boogie_program: str):
    answer = interface.ask_question_of_multi_phase_judge(boogie_program)
    answer_content = answer.content
    print(f"[LLM Response Multi Phase]: {answer_content}")
    result_phase_num = extract_nested_phase_num(answer_content)
    return result_phase_num

def strategy_process_inference(interface: chat_interface, program: str):
    """
    分析程序的终止策略类型 (Template Inference)
    返回: (strategy_type, phase_num) 或 ("NONTERM", reason)
    """
    termination_answer = interface.ask_question_of_ranking_function_type(program)
    termination_answer_content = termination_answer.content
    
    termination_result = parse_ranking_output(termination_answer_content)
    
    if termination_result["status"] == "NONTERM":
        return ("NONTERM", termination_result["kind"])
        
    elif termination_result["status"] == "TERM":
        kind = termination_result["kind"]
        if kind.lower() == "single":
            return ("Single", 1)
        elif kind.lower() == "multi":  
            phase_num = terminating_multi_phase_judge(interface, program)
            if phase_num is None or phase_num < 0:
                return ("Multi", -1) # Failed inference
            else:
                return ("Multi", phase_num)
        elif kind.lower() == "nested":
            phase_num = terminating_nested_phase_judge(interface, program)
            if phase_num is None or phase_num < 0:
                return ("Nested", -1) # Failed inference
            else:
                return ("Nested", phase_num)
        elif kind.lower() == "other":
            return ("Other", 0)
        else:
            return ("UNKNOWN", -1)
    else:
        return ("ERROR", -1)

def run_full_pipeline_with_svm(interface: chat_interface, program_path: str, use_inference_depth: bool = False):
    """
    执行完整流程：LLM 推理 -> SVM Ranker 调用
    Arg:
       use_inference_depth: If True, uses the depth inferred by LLM. 
                            If False (default), uses fixed safe depth (e.g. 4).
    """
    print(f"--- Starting Analysis Pipeline for: {program_path} ---")
    try:
        with open(program_path, 'r', errors='ignore') as f:
            program_content = f.read()
    except FileNotFoundError:
        print(f"[ERROR] File not found: {program_path}")
        return

    llm_start_time = time.time()
    
    # Step 1: Check termination (Optional if you assume known termination)
    # Here mimicking the logic from original script
    # For now, let's assume we proceed to ranking function check directly 
    # OR we follow the simple IsSingle check first.
    
    # Option A: Simple Single Check (Robust Pipeline)
    single_answer = interface.ask_boogie_is_single_ranking_function(program_content)
    is_single = "YES" in single_answer.content
    
    llm_time_consumed = time.time() - llm_start_time
    
    if use_inference_depth:
        # Option B: Detailed Strategy Inference
        strategy, phase_num = strategy_process_inference(interface, program_content)
        print(f"[INFO] Inferred Strategy: {strategy}, Phase: {phase_num}")
        
        if strategy == "Single":
            SVMRanker(program_path, program_content, "Nested", 1, True, "1-nested", llm_time_consumed)
        elif strategy == "Nested":
             depth = phase_num if phase_num > 0 else 4
             SVMRanker(program_path, program_content, "Nested", depth, True, f"{depth}-nested", llm_time_consumed)
        elif strategy == "Multi":
             depth = phase_num if phase_num > 0 else 4
             SVMRanker(program_path, program_content, "Multi", depth, True, f"{depth}-multi", llm_time_consumed)
        else:
             print("[WARN] Unknown strategy or nonterm")

    else:
        # Default Robust Mode (Fixed Depth 4)
        if is_single:
             print("[INFO] LLM says Single -> Calling SVMRanker Nested Depth 4 (Robust)")
             SVMRanker(program_path, program_content, "Nested", 4, True, "4-nested", llm_time_consumed)
        else:
             print("[INFO] LLM says Not Single -> Calling SVMRanker Multi Depth 4")
             SVMRanker(program_path, program_content, "Multi", 4, True, "4-multi", llm_time_consumed)

