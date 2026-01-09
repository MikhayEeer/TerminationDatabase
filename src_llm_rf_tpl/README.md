# LLM RF Template & SVM Ranker Integration

This module extracts the core logic for:
1. Inferring Termination Ranking Function Templates (Single, Nested, Multi-phase) using LLM.
2. Inferring Phase Depth (Number of phases) using LLM.
3. Invoking SVMRanker with the inferred parameters.

## Structure

* `const.py`: Constants including LLM model names.
* `const_prompts.py`: Prompts definitions for Boogie analysis.
* `utils.py`: Utility functions (API key loading, comment removal).
* `chat_interface.py`: Interface to communicate with OpenAI/compatible APIs.
* `svm_ranker_adapter.py`: Wrapper to call the external SVMRanker tool.
* `llm_strategy.py`: **Core Logic**. Contains the strategy inference and pipeline execution functions.

## Usage

You can use the `run_full_pipeline_with_svm` function in `llm_strategy.py` to run the analysis on a boogie file.

```python
from src_llm_rf_tpl.chat_interface import chat_interface
from src_llm_rf_tpl.llm_strategy import run_full_pipeline_with_svm

# 1. Initialize Interface
interface = chat_interface()

# 2. Run Pipeline
# Defaults to robust mode (Fixed Depth 4)
run_full_pipeline_with_svm(interface, "path/to/your/program.bpl")

# Or use inferred depth
run_full_pipeline_with_svm(interface, "path/to/your/program.bpl", use_inference_depth=True)
```

## Environment Setup

Ensure you have your API key set up (see `utils.py`) and the SVMRanker path configured (see `svm_ranker_adapter.py` or set `SVMRANKER_ROOT_PATH` env var).
