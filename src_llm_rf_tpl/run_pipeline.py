import argparse
import os
import sys

# Allow running as a script from any working directory.
THIS_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(THIS_DIR)
if REPO_ROOT not in sys.path:
    sys.path.insert(0, REPO_ROOT)

from src_llm_rf_tpl.chat_interface import chat_interface
from src_llm_rf_tpl.llm_strategy import run_full_pipeline_with_svm


def build_parser():
    parser = argparse.ArgumentParser(
        description="Run LLM RF template inference + SVMRanker pipeline."
    )
    parser.add_argument("program", help="Path to input Boogie (.bpl) file")
    parser.add_argument(
        "--provider",
        choices=["openrouter", "ali", "qwen", "dashscope", "aiproxy", "default"],
        default=None,
        help="LLM provider (default: env LLM_PROVIDER or openrouter)",
    )
    parser.add_argument(
        "--config",
        dest="config_path",
        help="Path to llmconfig.json (for Ali/Qwen)",
    )
    parser.add_argument(
        "--infer-depth",
        action="store_true",
        help="Use LLM-inferred depth instead of fixed depth 4",
    )
    return parser


def main():
    parser = build_parser()
    args = parser.parse_args()
    interface = chat_interface(provider=args.provider, config_path=args.config_path)
    run_full_pipeline_with_svm(
        interface,
        args.program,
        use_inference_depth=args.infer_depth,
    )


if __name__ == "__main__":
    main()
