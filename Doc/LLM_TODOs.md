## TODOs

### 利用大语言模型判断终止性细节：（NONTERM, 原因）或者（TERM, Ranking Function类型）
- benchmark: SVMRanker的Program_non是最初的benchmark
- 有结果的benchmark: 在用SVMRanker的lNested以及lMulti运行后得到了能够用lNested和lMulti解决的例子，在本项目LLM_Phase_Exp中的4-nested-terminate以及4-multi-terminate中的例子
- TODO: 利用4-nested-terminate以及4-multi-terminate中的例子，每个文件最初的数字为phase num，需要根据后面的名字总结，对原来每个benchmark的每个例子，总结（NONTERM, 原因）或者（TERM, Ranking Function类型）这样的baseline，并放到一个单独文件夹中，放在LLM_Termtype_Exp下面的文件夹中，利用strategy_process以及run_svmranker_termtype_judge，进行termtype的实验

### 多Agent的实现
- benchmark，还是SVMRanker的Program_non
- 需要实现：
def strategy_process(interface, program) 函数return后面的相关策略
- TODO： 利用strategy_process以及run_svmranker_strategy_judge，进行strategy的实验
