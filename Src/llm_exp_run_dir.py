import os
import sys
import time
import csv
import argparse
import re
from typing import TypedDict, Literal
from collections import Counter
from datetime import datetime
from functools import wraps
import psutil

from openai import OpenAI

from utils.utils import load_api_key
from utils.utils import remove_comments
from use_svmranker import SVMRanker
import utils.const_prompts as PROMPTS
import utils.const as CONST

secrete = load_api_key()

LLM_MODEL_NAME = CONST.LLM_MODEL_NAMES['claude3.7']

LLM_results_folder = os.path.join(os.getcwd(), "Results", "LLM_results")

YES_program_folder = os.path.join(os.getcwd(), "TPDB_YES")
NO_program_folder = os.path.join(os.getcwd(), "TPDB_NO")
MAYBE_program_folder = os.path.join(os.getcwd(), "TPDB_MAYBEs")


# for phase judgement
PHASE_JUDGE_Exp_folder = os.path.join(os.getcwd(), "LLM_Phase_Exp")
PHASE_JUDGE_Exp_Result_folder = os.path.join(PHASE_JUDGE_Exp_folder, "LLM_Phase_Results")
NESTED_PHASE_JUDGE_Exp_Result_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Nested")
NESTED_PHASE_JUDGE_program_folder = os.path.join(PHASE_JUDGE_Exp_folder, "4-nested-terminate")
MULTI_PHASE_JUDGE_Exp_Result_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Multi")
MULTI_PHASE_JUDGE_program_folder = os.path.join(PHASE_JUDGE_Exp_folder, "4-multi-terminate")

# for strategy choosing
TPDB_Validation_folder = os.path.join(os.getcwd(), "TPDB_Validation")
STRATEGY_Exp_folder = os.path.join(os.getcwd(), "LLM_Strategy_Exp")
# for termtype choosing
TERMTYPE_Exp_folder = os.path.join(os.getcwd(), "LLM_Termtype_Exp")

# chat interface 
class chat_interface:
    def __init__(self) -> None:
        self.msg_list = []

    def show_conversations(self):
        print("------------------------------------- conversations")
        for msg in self.msg_list:
            if msg['role'] == 'user':
                print("USER ================== BEGIN")
                print(msg['content'])
                print("USER ================== END")
            else:
                print("CHATGPT ================== BEGIN")
                print(msg['content'])
                print("CHATGPT ================== END")
        print("------------------------------------- conversations end")
    

    def set_up_aiproxy_configs(self):
        self.client = OpenAI(
            api_key = secrete,
            base_url="https://api.aiproxy.io/v1"
        )

    def set_up_open_router_configs(self):
        self.client = OpenAI(
            api_key=secrete,
            base_url="https://openrouter.ai/api/v1"
        )
    # reserved for latter if key for openai can be obtained, currently we are using the aiproxy
    # aiproxy is not free
    def set_up_default_configs(self):
        self.client = OpenAI(
            api_key = secrete,
            base_url="https://api.aiproxy.io/v1"
        )

    def ask_question_and_record(self, content):
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=LLM_MODEL_NAME,
            messages=[{"role": "user", "content": content}]
        )
        answer = res.choices[0].message
        self.msg_list.append(answer)
        return answer
    
    def ask_question_with_role_and_record(self, role_prompt, content):
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=LLM_MODEL_NAME,
            messages=self.msg_list
        )
        answer = res.choices[0].message
        self.msg_list.append(answer)
        return answer
    
    def ask_question_with_role_no_history_and_record(self, 
                                                     role_prompt, 
                                                     content,
                                                     llm_model_chosed=LLM_MODEL_NAME):
        self.msg_list.clear()
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=llm_model_chosed,
            messages=self.msg_list
        )
        answer = res.choices[0].message
        return answer
    
    def ask_naive_question_of_termination(self, program):
        role_prompt = "You are a expert of program termination analysis. In the following you will be given a program in C and you will judge whether it is terminating or not.\n" \
        "If you judge that the program is terminating, then you will produce a ranking function to prove your judgement, e.g.\n" \
        "if the program is: \n"\
        "//example/Example1.c\n"\
        "int main() {\n"\
        "int x, y;\n"\
        "while(x > 0 || y > 0) {\n"\
        "	x = x + y - 1;\n"\
        "   y = y - 1;\n"\
        "}\n"\
        "then you should provide output:  [RESULT]\nTERMINATE\n[RANKING FUNCTION TYPE]\nmulti-phase\n[RANKING FUNCTIONS]\n5.0 * 1 + 1.0 *  y^1 + 5.0 * 1\n0.0796 *  x^1 + 0.482 * 1 + 0.482 * 1\n" \
        "meaning that the program is terminating and can be proved by the multi-phase ranking function." \
        "There are several kinds of ranking functions including: multi-phase, nested, piecewise, linear. the ranking function provided should be in the corresponding category."\
        "if the program is non-terminating, you only needs to output: [RESULT]\nNONTERM\n[REASON]\nxxx\n, where xxx should be a very concise explanation.\n"\
        # "if you cannot decide, then you should output [RESULT]\nUNKNOWN\n"
        "Notice that the function __VERIFIER_nondet_int() in the program identifies a function returns a nondeterministic integer.\n"
        "YOU MUST FOLLOW THE output format that if it is termination, you should not generate any explanation and when it is nontermination, you should generate explanation under [REASON] label"

        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(answer.content)
        return answer


    def ask_question_of_ranking_function_type(self, program):
        # Strategy TODO:
        # ask termination or not
        # TERM: Single/Nested/Multiphase/Other
        # NONTERM: 
        role_prompt = "You are an expert of program termination analysis. In the following you wiil be given a loop program in Boogie." \
        "You should judge whether it is termination or not, if you answer is TERMINATING, then you should output:\n" \
        "[TERM] xxxx\n where xxxx is Single/Nested/Multi/Other representing whether the termination can be proved by a single ranking function/Nested rakning function/Multi-phase ranking function or" \
        "other ranking functions like lexico or parallel ranking function. The result of type of ranking function should be simple in a way that if a Nested ranking function is possible, then do not generate Multi." \
        "The preference of ranking functions: Single > Nested > Multi > Other, which Single is the most preferred one.\n"\
        "If you answer is NONTERMINATING, then you should output:\n" \
        "[NONTERM] yyyy\n where yyyy is RECUR/MONO/OTHER representing whether the reason of the nontermination is from recurrence relation/ Monotonic growth or other situations.\n" \
        "Definitions of nested, multi-phase ranking functions are given below: The definition of nested ranking function is: <f1, f2, ..., fn> where n is the number of phases and  for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction"\
        "over the program variables vec(x) and there exists a positive real number C, such that f1(x) - f1(x') >= C, fi(x) - fi(x') + f_(i-1)(x) >= C for i ∈ {2, . . . , k} and fk(x) >= C.\n"
        "The definition of multi-phase ranking function is: <f1, f2, ..., fn> where n is the number of phases and  for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction" \
        "over the program variables vec(x) and we require that there exists an index i ∈ {1, . . . , k} and a constant C such that: f_i(x) >= C and f1(x) - f1(x') >= C and for all j < i we have f_j(x) < 0" \
        "where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.\n DO NOT GENERATE detailed explanation."
        # Test1: 已经知道终止; 只判断类型
        # Test2: 
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(f"[ANS] \n{answer.content} \n[ANS END]")
        return answer

    def ask_question_of_nested_phase_judge(self, program):
        role_prompt = PROMPTS.nested_phase_judge_prompt
        backloop_prompt = "If you deem the program nonterminating, just output [NONTERM] without any explanation."
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(answer.content)
        return answer
    
    def ask_question_of_multi_phase_judge(self, program):
        role_prompt = PROMPTS.multi_phase_judge_prompt
        backloop_prompt = "If you deem the program nonterminating, just output [NONTERM] without any explanation."
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(answer.content)
        return answer
    def ask_boogie_is_terminating(self, program):
        """
        只判断程序是否终止，输出格式严格：
            [RESULT]\n TERMINATE 或 [RESULT]\n NONTERM
        """
        role_prompt = PROMPTS.boogie_is_terminating_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(f"[ANS] \n{answer.content} \n[ANS END]")
        return answer

    def ask_boogie_is_single_ranking_function(self, program):
        """
        已知程序终止，判断是否可以用 single ranking function 证明。
        输出格式严格：
            [SINGLE]\n YES 或 [SINGLE]\n NO
        """
        role_prompt = PROMPTS.boogie_single_RF_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(f"[ANS] \n{answer.content} \n[ANS END]")
        return answer

    def ask_known_term_RF_type(self, program, mode):
        role_prompt = PROMPTS.termed_type_direct_judge_prompt if mode == "direct" else PROMPTS.termed_type_fewshot_judge_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(f"[ANS] \n{answer.content} \n[ANS END]")
        return answer
    
    def ask_known_nonterm_type(self, program, 
                               llm_model_chosen = None):
        role_prompt = PROMPTS.nontermtype_judge_prompt
        no_comment_program = remove_comments(program)
        if llm_model_chosen is None:
            answer = self.ask_question_with_role_no_history_and_record(role_prompt,
                                                                       no_comment_program)
        else:
            answer = self.ask_question_with_role_no_history_and_record(role_prompt,
                                                                       no_comment_program,
                                                                       CONST.LLM_MODEL_NAMES[llm_model_chosen])
        print(f"[ANS] \n{answer.content} \n[ANS END]")
        return answer
