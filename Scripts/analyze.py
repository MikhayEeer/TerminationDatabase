import os
import sys

from openai import OpenAI

secrete = ""
chatgpt_model = "openai/gpt-4o"

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
        "if the program is non-terminating, you only needs to output: [RESULT]\nNONTERM\n[REASON]\nxxx\n, where xxx should be a very concise explanation.\n" 
        # "if you cannot decide, then you should output [RESULT]\nUNKNOWN\n"

        answer = self.ask_question_with_role_and_record(role_prompt, program)
        print(answer.content)
        return answer
    

if __name__ == "__main__":
    interface = chat_interface()
    interface.set_up_open_router_configs()
    program = "	int main() {\n"\
    "	int x, y, z;\n"	\
    "		while (z > 0) {\n"\
    "			x = x + z;\n"\
    "			z = z - 1;\n"\
    "		}\n"\
	"}\n"
    interface.ask_naive_question_of_termination(program)
        


