from openai import OpenAI

from Utils.utils import load_api_key
import Utils.const as CONST
from Utils.const_prompts import PROMPTS

class ChatInterface:
    def __init__(self, _llm_name) -> None:
        self.msg_list = []
        self.llm_name = _llm_name
        self.LLM_MODEL_NAME = CONST.LLM_MODEL_NAMES[_llm_name]
        print(f"Using LLM model: {self.LLM_MODEL_NAME}")
        self.URLs = {
            "openai": "https://api.openai.com/v1",
            "aiproxy": "https://api.aiproxy.io/v1",
            "openrouter": "https://openrouter.ai/api/v1"
        }
        self._show_const_prompts()
        try:
            secrete = load_api_key()
        except Exception as e:
            print(f"Error loading API key: {e}")
            print("Please ensure you have a valid API key set up.")
            print("- [End] - Program will exit now...")
            exit()

    def _show_const_prompts(self):
        print("--------------const prompts--------------")
        for key, value in PROMPTS.items():
            print(f"-[INFO]- Key: {key}")
            print(f"-[INFO]- Description:\n\t{value['description']}")
            if 'parse_pattern' in value:
                print(f"-[INFO]- Parse Pattern:\n\t{value['parse_pattern']}")
            print("-------------------------------------")

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
    
    def set_up_configs(self, url_mode):
        if url_mode not in self.URLs:
            raise ValueError(f"Invalid URL mode: {url_mode}. Available modes: {list(self.URLs.keys())}")
        url = self.URLs[url_mode]
        self.client = OpenAI(
            api_key = self.secrete,
            base_url= url
        )

    def _ask_question_and_record(self, 
                                content, 
                                system_role = None,
                                need_history = True):
        if not need_history:
            self.msg_list.clear()
        if system_role is not None:
            self.msg_list.append({"role": "system", 
                                  "content": system_role})
        self.msg_list.append({"role": "user", 
                              "content": content})
        res = self.client.chat.completions.create(
            model=self.LLM_MODEL_NAME,
            messages=self.msg_list
        )
        answer = res.choices[0].message
        if need_history:
            self.msg_list.append(answer)
        return answer
    
    def ask_question(self,
                     program,
                     prompt_key):
        if prompt_key not in PROMPTS:
            raise ValueError(f"Invalid prompt key: {prompt_key}. Available keys: {list(PROMPTS.keys())}")
        system_role = PROMPTS[prompt_key]['prompt']
        answer = self._ask_question_and_record(
            content=program,
            system_role=system_role,
            need_history=True
        )
        print('#'*10, f"Answer from LLM {self.llm_name}", '#' * 10)
        print(answer.content)
        print('#'*10, f"END", '#' * 10)
        return answer


class LLMResultsParser:
    pass