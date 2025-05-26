Aim:
    Save tools' results for SVComp_C and TPDB

# Description

## 组织
- 2ls 结果
轮次1：
[2ls Svcomp首次结果(.c)](./2ls_Term_Res_SVCOMP.csv)
[2ls TPDB(VBS汇总)首次结果(.c)](./2ls_Term_Res_TPDB.csv)

- 0526说明
2ls都分别对SVComp和TermComp运行了三次，分别有3个copy文件；对他们合并；
如果多次运行结果完全一致，一致性检测为True，如果有某次没有分析到或者结果不一致或者有失败或者超时等，会置为False
同时由于2ls运行svcomp遇到过中断，所以直接合并存在一些重复情况，最终文件是去重后的
[2ls Svcomp](./2ls_SVComp_merge_dedup.csv)
[2ls Termcomp](./2ls_TPDB_merge.csv)

# Log
[Log.md](../Doc/log.md)