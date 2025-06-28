# 项目结构

## 快速概览

- `Agent/`: 自动化分析代理的核心代码。
- **`Datasets/`**: 所有基准测试和数据集。
- `Doc/`: 项目文档和笔记。
- **`Experiments/`**: 实验配置和脚本。
- **`LLM_Results/`**: 各大语言模型的原始输出结果。
- **`Results/`**: 处理和分析后的最终结果。
- **`Scripts/`**: 数据处理和实验运行的 Python 脚本。

---

## 详细说明

### 根目录文件

- `Benchmarks-IsTerminating-226.csv`: 包含 226 个基准测试的是否终止的标签。
- `LLM_Naive_Unsolved.zip`: 使用朴素 LLM 方法未能解决的问题压缩包。
- `README.md`: 项目的主要说明文件。
- `Structure.md`: 当前文件，描述项目结构。
- `SVComp_filtered.csv`: 从 SVComp 竞赛中筛选出的基准测试。
- `TPDB_VBS_processed.csv`: 处理过的 TPDB (Termination Problems Data Base) VBS (Very Boogie Set) 数据。

### `Agent/`

此目录包含实现自动化分析和解决终止性问题的代理（Agent）的核心代码。

- `agent_framework.py`: 代理的核心框架。
- `main.py`: 代理的入口程序。
- `prompt.md`: 用于指导 LLM 的提示（Prompt）。
- `utils.py`: 辅助工具函数。

### `Datasets/`

存放用于训练、测试和验证的所有数据集。

- `Boogie_Program_Total_226_Benchmarks.csv`: 226 个 Boogie 程序基准测试的元数据。
- `Boogie_Program_Total_226/`: 存放 226 个 Boogie 程序（`.bpl` 文件）。
- `SVComp_C/`: 从 SVComp 竞赛中提取的 C 语言程序。
- `TPDB_*/`: 从 TPDB 中提取的各类问题，根据不同标准（如 YES/NO/MAYBE 答案）进行分类。

### `Doc/`

包含项目相关的文档。

- `*.md`: 包含对不同工具（AProVE, CPAChecker）、LLM 策略、待办事项和日志的说明。
- `resources/`: 存放相关资源。

### `Experiments/`

用于存放各类实验的配置和脚本。

- `LLM_Phase_Exp/`: LLM 分阶段实验。
- `LLM_Pipeline_Exp/`: LLM 流水线实验。
- `LLM_Termtype_Exp/`: LLM 终止类型的实验。

### `LLM_Results/`

存放来自不同大型语言模型（ChatGPT-4o, Claude 3.7, DeepSeek Coder V2, o4mini）的原始实验结果。

- `*.csv`: 每个文件对应一个模型在特定任务上的结果。

### `Results/`

存放经过处理和分析后的最终实验结果。

- `TPDB_Certain_Benchmarks_Correct.csv`: 在 TPDB 特定基准测试上的正确结果。
- `LLM_results_*/`: 按模型分类存放的详细结果。

### `Scripts/`

包含用于数据处理、实验执行和结果分析的脚本。

- `*.py`: 用于清理数据、收集结果、解析 CSV 文件、筛选数据集等的 Python 脚本。
- `BenchmarksTools/`, `CSV_Utils/`, `Utils/`: 脚本的辅助模块。
