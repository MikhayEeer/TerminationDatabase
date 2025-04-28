# TerminationDatabase
A Database for termination verify tasks, data from SVCOMP and TermCOMP and so on.

主要是作为SVCOMP和TermCOMP的benchmark的筛选；
仅仅筛选Termination相关的任务和案例case；

- SVComp_filtered.csv: 来自SVCOMP，`.yml`中记录了是否含有Termination和最终的布尔值
- TPDB_filtered_24ResultsFromParticipants.csv：是TermCOMP2024页面的raw data中下载的内容，results值不确定是否为标准答案，概率为参赛者答案，留作参考
- TPDB_Y2024_filtered_VBS.csv：来自页面Termination-C-Y2024.html的解析，VBS应该是属于标准答案值，result来自于vbs；