def parse_known_term_llm_result(result_str):
    result_lines = str.split(result_str, "\n")
    assert len(result_lines) == 2, "ParseError: result_str should have exactly 2 lines."
    assert "[RANKING_TYPE]" in result_lines[0], "ParseError: result_str should start with [RANKING_TYPE]"
    res_type = result_lines[1].strip()
    _TYPES = ["single", "nested", "multi", "other"]
    assert res_type.lower() in _TYPES, f"ParseError: result_str should have a valid ranking type, got {res_type}"
    return res_type.lower()

def parse_known_nonterm_llm_result(content: str) -> str:
    """
    将 LLM 返回的内容解析为非终止类型，
    期望输入形如 "[NONTERMTYPE] DIVERGENT" 等，
    返回 DIVERGENT, RECUR, GEOMETRIC, RECUR_FUNC, OTHER 中的一个，
    出现解析错误时返回 "PARSE_ERROR"。
    """
    m1 = re.search(r'\[NONTERMTYPE\]\s*(DIVERGENT|RECUR|GEOMETRIC|RECUR_FUNC|OTHER)', content, re.IGNORECASE)
    m2 = re.search(r'(DIVERGENT|RECUR|GEOMETRIC|RECUR_FUNC|OTHER)', content, re.IGNORECASE)
    if m1:
        return m1.group(1).upper()
    elif m2:
        return m2.group(1).upper()
    else:
        return "PARSE_ERROR"

def parse_llm_result(result_str):
    rf_type_str = ""
    rf_content_str = ""
    result_lines = str.split(result_str, "\n")
    is_collecting_result = False
    is_terminating = False
    is_unknown = False
    is_collecting_RF_Type = False
    is_collecting_RF =  False
    is_collecting_SingleRF = False
    is_single = False
    parse_failed = False
    for line in result_lines:
        if  "[RESULT]" in line:
            is_collecting_result = True
            continue
        elif "[RANKING FUNCTION TYPE]" in line: # parse 2 results;
            if is_terminating:
                is_collecting_RF_Type = True
            else:
                break
            continue
        elif "[RANKING FUNCTIONS]" in line:
            is_collecting_RF_Type = False
            is_collecting_RF = True
            continue
        elif "[SINGLE]" in line:
            is_collecting_SingleRF = True
            continue # continue就是为了\n

        if is_collecting_result:
            if "TERMINATE" in line:
                is_terminating = True
                is_collecting_result = False
            elif "NONTERM" in line:
                is_terminating = False
                is_collecting_result = False
            elif "UNKNOWN" in line:
                is_terminating = True
                is_unknown = True
                is_collecting_result = False
            else:
                print("[Error] : llm result parsing error")
                parse_failed = True

        if is_terminating and is_collecting_RF_Type:
            rf_type_str = rf_type_str + line.strip()
        
        if is_terminating and is_collecting_RF:
            rf_content_str = rf_content_str + line.strip()
        
        if is_collecting_SingleRF:
            if "YES" in line:
                is_single = True
            elif "NO" in line:
                is_single = False
            else:
                print("[Error] : llm result parsing error")
                parse_failed = True
    if parse_failed:
        raise ValueError("ERROR: llm result parsing error")

    if is_collecting_SingleRF:
        return (is_single, is_unknown, "Single", rf_content_str)
    return (is_terminating, is_unknown, rf_type_str, rf_content_str)


