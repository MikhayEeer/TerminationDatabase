import os
import sys
import time
import csv
import argparse
import re
from typing import TypedDict, Literal
from datetime import datetime

from openai import OpenAI

from utils import load_api_key

secrete = load_api_key()
gpt_4o_model_name = "openai/gpt-4o"
gpt_o4_mini_model_name = "openai/o4-mini"
claude_model_name = "anthropic/claude-3.7-sonnet"
gemini_model_name = "google/gemini-2.5-pro-preview"
deepseek_model_name = "deepseek/deepseek-r1-0528"

llm_model_name = claude_model_name

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
            model=llm_model_name,
            messages=[{"role": "user", "content": content}]
        )
        answer = res.choices[0].message
        self.msg_list.append(answer)
        return answer
    
    def ask_question_with_role_and_record(self, role_prompt, content):
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=llm_model_name,
            messages=self.msg_list
        )
        answer = res.choices[0].message
        self.msg_list.append(answer)
        return answer
    
    def ask_question_with_role_no_history_and_record(self, role_prompt, content):
        self.msg_list.clear()
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=llm_model_name,
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
        "where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.\n"

        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(f"[ANS] \n\t{answer.content} \n[ANS END]")
        return answer

    def ask_question_of_nested_phase_judge(self, program):
        role_prompt = "You are an expert of program termination analysis. In the following you will be given a loop program in Boogie which is terminating." \
        "You will judge the number of phases needed for  nested-ranking function to prove the termination of the loop program," \
        "you should give the minimum number of phases needed for the nested ranking function to work.\n" \
        "The definition of nested ranking function is: <f1, f2, ..., fn> where n is the number of phases and  for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction"\
        "over the program variables vec(x) and there exists a positive real number C, such that f1(x) - f1(x') >= C, fi(x) - fi(x') + f_(i-1)(x) >= C for i ∈ {2, . . . , k} and fk(x) >= C"\
        "where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.\n"\
        "The output you provide shoude in the format strictly:  [PHASE_NUM]k\n, where k is the number of minimum phase needed, notice that if the termination can be prove by one ranking function the phase num is 1. DO NOT GENERATE EXPLANATION!!"
        backloop_prompt = "If you deem the program nonterminating, just output [NONTERM] without any explanation."
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(answer.content)
        return answer
    
    def ask_question_of_multi_phase_judge(self, program):
        role_prompt = "You are an expert of program termination analysis. In the following you will be given a loop program in Boogie which is terminating." \
        "You will judge the number of phases needed for multi-phase function to prove the termination of the loop program," \
        "you should give the minimum number of phases needed for the multi-phase ranking function to work\n" \
        "The definition of multi-phase ranking function is: <f1, f2, ..., fn> where n is the number of phases and  for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction" \
        "over the program variables vec(x) and we require that there exists an index i ∈ {1, . . . , k} and a constant C such that: f_i(x) >= C and f1(x) - f1(x') >= C and for all j < i we have f_j(x) < 0" \
        "where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.\n"\
        "The output you provide shoude in the format strictly:  [PHASE_NUM]k\n, where k is the number of minimum phase needed, notice that if the termination can be prove by one ranking function then the phase num is 1. DO NOT GENERATE EXPLANATION!!"
        backloop_prompt = "If you deem the program nonterminating, just output [NONTERM] without any explanation."
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        print(answer.content)
        return answer
    

def parse_llm_result(result_str):
    rf_type_str = ""
    rf_content_str = ""
    result_lines = str.split(result_str, "\n")
    is_collecting_result = False
    is_terminating = False
    is_unknown = False
    is_collecting_RF_Type = False
    is_collecting_RF =  False
    parse_failed = False
    for line in result_lines:
        if  "[RESULT]" in line:
            is_collecting_result = True
            continue
        elif "[RANKING FUNCTION TYPE]" in line:
            if is_terminating:
                is_collecting_RF_Type = True
            else:
                break
            continue
        elif "[RANKING FUNCTIONS]" in line:
            is_collecting_RF_Type = False
            is_collecting_RF = True
            continue

        if is_collecting_result:
            if "TERMINATE" in line:
                is_terminating = True
                is_collecting_result = False
            elif "NONTERM" in line:
                is_terminating = False
                is_collecting_result = False
            elif "UNKNOWN" in line:
                is_terminating = False
                is_unknown = True
                is_collecting_result = False
            else:
                print("[Error] : llm result parsing error")
                parse_failed = True

        if is_terminating and is_collecting_RF_Type:
            rf_type_str = rf_type_str + line.strip()
        
        if is_terminating and is_collecting_RF:
            rf_content_str = rf_content_str + line.strip()
    if parse_failed:
        raise ValueError("ERROR: llm result parsing error")

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

    Expected formats:
      [TERM] <Single|Nested|Multi|Other>
      [NONTERM] <RECUR|MONO|OTHER>
    """
    # 去除首尾空白
    text = output.strip()
    # 正则搜索 [TERM] 或 [NONTERM]，后面跟一个单词（使用search而不是match）
    m = re.search(r'\[(TERM|NONTERM)\]\s*(\w+)', text, re.IGNORECASE)
    if not m:
        raise ValueError(f"无法解析输出: {output!r}")
    status = m.group(1).upper()
    kind   = m.group(2)
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
    answer = interface.ask_question_of_nested_phase_judge(boogie_program)
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


def run_svmranker_termtype_judge(interface):
    '''
    预计用于判定 终止类型TermType
        如 NonTerm 或者 Term
        Term    进一步判断 Single or Nested or Multi or Other
        NonTerm 进一步判断 RECUR or MONO or OTHER
    Strategy:
        是TermType的分析结果;
    '''
    os.makedirs(TERMTYPE_Exp_folder, exist_ok=True)
    # 分Term和NonTerm，然后csv记录细分 Single Nested ...
    categories = ["TERM", "NONTERM", "ERROR"]
    for category in categories:
        os.makedirs(os.path.join(TERMTYPE_Exp_folder, category), exist_ok=True)
    result_csv_path = os.path.join(TERMTYPE_Exp_folder, "llm_claude3.7_termtype_result.csv")

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

    # all_programs = all_programs[:2]  # For testing, limit to first 2 programs
    
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


if __name__ == "__main__":
    interface = chat_interface()
    interface.set_up_open_router_configs()
    CHOICES = ["NAIVE", "NESTED_PHASE", "MULTI_PHASE","STRATEGY", "TERM_TYPE"]

    parser = argparse.ArgumentParser(
        description="Call functionalities depending on the --mode argument"
    )

    parser.add_argument(
        "--mode",
        choices=CHOICES,
        required=True,
        help="NAIVE: run llm termination naive experiment on TPDB_Certains; "
             "NESTED_PHASE: run nested judgement on termination result of nested cases in SVMRanker"
    )

    args = parser.parse_args()

    if args.mode == "NAIVE":
        run_certain_experiments(interface)
    elif args.mode == "NESTED_PHASE":
        run_svmranker_nested_phase_judge(interface)
    elif args.mode == "MULTI_PHASE":
        run_svmranker_multi_phase_judge(interface)
    elif args.mode == "STRATEGY":
        run_svmranker_strategy_judge(interface)
    elif args.mode == "TERM_TYPE":
        run_svmranker_termtype_judge(interface)
    # program = "	int main() {\n"\
    # "	int x, y, z;\n"	\
    # "		while (z > 0) {\n"\
    # "			x = x + z;\n"\
    # "			z = z - 1;\n"\
    # "		}\n"\
	# "}\n"

    #exp_result = run_experiment_for_program(interface, "test_file_name.c", program, True, False, 2)
    #print(exp_result)