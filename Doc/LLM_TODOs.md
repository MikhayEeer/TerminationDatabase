## TODOs

### 利用大语言模型判断终止性细节：（NONTERM, 原因）或者（TERM, Ranking Function类型）(DONE)
- benchmark: SVMRanker的Program_non是最初的benchmark
- 有结果的benchmark: 在用SVMRanker的lNested以及lMulti运行后得到了能够用lNested和lMulti解决的例子，在本项目LLM_Phase_Exp中的4-nested-terminate以及4-multi-terminate中的例子
- TODO: 利用4-nested-terminate以及4-multi-terminate中的例子，每个文件最初的数字为phase num，需要根据后面的名字总结，对原来每个benchmark的每个例子，总结（NONTERM, 原因）或者（TERM, Ranking Function类型）这样的baseline，并放到一个单独文件夹中，放在LLM_Termtype_Exp下面的文件夹中，利用strategy_process以及run_svmranker_termtype_judge，进行termtype的实验

### 多Agent的实现 (DONE)
- benchmark，还是SVMRanker的Program_non
- 需要实现：
def strategy_process(interface, program) 函数return后面的相关策略
- TODO： 利用strategy_process以及run_svmranker_strategy_judge，进行strategy的实验


### 多Agent实验的实验数据整理


### TermType的不同的实验
- benchmark 文件： benchmark_with_type_phase.csv
- 对termtype实验结果的处理流程：
    - 获得llm_termtype_result_o4mini.csv文件，这个你应该知道
    - python3 Scripts/parse_termtype_exp_csv.py ./LLM_Termtype_Exp/benchmark_with_type_phase.csv  ./LLM_Termtype_Exp/llm_termtype_result_o4mini.csv  ./LLM_Termtype_Exp/merged_termtype_o4mini.csv （合并两部分）
    - 将这些merged的csv文件放入Processed子文件夹，调用python3 Scripts/parse_termtype_processed.py ./LLM_Termtype_Exp/Processed/ ./LLM_Termtype_Exp/Summary/


TODOs: 现在需要对TermType进行扩展实验，包括含有文章中例子的few_shot实验，以及将终止性判断剥离出来，提前让LLM知道程序是终止，并判断使用什么类型的秩函数进行证明。数据处理参照上面，只需要扩展prompt和实验。