def extract_nested_phase_num(output_str):
    """
    从 GPT 的输出中提取 [PHASE_NUM]k 形式的最小 phase 数。
    返回整数 k。如果未找到，返回 None。
    """

    # 1. 先尝试严格匹配格式：[PHASE_NUM]k
    strict_match = re.search(r"\[PHASE_NUM\](\d+)", output_str)
    if strict_match:
        return int(strict_match.group(1))

    # 2. 如果不严格，尝试宽松匹配 —— 找到包含 "phase", "phases", "k=", 数字前缀等
    relaxed_match = re.search(r"(?:minimum\s*)?phase(?:s)?(?:\s*needed)?\D*(\d+)", output_str, re.IGNORECASE)
    if relaxed_match:
        return int(relaxed_match.group(1))

    # 3. 最后 fallback，尝试找第一个孤立的整数（例如用户直接回复了 "3"）
    loose_match = re.search(r"\b(\d+)\b", output_str)
    if loose_match:
        return int(loose_match.group(1))

    # 无法解析，返回 None
    return None


class RankingResult(TypedDict):
    status: Literal["TERM", "NONTERM"]
    kind: str


def parse_ranking_output(output: str) -> RankingResult:
    """
    Parse the answer content of ask_question_of_ranking_function_type.

    Expected tag variants (case‐insensitive):
      [TERM], [TERMINATING]    → status "TERM"
      [NONTERM], [NONTERMINATING] → status "NONTERM"

    Followed by a keyword: Single|Nested|Multi|Other (for TERM)
                             RECUR|MONO|OTHER     (for NONTERM)
    """
    text = output.strip()
    # 捕获 TERM(INATING)? 或 NONTERM(INATING)? 后面跟一个单词
    m = re.search(
        r'\[(TERM(?:INATING)?|NONTERM(?:INATING)?)\]\s*(\w+)',
        text,
        re.IGNORECASE
    )
    if not m:
        raise ValueError(f"无法解析输出: {output!r}")
    raw_status = m.group(1).upper()
    kind       = m.group(2)

    # 统一 status
    if raw_status.startswith("NONTERM"):
        status = "NONTERM"
    else:
        status = "TERM"

    return {"status": status, "kind": kind}


def run_experiment_for_program(interface, 
                               file_name, curr_program, 
                               ref_is_terminating, ref_is_unknown, 
                               repeat_num):
    is_stable = True
    final_is_terminating = False
    final_is_unknown = False
    curr_prog_result_list = []
    responses = []
    for i in range(repeat_num):
        ith_response = interface.ask_naive_question_of_termination(curr_program)
        responses.append(ith_response.content)
        try:
            ith_llm_parse_result = parse_llm_result(ith_response.content)
            curr_prog_result_list.append(ith_llm_parse_result)
            for existing_res in curr_prog_result_list:
                if not (existing_res[0] == ith_llm_parse_result[0] and existing_res[1] == ith_llm_parse_result[1]):
                    is_stable = False
            if not is_stable:
                return (file_name, is_stable, final_is_terminating, final_is_unknown, 
                       ref_is_terminating, ref_is_unknown, repeat_num, responses)
                
        except ValueError as e:
            print(f"Parsing LLM Response failed, got: \n\t{str(e)}")
            return (file_name, False, final_is_terminating, final_is_unknown, 
                   ref_is_terminating, ref_is_unknown, repeat_num, responses)

    return (file_name, is_stable, curr_prog_result_list[0][0], curr_prog_result_list[0][1], 
           ref_is_terminating, ref_is_unknown, repeat_num, responses)


