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

# Optional: choose provider (default: openrouter)
# interface = chat_interface(provider="ali")  # uses src_llm_rf_tpl/llmconfig.json by default
# Or via env:
# export LLM_PROVIDER=ali
# export LLM_CONFIG_PATH=/path/to/llmconfig.json

# 2. Run Pipeline
# Defaults to robust mode (Fixed Depth 4)
run_full_pipeline_with_svm(interface, "path/to/your/program.bpl")

# Or use inferred depth
run_full_pipeline_with_svm(interface, "path/to/your/program.bpl", use_inference_depth=True)
```

## CLI

Run from the repo root:

```bash
python3 src_llm_rf_tpl/run_pipeline.py path/to/your/program.bpl
```

Choose provider and config (optional):

```bash
python3 src_llm_rf_tpl/run_pipeline.py path/to/your/program.bpl --provider ali --config src_llm_rf_tpl/llmconfig.json
```

## Environment Setup

Ensure you have your API key set up (see `utils.py`) and the SVMRanker path configured (see `svm_ranker_adapter.py` or set `SVMRANKER_ROOT_PATH` env var).
