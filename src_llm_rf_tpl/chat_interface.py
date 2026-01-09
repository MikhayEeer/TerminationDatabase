from openai import OpenAI
from src_llm_rf_tpl.utils import load_api_key, remove_comments
import src_llm_rf_tpl.const_prompts as PROMPTS
import src_llm_rf_tpl.const as CONST

secrete = load_api_key()

LLM_MODEL_NAME = CONST.LLM_MODEL_NAMES['claude3.7']

class chat_interface:
    def __init__(self) -> None:
        self.msg_list = []
        self.client = None
        self.set_up_open_router_configs() # default

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

    def set_up_default_configs(self):
        self.client = OpenAI(
            api_key = secrete,
            base_url="https://api.aiproxy.io/v1"
        )

    def ask_question_with_role_no_history_and_record(self, 
                                                     role_prompt, 
                                                     content,
                                                     llm_model_chosed=LLM_MODEL_NAME):
        self.msg_list.clear() # clear history for this specific mode
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        res = self.client.chat.completions.create(
            model=llm_model_chosed,
            messages=self.msg_list
        )
        answer = res.choices[0].message
        return answer
    
    def ask_question_of_ranking_function_type(self, program):
        role_prompt = PROMPTS.termed_type_direct_judge_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        return answer

    def ask_question_of_nested_phase_judge(self, program):
        role_prompt = PROMPTS.nested_phase_judge_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        return answer
    
    def ask_question_of_multi_phase_judge(self, program):
        role_prompt = PROMPTS.multi_phase_judge_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        return answer

    def ask_boogie_is_terminating(self, program):
        """
        只判断程序是否终止，输出格式严格：
            [RESULT]\n TERMINATE 或 [RESULT]\n NONTERM
        """
        role_prompt = PROMPTS.boogie_is_terminating_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        return answer

    def ask_boogie_is_single_ranking_function(self, program):
        """
        已知程序终止，判断是否可以用 single ranking function 证明。
        输出格式严格：
            [SINGLE]\n YES 或 [SINGLE]\n NO
        """
        role_prompt = PROMPTS.boogie_single_RF_prompt
        answer = self.ask_question_with_role_no_history_and_record(role_prompt, program)
        return answer
