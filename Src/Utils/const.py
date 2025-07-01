CHOICES = ["NAIVE", "NESTED_PHASE", "MULTI_PHASE",
            "STRATEGY", "TERM_TYPE", "NESTED_PHASE_REM", 
            "FULL_PIPE", "BATCH_PIPE", "BATCH_TERMED_TYPE",
            "NONTERM_TYPE", "BATCH_NONTERM_TYPE"]

REPEAT_NUMS = 3

LLM_MODEL_NAMES = {
    'gpt-4o' : "openai/gpt-4o",
    'gpt-o4-mini': "openai/o4-mini",
    'claude3.7' : "anthropic/claude-3.7-sonnet",
    'gemini-2.5-pro-preview': "google/gemini-2.5-pro-preview",
    'deepseek-r1-0528': "deepseek/deepseek-r1-0528"
}