# 容易 parsing error?
# 可以考虑先生成result，再对result使用llm，完成解析；    
def run_certain_experiments(interface):
    os.makedirs("LLM_Results", exist_ok=True)
    csv_file_path = os.path.join("LLM_Results", f"llm_results_Certain.csv")

    with open(csv_file_path, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['file_name', 'category', 'is_stable', 'llm_is_terminating', 
                     'llm_is_unknown', 'ref_is_terminating', 'ref_is_unknown', 
                     'repeat_count', 'processing_time']
        csv_writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        csv_writer.writeheader()

    all_programs = []
    for item in os.listdir(YES_program_folder):
        all_programs.append((os.path.join(YES_program_folder, item), item, 'YES', True, False))
    for item in os.listdir(NO_program_folder):
        all_programs.append((os.path.join(NO_program_folder, item), item, 'NO', False, False))
    
    for file_path, file_name, category, ref_is_terminating, ref_is_unknown in all_programs:
        try:
            print(f"[Info] Processing {category} program: {file_name}")
            start_time = time.time()
            with open(file_path, 'r', errors='ignore') as f:
                curr_program = f.read()
            exp_result = run_experiment_for_program(interface, 
                                                   file_name, 
                                                   curr_program, 
                                                   ref_is_terminating, 
                                                   ref_is_unknown, 
                                                   2)
            end_time = time.time()
            processing_time = end_time - start_time

            file_name, is_stable, llm_is_terminating, llm_is_unknown, \
            ref_is_terminating, ref_is_unknown, repeat_count, responses = exp_result
            
            with open(csv_file_path, 'a', newline='', encoding='utf-8') as csvfile:
                csv_writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                csv_writer.writerow({
                    'file_name': file_name,
                    'category': category,
                    'is_stable': is_stable,
                    'llm_is_terminating': llm_is_terminating,
                    'llm_is_unknown': llm_is_unknown,
                    'ref_is_terminating': ref_is_terminating,
                    'ref_is_unknown': ref_is_unknown,
                    'repeat_count': repeat_count,
                    'processing_time': round(processing_time, 2)
                })
            
            response_file = os.path.join(LLM_results_folder, f"{category}_{file_name}.txt")
            with open(response_file, 'w+', encoding='utf-8') as f:
                for i, response in enumerate(responses):
                    f.write(f"=== Response {i+1} ===\n{response}\n\n")
            
            print(f"Result: {'Stable' if is_stable else 'Unstable'}, "
                  f"LLM Decision: {'Terminate' if llm_is_terminating else 'Non-terminate/Unknown'}, "
                  f"Time elapsed: {processing_time:.2f} seconds")
        except Exception as e:
            print(f"Error occurred while processing {file_name}: {str(e)}")
    
    yes_count = len([p for p in all_programs if p[2] == 'YES'])
    no_count = len([p for p in all_programs if p[2] == 'NO'])
    print(f"\nExperiment results have been saved to: {csv_file_path}")
    print(f"Termination Yes Programs : {yes_count}")
    print(f"Termination No Programs : {no_count}")

def terminating_nested_phase_judge(interface, boogie_program):
    answer = interface.ask_question_of_nested_phase_judge(boogie_program)
    answer_content = answer.content
    result_phase_num = extract_nested_phase_num(answer_content)
    return result_phase_num

def terminating_multi_phase_judge(interface, boogie_program):
    answer = interface.ask_question_of_multi_phase_judge(boogie_program)
    answer_content = answer.content
    result_phase_num = extract_nested_phase_num(answer_content)
    return result_phase_num



def run_svmranker_nested_phase_judge(interface):
    result_list = []
    result_csv_file_path = os.path.join(NESTED_PHASE_JUDGE_Exp_Result_folder, "result.csv")
    for item in os.listdir(NESTED_PHASE_JUDGE_program_folder):
        ref_str = item.split("_")[0]
        f = open(os.path.join(NESTED_PHASE_JUDGE_program_folder, item))
        curr_boogie_program = f.read()
        repeat_num = 3
        result_num_list = []
        start_time = time.time()
        print(item)
        for i in range(repeat_num):
            result_phase_num = terminating_nested_phase_judge(interface, curr_boogie_program)
            result_num_list.append(result_phase_num)
            print("parsed result phase num: " + str(result_phase_num))
        
        end_time = time.time()
        processing_time = end_time - start_time
        print("total time: " + str(round(processing_time, 2)))
        result_list.append((item, result_num_list, round(processing_time, 2)))

    f.close()
    print(result_list)
    csv_f = open(result_csv_file_path, "w")
    for result_tuple in result_list:
        csv_f.write(result_tuple[0])
        for num in result_tuple[1]:
            csv_f.write("," + str(num))
        csv_f.write(",")
        csv_f.write(str(result_tuple[2]))
        csv_f.write("\n")
    csv_f.close()

def run_svmranker_nested_phase_judge_rem(interface, llm_model_chosen):
    result_list = []
    result_csv_file_path = os.path.join(NESTED_PHASE_JUDGE_Exp_Result_folder, 
                                        "rem_result_" + llm_model_chosen + ".csv")
    for item in os.listdir(NESTED_PHASE_JUDGE_program_folder):
        ref_str = item.split("_", 1)[0]
        real_file_name = item.split("_", 1)[1]
        name_without_ext, ext = os.path.splitext(real_file_name)
        if name_without_ext.isdigit():
            continue
        f = open(os.path.join(NESTED_PHASE_JUDGE_program_folder, item))
        curr_boogie_program = f.read()
        repeat_num = 3
        result_num_list = []
        start_time = time.time()
        print(item)
        for i in range(repeat_num):
            result_phase_num = terminating_nested_phase_judge(interface, curr_boogie_program)
            result_num_list.append(result_phase_num)
            print("parsed result phase num: " + str(result_phase_num))
        
        end_time = time.time()
        processing_time = end_time - start_time
        print("total time: " + str(round(processing_time, 2)))
        result_list.append((item, result_num_list, round(processing_time, 2)))

    f.close()
    print(result_list)
    csv_f = open(result_csv_file_path, "w")
    for result_tuple in result_list:
        csv_f.write(result_tuple[0])
        for num in result_tuple[1]:
            csv_f.write("," + str(num))
        csv_f.write(",")
        csv_f.write(str(result_tuple[2]))
        csv_f.write("\n")
    csv_f.close()
def run_svmranker_multi_phase_judge(interface):
    result_list = []
    result_csv_file_path = os.path.join(MULTI_PHASE_JUDGE_Exp_Result_folder, "result.csv")
    for item in os.listdir(MULTI_PHASE_JUDGE_program_folder):
        ref_str = item.split("_")[0]
        f = open(os.path.join(MULTI_PHASE_JUDGE_program_folder, item))
        curr_boogie_program = f.read()
        repeat_num = 3
        result_num_list = []
        start_time = time.time()
        print(item)
        for i in range(repeat_num):
            result_phase_num = terminating_multi_phase_judge(interface, curr_boogie_program)
            result_num_list.append(result_phase_num)
            print("parsed result phase num: " + str(result_phase_num))
        end_time = time.time()
        processing_time = end_time - start_time
        print("total time: " + str(round(processing_time, 2)))
        result_list.append((item, result_num_list, round(processing_time, 2)))

    f.close()
    print(result_list)
    csv_f = open(result_csv_file_path, "w")
    for result_tuple in result_list:
        csv_f.write(result_tuple[0])
        for num in result_tuple[1]:
            csv_f.write("," + str(num))
        csv_f.write(",")
        csv_f.write(str(result_tuple[2]))
        csv_f.write("\n")
    csv_f.close()

def termtype_process(interface, program):
    termination_answer = interface.ask_question_of_ranking_function_type(program)
    termination_answer_content = termination_answer.content
    
    termination_result = parse_ranking_output(termination_answer_content)
    termination_result["raw_response"] = termination_answer_content
    return termination_result
        
def strategy_process(interface, program):
    """
    分析程序的终止策略类型
    返回: (strategy_type, phase_num) 或 ("NONTERM", reason)
    """
    try:
        termination_answer = interface.ask_question_of_ranking_function_type(program)
        termination_answer_content = termination_answer.content
        
        termination_result = parse_ranking_output(termination_answer_content)
        
        if termination_result["status"] == "NONTERM":
            # 处理非终止情况
            return ("NONTERM", termination_result["kind"])
            
        elif termination_result["status"] == "TERM":
            if termination_result["kind"] == "Single":
                return ("Single", 1)
            elif termination_result["kind"] == "Multi":  
                phase_num = terminating_multi_phase_judge(interface, program)
                if phase_num is None or phase_num < 0:
                    return ("BACKTRACK", -1)
                else:
                    return ("Multi", phase_num)
            elif termination_result["kind"] == "Nested":
                phase_num = terminating_nested_phase_judge(interface, program)
                if phase_num is None or phase_num < 0:
                    return ("BACKTRACK", -1)
                else:
                    return ("Nested", phase_num)
            elif termination_result["kind"] == "Other":
                return ("Other", 0)
            else:
                print(f"ERROR: unknown termination type: {termination_result['kind']}")
                return ("UNKNOWN", -1)
        else:
            print(f"ERROR: unknown status: {termination_result['status']}")
            return ("ERROR", -1)
            
    except Exception as e:
        print(f"Error in strategy_process: {str(e)}")
        return ("ERROR", -1)


def run_svmranker_termtype_judge(interface, llm_model_chosen):
    '''
    预计用于判定 终止类型TermType
        如 NonTerm 或者 Term
        Term    进一步判断 Single or Nested or Multi or Other
        NonTerm 进一步判断 RECUR or MONO or OTHER
    Strategy:
        是TermType的分析结果;
    '''
    os.makedirs(TERMTYPE_Exp_folder, exist_ok=True)
    prefix = "llm_termtype_"
    # 分Term和NonTerm，然后csv记录细分 Single Nested ...
    categories = ["TERM", "NONTERM", "ERROR"]
    # for category in categories:
    #     os.makedirs(os.path.join(TERMTYPE_Exp_folder, category), exist_ok=True)
    result_csv_path = os.path.join(TERMTYPE_Exp_folder, 
                                   prefix+"result_" + llm_model_chosen +".csv")

    with open(result_csv_path, 'w', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['file_name', 'original_path', 'predicted_status', 'predicted_kind', 
                     'category_folder', 'processing_time', 'is_consistent', 'repeat_results', 
                     'raw_responses']
        csv_writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        csv_writer.writeheader()
    
    # 路径需要自己进行定义和更换；目前字面量形式写定
    # 写定为LLM_Phase_Exp下的nested和multi
    all_programs = []
    seen_files = set()  # 用于去重，存储已经见过的文件名

    nested_path = os.path.join("LLM_Phase_Exp", "4-nested-terminate")
    if os.path.exists(nested_path):
        for item in os.listdir(nested_path):
            if item.endswith(('.c', '.cpp', '.bpl', '.smt2')):
                all_programs.append((os.path.join(nested_path, item), item, 'KNOWN_NESTED'))
                seen_files.add(item)
    multi_path = os.path.join("LLM_Phase_Exp", "4-multi-terminate")
    if os.path.exists(multi_path):
        for item in os.listdir(multi_path):
            if item.endswith(('.c', '.cpp', '.bpl', '.smt2')) and item not in seen_files:
                all_programs.append((os.path.join(multi_path, item), item, 'KNOWN_MULTI'))
                seen_files.add(item)
    print(f"[Info] Found {len(all_programs)} programs to analyze for termtype")
    print(f"[Info] Duplicates removed, nested priority maintained")

    #all_programs = all_programs[:2]  # For testing, limit to first 2 programs
    
    for idx, (file_path, file_name, source_category) in enumerate(all_programs):
        print(f"[Info] Processing ({idx+1}/{len(all_programs)}) {source_category} program: {file_name}")
        start_time = time.time()
        with open(file_path, 'r', errors='ignore') as f:
            curr_program = f.read()

        repeat_num = 3
        termtype_results = []
        raw_responses = []
        for i in range(repeat_num):
            print(f"[INFO]  Round {i+1}/{repeat_num}...")
            termtype_result = termtype_process(interface, curr_program)
            termtype_results.append((termtype_result["status"], termtype_result["kind"]))
            raw_responses.append(termtype_result.get("raw_response", ""))
            print(f"[RES]    Result: {termtype_result['status']} - {termtype_result['kind']}")
        end_time = time.time()
        processing_time = end_time - start_time
        # time.sleep(300)
        # processing_time = repeat_num using llm, so we can average it
        # turn list to set, get consistent
        is_consistent = len(set(termtype_results)) == 1 

        final_status, final_kind = termtype_results[0] if termtype_results else ("ERROR", "UNKNOWN")
        if final_status == "TERM":
            category_folder = f"TERM"
        elif final_status == "NONTERM":
            category_folder = f"NONTERM"
        else:
            category_folder = "ERROR"

        with open(result_csv_path, 'a', newline='', encoding='utf-8') as csvfile:
            csv_writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
            csv_writer.writerow({
                'file_name': file_name,
                'original_path': file_path,
                'predicted_status': final_status,
                'predicted_kind': final_kind,
                'category_folder': category_folder,
                'processing_time': round(processing_time, 2),
                'is_consistent': is_consistent,
                'repeat_results': str(termtype_results),
                'raw_responses': str(raw_responses)
            })
        
        print(f"[RES]  Final Result: {final_status} - {final_kind}")
        print(f"[OUT]  Saved to: {category_folder}")
        print(f"[OUT]  Consistent: {is_consistent}, Time: {processing_time:.2f}s")
        print()

    print(f"\n[OUT] Termtype analysis completed!")
    print(f"[OUT]Results saved to: {result_csv_path}")



def run_svmranker_strategy_judge(interface):
    # TODO
    result_csv_path = os.path.join(STRATEGY_Exp_folder, "result.csv")
    pass


def performance_monitor(func):
    """
    装饰器: 用于监控函数的执行时间、CPU和内存使用情况。
    """
    @wraps(func)
    def wrapper(*args, **kwargs):
        process = psutil.Process(os.getpid())
        
        psutil.cpu_percent(interval=None)
        start_time = time.time()

        ## Main
        result = func(*args, **kwargs)
        ##

        end_time = time.time()
        cpu_usage = psutil.cpu_percent(interval=None)
        mem_usage_mb = process.memory_info().rss / (1024 * 1024)

        print("\n--- Performance Metrics ---")
        print(f"  Function: '{func.__name__}'")
        print(f"  Execution Time: {end_time - start_time:.4f} seconds")
        print(f"  CPU Usage during execution: {cpu_usage}%")
        print(f"  Memory Usage (RSS): {mem_usage_mb:.2f} MB")
        print("---------------------------\n")
        
        return result
    return wrapper

def batch_run_full_pipeline(interface, folder):
    """
    批量为 folder 中的所有 .bpl 文件运行完整的分析流程。
    """
    print("--- Starting Batch Full Analysis Pipeline ---")
    if not os.path.exists(folder):
        print(f"[ERROR] Validation folder not found: {folder}")
        return

    all_bpl_files = [f for f in os.listdir(folder) if f.endswith(".bpl")]
    
    if not all_bpl_files:
        print(f"[INFO] No .bpl files found in {folder}")
        return

    print(f"[INFO] Found {len(all_bpl_files)} .bpl files to process.")

    for i, file_name in enumerate(all_bpl_files):
        file_path = os.path.join(folder, file_name)
        print(f"\n--- Processing file {i+1}/{len(all_bpl_files)}: {file_name} ---")
        try:
            run_full_analysis_pipeline(interface, file_path)
        except Exception as e:
            print(f"[ERROR] An unexpected error occurred while processing {file_name}: {e}")
    
    print("\n--- Batch Full Analysis Pipeline Finished ---")

@performance_monitor
def run_full_analysis_pipeline(interface, program_path):
    print(f"--- Starting Full Analysis Pipeline for: {program_path} ---")
    try:
        with open(program_path, 'r', errors='ignore') as f:
            program_content = f.read()
    except FileNotFoundError:
        print(f"[ERROR] File not found: {program_path}")
        return

    print("[INFO] Running pipeline...")
    # 第一部分：多次调用大模型，单纯判断是否终止(Term|NonTerm)
    repeat_num = 3
    term_results = []
    llm_start_time = time.time()
    for _ in range(repeat_num):
        term_answer = interface.ask_boogie_is_terminating(program_content)
        try:
            is_terminating, is_unknown, _, _ = parse_llm_result(term_answer.content)
        except Exception as e:
            print(f"[ERROR] Failed to parse termination result: {e}")
            return
        term_results.append(is_terminating)
    false_num = 0
    true_num = 0
    print(term_results)
    for term_res in term_results:
        if term_res:
            true_num = true_num + 1
        else:
            false_num = false_num + 1
    
    if true_num > false_num:
        final_is_terminating = True
    else:
        final_is_terminating = False
    print("final: " + str(final_is_terminating))
    # 第二部分，知道终止性
    print(f"[INFO] Termination judgement: {final_is_terminating}")
    llm_time = 0
    if final_is_terminating:
        # 进一步判断是否 single ranking function
        repeat_num = 1 # 目前只用一次判断，暂时不重复判断single情况
        single_results = []
        single_answer = interface.ask_boogie_is_single_ranking_function(program_content)

        llm_end_time = time.time()
        llm_time = llm_end_time - llm_start_time
        is_single, _, _, _ = parse_llm_result(single_answer.content)
        print(f"[INFO] Single ranking function judgement: {is_single}")

        if is_single:
            print("[INFO] 调用 SVMRanker 4-nested")
            SVMRanker(program_path, program_content, "Nested", 4, True, "4-nested", llm_time)
        else:
            print("[INFO] 调用 SVMRanker 4-multi")
            SVMRanker(program_path, program_content, "Multi", 4, True, "4-multi", llm_time)
    else:
        llm_end_time = time.time()
        llm_time = llm_end_time - llm_end_time
        print("[INFO] 非终止，调用 SVMRanker 1-nested")
        SVMRanker(program_path, program_content, "Nested", 1, False, "1-nested", llm_time)
    print(f"--- Full Analysis Pipeline Finished for: {program_path} ---")

def batch_run_known_term_RF_type(interface, folder, csv_file, mode, 
                                 llm_model_chosen = 'claude3.7'):
    print("--- Starting Batch Known Termination RF Type Judgement ---")
    if not os.path.exists(folder):
        print(f"[ERROR] Validation folder not found: {folder}")
        return
    if not os.path.exists(csv_file):
        print(f"[ERROR] CSV file not found: {csv_file}")
        return
    try:
        with open(csv_file, 'r', newline='', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            data = list(reader)
            fieldnames = reader.fieldnames
    except Exception as e:
        print(f"[ERROR] Failed to read CSV file {csv_file}: {e}")
        return
    if 'file_name' not in fieldnames:
        print(f"[ERROR] 'file_name' column not found in {csv_file}")
        return
    print(f"[INFO] Found {len(data)} rows in {csv_file} to process.")
    
    base_name = f'{llm_model_chosen}_{mode}'
    col_type = f'{base_name}_rf_type'
    col_avg_time = f'{base_name}_avg_time'
    col_consistent = f'{base_name}_consistent'
    col_results = f'{base_name}_results'
    col_times = f'{base_name}_times'
    
    new_cols = [col_type, col_avg_time, col_consistent, col_results, col_times]
    for col in new_cols:
        if col not in fieldnames:
            fieldnames.append(col)

    for i, row in enumerate(data):
        file_name = row.get('file_name')
        if not file_name:
            print(f"[WARN] Skipping row {i+1} due to empty file_name.")
            continue
        file_path = os.path.join(folder, file_name)
        print(f"\n--- Processing file {i+1}/{len(data)}: {file_name} ---")
        if os.path.exists(file_path):
            try:
                with open(file_path, 'r', errors='ignore') as f:
                    program_content = f.read()
                
                final_type, avg_time, is_consistent, results_tuple, times_tuple = known_term_run_RF_type(interface, program_content, mode)
                
                row[col_type] = final_type
                row[col_avg_time] = f"{avg_time:.2f}"
                row[col_consistent] = is_consistent
                row[col_results] = str(results_tuple)
                row[col_times] = str(tuple(f"{t:.2f}" for t in times_tuple))

            except Exception as e:
                print(f"[ERROR] An unexpected error occurred while processing {file_name}: {e}")
                row[col_type] = "ERROR"
                row[col_avg_time] = "ERROR"
                row[col_consistent] = "ERROR"
                row[col_results] = "ERROR"
                row[col_times] = "ERROR"
        else:
            print(f"[WARN] File not found: {file_path}")
            for col in new_cols:
                row[col] = "FILE_NOT_FOUND"
    
    try:
        with open(csv_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(data)
        print(f"\n[SUCCESS] Finished processing and updated {csv_file}")
    except Exception as e:
        print(f"[ERROR] Failed to write updated data to {csv_file}: {e}")

    print("\n--- Batch Known Termination RF Type Judgement Finished ---")

def known_term_run_RF_type(interface, program, mode = "direct"):
    """
    直接判断已知终止程序的 ranking function 类型。
    """
    assert mode in ["direct", "fewshot"], "Mode must be either 'direct' or 'fewshot'."
    print(f"[INFO] Running ranking function type judgement \nfor known terminating program (mode: {mode})...")
    
    repeat_nums = CONST.REPEAT_NUMS
    results = []
    times = []

    for i in range(repeat_nums):
        print(f"[INFO]  Round {i+1}/{repeat_nums}...")
        start_time = time.time()
        result = interface.ask_known_term_RF_type(program, mode=mode)  
        end_time = time.time()
        duration = end_time - start_time
        times.append(duration)
        rf_type = parse_known_term_llm_result(result.content)
        results.append(rf_type)
        print(f"[RESULT] Round {i+1} Result: {rf_type}, Time: {duration:.2f}s")

    is_consistent = len(set(results)) == 1
    average_time = sum(times) / len(times) if times else 0

    final_type = "ERROR"
    if results:
        valid_results = [r for r in results if r != "PARSE_ERROR"]
        if valid_results:
            final_type = max(set(valid_results), key=valid_results.count)

    print(f"[SUMMARY] Final Type: {final_type}, Avg Time: {average_time:.2f}s, Consistent: {is_consistent}")
    
    return final_type, average_time, is_consistent, tuple(results), tuple(times)

def batch_run_known_nonterm_RF_type(interface, folder, csv_file, 
                                    llm_model_chosen = None):
    """
    批量为文件夹中的非终止程序运行类型判断
    """
    print("--- Starting Batch Known Nontermination Type Judgement ---")
    if not os.path.exists(folder):
        print(f"[ERROR] Validation folder not found: {folder}")
        return
    if not os.path.exists(csv_file):
        print(f"[ERROR] CSV file not found: {csv_file}")
        return
    
    try:
        with open(csv_file, 'r', newline='', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            data = list(reader)
            fieldnames = reader.fieldnames
    except Exception as e:
        print(f"[ERROR] Failed to read CSV file {csv_file}: {e}")
        return
    
    if 'filename' not in fieldnames:
        print(f"[ERROR] 'filename' column not found in {csv_file}")
        return
    
    print(f"[INFO] Found {len(data)} rows in {csv_file} to process.")
    
    base_name = f'{llm_model_chosen or "default"}'
    col_type = f'{base_name}_nonterm_type'
    col_avg_time = f'{base_name}_avg_time'
    col_consistent = f'{base_name}_consistent'
    col_results = f'{base_name}_results'
    col_times = f'{base_name}_times'
    
    new_cols = [col_type, col_avg_time, 
                col_consistent, col_results, 
                col_times]
    for col in new_cols:
        if col not in fieldnames:
            fieldnames.append(col)
            print(f"  [INFO] add column {col}")

    error_cnt = 0 # 记录error数量，如果连续五个都error了，可能出了问题，停止程序
    for i, row in enumerate(data):
        file_name = row.get('filename')
        if not file_name:
            print(f"[WARN] Skipping row {i+1} due to empty file_name.")
            continue
        
        file_path = os.path.join(folder, file_name)
        print(f"\n--- Processing file {i+1}/{len(data)}: {file_name} ---")
        
        if os.path.exists(file_path):
            try:
                with open(file_path, 'r', errors='ignore') as f:
                    program_content = f.read()
                
                final_type, avg_time, is_consistent, results_tuple, times_tuple = known_nonterm_run_type(
                    interface, program_content, llm_model_chosen)
                
                row[col_type] = final_type
                row[col_avg_time] = f"{avg_time:.2f}"
                row[col_consistent] = is_consistent
                row[col_results] = str(results_tuple)
                row[col_times] = str(tuple(f"{t:.2f}" for t in times_tuple))

            except Exception as e:
                print(f"[ERROR] An unexpected error occurred while processing {file_name}: {e}")
                row[col_type] = "ERROR"
                row[col_avg_time] = "ERROR"
                row[col_consistent] = "ERROR"
                row[col_results] = "ERROR"
                row[col_times] = "ERROR"
                error_cnt += 1
        else:
            print(f"[WARN] File not found: {file_path}")
            for col in new_cols:
                row[col] = "FILE_NOT_FOUND"
        if error_cnt >= 5 :
            print("#"*40)
            raise ValueError(f"Have solved {error_cnt} Errors while processing nonterm\
                             \n with model {llm_model_chosen}, \n need manual CHECK")
    
    try:
        with open(csv_file, 'w', newline='', encoding='utf-8') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(data)
        print(f"\n[SUCCESS] Finished processing and updated {csv_file}")
    except Exception as e:
        print(f"[ERROR] Failed to write updated data to {csv_file}: {e}")

    print("\n--- Batch Known Nontermination Type Judgement Finished ---")

def known_nonterm_run_type(interface, program, llm_model_chosen):
    """
    直接判断已知非终止程序的 nontermination type。
    """
    print("[INFO] Running nontermination type judgement for known nonterminating program...")
    
    repeat_nums = CONST.REPEAT_NUMS
    results = []
    times = []

    for i in range(repeat_nums):
        print(f"[INFO]  Round {i+1}/{repeat_nums}...")
        start_time = time.time()
        # 调用相应的接口
        answer = interface.ask_known_nonterm_type(program, 
                                                  llm_model_chosen=llm_model_chosen)
        duration = time.time() - start_time
        times.append(duration)

        nonterm_type = parse_known_nonterm_llm_result(answer.content)
        results.append(nonterm_type)
        print(f"[RESULT] Round {i+1} Result: {nonterm_type}, Time: {duration:.2f}s")

    is_consistent = len(set(results)) == 1
    average_time = sum(times) / len(times) if times else 0.0

    # 统计出现次数最多的合法结果（排除 PARSE_ERROR）
    counter = Counter(r for r in results if r != "PARSE_ERROR")
    final_type = counter.most_common(1)[0][0] if counter else "ERROR"

    print(f"[SUMMARY] Final Type: {final_type}, Avg Time: {average_time:.2f}s, Consistent: {is_consistent}")
    
    # 返回：最终类型、平均耗时、是否一致、所有轮次结果、所有轮次耗时
    return final_type, average_time, is_consistent, tuple(results), tuple(times)

if __name__ == "__main__":
    interface = chat_interface()
    interface.set_up_open_router_configs()

    parser = argparse.ArgumentParser(
        description="Call functionalities depending on the --mode argument"
    )

    parser.add_argument(
        "--mode",
        choices=CONST.CHOICES,
        required=True,
        help="NAIVE: run llm termination naive experiment on TPDB_Certains; "
             "NESTED_PHASE: run nested judgement on termination result of nested cases in SVMRanker"
    )
    parser.add_argument(
        "--bpl",
        type=str,
        required=False,
        help="Path to the input .bpl file for FULL_PIPELINE mode."
    )
    parser.add_argument(
        '--input_folder', '-i',
        help='(for BATCH_PIPE) folder containing .bpl files'
    )
    args = parser.parse_args()

    if args.mode == "NAIVE":
        run_certain_experiments(interface)
    elif args.mode == "NESTED_PHASE":
        run_svmranker_nested_phase_judge(interface)
    elif args.mode == "NESTED_PHASE_REM":
        run_svmranker_nested_phase_judge_rem(interface)
    elif args.mode == "MULTI_PHASE":
        run_svmranker_multi_phase_judge(interface)
    elif args.mode == "STRATEGY":
        run_svmranker_strategy_judge(interface)
    elif args.mode == "TERM_TYPE":
        run_svmranker_termtype_judge(interface)
    elif args.mode == "FULL_PIPE":
        if not args.bpl:
            print("Error: --file argument is required for FULL_PIPELINE mode.")
            sys.exit(1)
        if not args.bpl.endswith(".bpl"):
            print("Error: --file must be a .bpl file.")
            sys.exit(1)
        run_full_analysis_pipeline(interface, args.bpl)
    elif args.mode == "BATCH_PIPE":
        folder = args.input_folder
        if not folder:
            parser.error("--input_folder is required for BATCH_PIPE mode")
        if not os.path.isdir(folder):
            parser.error(f"The path '{folder}' is not a valid directory")
        batch_run_full_pipeline(interface, folder)
    elif args.mode == "BATCH_TERMED_TYPE":
        folder = args.input_folder
        if not folder:
            parser.error("--input_folder is required for BATCH_PIPE mode")
        batch_run_known_term_RF_type(interface, folder, 
                                     "LLM_Termtype_Exp/benchmark_TERM_86_rem.csv", 
                                     "direct",
                                     "o1mini")
        batch_run_known_term_RF_type(interface, folder, 
                                     "LLM_Termtype_Exp/benchmark_TERM_86_rem.csv", 
                                     "fewshot",
                                     "o1mini")
    elif args.mode == "NONTERM_TYPE":
        folder = args.input_folder
        print("NONTERM_TYPE is not supported yet...")
    elif args.mode == "BATCH_NONTERM_TYPE":
        folder = args.input_folder
        if not folder:
            parser.error("--input_folder is required for BATCH_NONTERM_TYPE mode")
        #MODEL_LIST = ["claude3.7", "gpt-4o", "gpt-o4-mini"]
        MODEL_LIST = ["gpt-o4-mini"]
        for llm_name in MODEL_LIST:
            batch_run_known_nonterm_RF_type(interface, 
                                            folder, 
                                            "TPDB_NO/TPDB_Nonterm_categorization.csv", 
                                            llm_name)

        
    # program = "	int main() {\n"\
    # "	int x, y, z;\n"	\
    # "		while (z > 0) {\n"\
    # "			x = x + z;\n"\
    # "			z = z - 1;\n"\
    # "		}\n"\
	# "}\n"

    #exp_result = run_experiment_for_program(interface, "test_file_name.c", program, True, False, 2)
    #print(exp_result)