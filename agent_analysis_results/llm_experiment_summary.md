**LLM实验结果汇总**
- 终止性分析结果源自 `Experiments/LLM_Results/llm_results_Certain_*.csv`，并确认 `Experiments/LLM_Results/TPDB_Certain_ALLResults.csv` 的 `llm_result` 来自 `chatgpt4o`。
- 已补充其余模型的终止性结果到 `agent_analysis_results/llm_termination_all_models.csv`（包含 `o4mini/claude3.7/deepseekr1`，缺失处标记为 MISSING；`deepseekr1` 只覆盖 274/578）。
- 秩函数分析（phase depth）结果源自 `Experiments/LLM_Phase_Exp/LLM_Phase_Results/`，按 Nested/Multi/Nested_rem 分组。
- 秩函数模板（termtype）结果包含主实验 `Experiments/LLM_Termtype_Exp/llm_termtype_result_*.csv` 与 TERM86 direct/fewshot 扩展实验。
- 主实验的 termtype 统计按“带前缀的文件名”视作独立样本，不做前缀去重。
- 模型命名保持与源文件一致：终止性为 `chatgpt4o`，phase/termtype 为 `gpt4o`，TERM86 里出现 `claude37` 与 `o1mini`。

**终止性分析概览（TPDB_Certain）**
- chatgpt4o: 样本 578，稳定 510，不稳定 68，整体一致率 0.7405，稳定一致率 0.8098。
- o4mini: 样本 578，稳定 566，不稳定 12，整体一致率 0.9585，稳定一致率 0.9735。
- claude3.7: 样本 578，稳定 552，不稳定 26，整体一致率 0.91，稳定一致率 0.9293。
- deepseekr1: 样本 274，稳定 234，不稳定 40，整体一致率 0.8285，稳定一致率 0.9701。

**秩函数分析概览（phase depth）**
- Nested / gpt4o: 样本 79，期望 81，缺失 2，完全正确 26，safe 67，unsafe 12。
- Nested / o4mini: 样本 79，期望 81，缺失 2，完全正确 54，safe 68，unsafe 11。
- Nested / claude3.7: 样本 79，期望 81，缺失 2，完全正确 31，safe 61，unsafe 18。
- Multi / gpt4o: 样本 85，期望 85，缺失 0，完全正确 32，safe 74，unsafe 11。
- Multi / o4mini: 样本 85，期望 85，缺失 0，完全正确 52，safe 69，unsafe 16。
- Multi / claude3.7: 样本 85，期望 85，缺失 0，完全正确 39，safe 66，unsafe 19。
- Nested_rem / gpt4o: 样本 34，期望 36，缺失 2，完全正确 18，safe 30，unsafe 4。
- Nested_rem / o4mini: 样本 34，期望 36，缺失 2，完全正确 30，safe 32，unsafe 2。
- Nested_rem / claude3.7: 样本 34，期望 36，缺失 2，完全正确 18，safe 24，unsafe 10。

**秩函数模板概览（主实验）**
- o4mini: 样本 90，一致 65，最终预测正确 71（正确率 0.7889）。
- gpt4o: 样本 90，一致 42，最终预测正确 37（正确率 0.4111）。
- claude3.7: 样本 90，一致 66，最终预测正确 62（正确率 0.6889）。

**秩函数模板概览（TERM86 扩展）**
- TERM86_direct / claude37: 样本 86，一致 55，最终预测正确 76（正确率 0.8837）。
- TERM86_direct / gpt4o: 样本 86，一致 72，最终预测正确 67（正确率 0.7791）。
- TERM86_direct / o1mini: 样本 86，一致 57，最终预测正确 71（正确率 0.8256）。
- TERM86_fewshot / o1mini: 样本 86，一致 64，最终预测正确 70（正确率 0.814）。
- TERM86_fewshot / claude37: 样本 86，一致 52，最终预测正确 77（正确率 0.8953）。
- TERM86_fewshot / gpt4o: 样本 86，一致 45，最终预测正确 70（正确率 0.814）。

**输出文件**
- `agent_analysis_results/llm_termination_all_models.csv`
- `agent_analysis_results/llm_experiment_summary.csv`
- `agent_analysis_results/llm_experiment_summary.md`
- `agent_analysis_results/svmranker_experiment_summary.csv`
- `agent_analysis_results/svmranker_summary.md`
