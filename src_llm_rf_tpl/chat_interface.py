import json
import os

from openai import OpenAI
from src_llm_rf_tpl.utils import load_api_key, remove_comments
import src_llm_rf_tpl.const_prompts as PROMPTS
import src_llm_rf_tpl.const as CONST

LLM_MODEL_NAME = CONST.LLM_MODEL_NAMES['claude3.7']

class chat_interface:
    def __init__(self, provider=None, config_path=None) -> None:
        self.msg_list = []
        self.client = None
        self.request_overrides = {}
        self.default_model_name = LLM_MODEL_NAME

        resolved_provider = (provider or os.getenv("LLM_PROVIDER") or "openrouter").lower()
        resolved_config_path = config_path or os.getenv("LLM_CONFIG_PATH")
        self.set_up_configs(resolved_provider, resolved_config_path)

    def set_up_configs(self, provider, config_path=None):
        if provider in ("openrouter", "open_router"):
            self.set_up_open_router_configs()
            return
        if provider in ("aiproxy", "api_proxy", "default"):
            self.set_up_aiproxy_configs()
            return
        if provider in ("ali", "qwen", "dashscope"):
            if not config_path:
                config_path = os.path.join(os.path.dirname(__file__), "llmconfig.json")
            self.set_up_ali_configs(config_path)
            return
        raise ValueError(f"Unknown provider: {provider}")

    def set_up_aiproxy_configs(self):
        self.client = OpenAI(
            api_key=load_api_key(),
            base_url="https://api.aiproxy.io/v1"
        )

    def set_up_open_router_configs(self):
        self.client = OpenAI(
            api_key=load_api_key(),
            base_url="https://openrouter.ai/api/v1"
        )

    def set_up_default_configs(self):
        self.client = OpenAI(
            api_key=load_api_key(),
            base_url="https://api.aiproxy.io/v1"
        )

    def set_up_ali_configs(self, config_path):
        config = self._load_llm_config(config_path)
        api_key = config.get("api_key") or load_api_key()
        base_url = config.get("baseurl")
        if not base_url:
            raise ValueError(f"Missing baseurl in config: {config_path}")
        self.client = OpenAI(
            api_key=api_key,
            base_url=base_url
        )
        model = config.get("model")
        if model:
            self.default_model_name = model
        payload_template = config.get("payload_template", {})
        if payload_template and not isinstance(payload_template, dict):
            raise ValueError(f"payload_template must be a dict: {config_path}")
        self.request_overrides = payload_template or {}

    def _load_llm_config(self, config_path):
        try:
            with open(config_path, "r", encoding="utf-8") as f:
                return json.load(f)
        except FileNotFoundError as exc:
            raise FileNotFoundError(f"LLM config not found: {config_path}") from exc
        except json.JSONDecodeError as exc:
            raise ValueError(f"Invalid JSON in LLM config: {config_path}") from exc

    def ask_question_with_role_no_history_and_record(self, 
                                                     role_prompt, 
                                                     content,
                                                     llm_model_chosed=None):
        self.msg_list.clear() # clear history for this specific mode
        self.msg_list.append({"role": "system", "content": role_prompt})
        self.msg_list.append({"role": "user", "content": content})
        if llm_model_chosed is None:
            llm_model_chosed = self.default_model_name
        res = self.client.chat.completions.create(
            model=llm_model_chosed,
            messages=self.msg_list,
            **self.request_overrides
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
