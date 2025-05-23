import os
import sys

from openai import OpenAI

secrete = "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"
chatgpt_model = "openai/gpt-4o"

LLM_results_folder_YES = os.path.join(os.getcwd(), "Results", "LLM_results", "YES")
LLM_results_folder_NO = os.path.join(os.getcwd(), "Results", "LLM_results", "NO")
LLM_results_folder_MAYBE = os.path.join(os.getcwd(), "Results", "LLM_results", "MAYBE")

YES_program_folder = os.path.join(os.getcwd(), "TPDB_YES")
NO_program_folder = os.path.join(os.getcwd(), "TPDB_NO")
MAYBE_program_folder = os.path.join(os.getcwd(), "TPDB_MAYBEs")

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
            model=chatgpt_model,
            messages=[{"role": "user", "content": content}]
        )
        answer = res.choices[0].message
        self.msg_list.append(answer)
        return answer
    
    def ask_question_with_role_and_record(self, role_prompt, content):
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=chatgpt_model,
            messages=self.msg_list
        )
        answer = res.choices[0].message
        self.msg_list.append(answer)
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

        answer = self.ask_question_with_role_and_record(role_prompt, program)
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
    for line in result_lines:
        if  "[RESULT]" in line:
            is_collecting_result = True
            continue
        elif "[RANKING FUNCTION TYPE]" in line:
            is_collecting_result = False
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
            elif "NONTERM" in line:
                is_terminating = False
            elif "UNKNOWN" in line:
                is_terminating = False
                is_unknown = True
            else:
                print("ERROR: llm result parsing error")

        if is_terminating and is_collecting_RF_Type:
            rf_type_str = rf_type_str + line.strip()
        
        if is_terminating and is_collecting_RF:
            rf_content_str = rf_content_str + line.strip()

    return (is_terminating, is_unknown, rf_type_str, rf_content_str)
                

def run_experiment_for_program(interface, file_name, curr_program, ref_is_terminating, ref_is_unknown, repeat_num):
    is_stable = True
    final_is_terminating = False
    final_is_unknown = False
    curr_prog_result_list = []
    for i in range(repeat_num):
        ith_response = interface.ask_naive_question_of_termination(curr_program)
        ith_llm_parse_result = parse_llm_result(ith_response.content)
        curr_prog_result_list.append(ith_llm_parse_result)
        for existing_res in curr_prog_result_list:
            if not (existing_res[0] == ith_llm_parse_result[0] and existing_res[1] == ith_llm_parse_result[1]):
                is_stable = False
        if not is_stable:
            return (file_name, is_stable, final_is_terminating, final_is_unknown, ref_is_terminating, ref_is_unknown, repeat_num)
    return (file_name, is_stable, curr_prog_result_list[0][0], curr_prog_result_list[0][1], ref_is_terminating, ref_is_unknown, repeat_num)


    
def run_certain_experiments(interface):
    for item in os.listdir(YES_program_folder):
        curr_yes_file = open(item)
        curr_program = curr_yes_file.read()
        # 
    for item in os.listdir(NO_program_folder):
        print(item)
    print(len(os.listdir(YES_program_folder)))
    print(len(os.listdir(NO_program_folder)))

if __name__ == "__main__":
    interface = chat_interface()
    interface.set_up_open_router_configs()
    # run_certain_experiments(interface)
    program = "	int main() {\n"\
    "	int x, y, z;\n"	\
    "		while (z > 0) {\n"\
    "			x = x + z;\n"\
    "			z = z - 1;\n"\
    "		}\n"\
	"}\n"

    exp_result = run_experiment_for_program(interface, "test_file_name.c", program, True, False, 2)
    print(exp_result)
        


