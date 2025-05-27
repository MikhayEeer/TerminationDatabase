# TerminationDatabase
A Database for termination verify tasks, data from SVCOMP and TermCOMP and so on.

主要是作为SVCOMP和TermCOMP的benchmark的筛选；
仅仅筛选Termination相关的任务和案例case；

- SVComp_filtered.csv: 来自SVCOMP，`.yml`中记录了是否含有Termination和最终的布尔值
- TPDB_filtered_24ResultsFromParticipants.csv：是TermCOMP2024页面的raw data中下载的内容，results值不确定是否为标准答案，概率为参赛者答案，留作参考
- TPDB_Y2024_filtered_VBS.csv：来自页面Termination-C-Y2024.html的解析，VBS应该是属于标准答案值，result来自于vbs；
- TPDB_MAYBEs 从TPDB_Y2024_filtered_VBS.csv中提取MAYBE的结果收集而成

## CMD Line
跑实验使用的命令行
2ls 
```bash
src/2ls/2ls [file] --termination
```

cpachecker
```bash
cpachecker --preprocess -c [*.properties] [file]
```
some opt/../config:
    lassoRankerAnalysis.properties
        通过lassoranker算法进行终止性检验
    svcomp25--termination.properties
    terminationAnalysis.properties
        通用终止性分析的基本测试
    terminationAnalysisWithRecursion.properties
        递归函数终止性分析
    terminationToSafety.properties
    violation-witness-validation-termination.properties



## TODOs: 整理LLM Naive Unsolve中的例子

参考LLM_Naive_Unsolved/YES/下的四个文件夹
- easy 表示人很快就能看出终止（1min以内）的例子
- func_call 表示终止性和函数调用有关，比如函数的嵌套调用
- hard表示存在复杂的算术运算或者代码长度很长
- memory表示存在内存相关的语句和操作如alloc, malloc, 解引用等

请帮忙整理LLM_Naive_Unsolved/Unstable中的标签为YES的例子以及所有测试用例中标签为YES的例子
