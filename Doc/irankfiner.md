# How to Use

## Run
```bash
# 该命令建议在~/term/TerminationDatabase 运行

# 测试一下：
python Scripts/irank_run_dirs.py SVComp_C/loop-new/ --output Results/test_irank_SV_TP_simpleArgs.csv -cg 1

# 设置了两组参数组，参数组1是simple后缀，分析线性循环，较为简单的分析
python Scripts/irank_run_dirs.py SVComp_C/ TPDB_Y2024_filtered_VBS/ --output Results/irank_SV_TP_simpleArgs.csv -cg 1

# 参数组2会更加细致的分析
python Scripts/irank_run_dirs.py SVComp_C/ TPDB_Y2024_filtered_VBS/ --output Results/irank_SV_TP_complexArgs.csv -cg 2

# 限制内存，iRankFinder Simple args, Limit memory 16GB:
ulimit -Sv $((16*1024*1024)) && python Scripts/irank_run_dirs.py SVComp_C/ TPDB_Y2024_filtered_VBS/ --output Results/irank_SV_TP_simpleArgs.csv -cg 1

```

## ~~Build From Source Code~~
安装脚本
```bash
./install.sh
```

- 遇到问题，报错提示需要`python < 3.9` `python-dev`

- 禁止使用参数`--sudo`避免绕过虚拟环境

- 每次需要删除`rm -rf /tmp/ppl`
- `.sh`有过时的pip指令，需要注释掉：
````bash
--process-dependency-links
````
- 部分使用http无法网络正常，需要ssh服务：
````bash
git config --global url."git@github.com:".insteadOf "https://github.com/"
````
- 与python3.8兼容的cython版本是0.29.14

- cython 0.29.14版本可能过高，需要补充
```bash
pip install pythran
```

- 仍然出错，修改cython到0.29.36

- 仍然出错，源码安装，再降级pythran版本
```bash
pip install --no-binary cython cython==0.29.36
pip install pythran==0.12.0
```

- 仍然存在报错，暂时放弃

## Use Executable
Download URL: https://github.com/jesusjda/pyRankFinder/releases/tag/v1.3.2
Please Download from version v1.3.2 and before;
Because v1.3.3 only have source code;

```bash
irankfinder-exe/irankfinder --help

./irankfinder --help
```
> 路径都为实验机中的路径，根据需求自行更改

### test
```bash
./irankfinder --termination lrf_pr --invariants polyhedra --file [FILEPATH]

./irankfinder --termination lrf_pr --invariants polyhedra --file /root/term/TerminationDatabase/SVComp_C/loop-invgen/down.c
```


### **command**
- 全面参数 `complex`
该组参数来自于 邮件；
KeyWord: 多面体不变量，高阶非线性Ranking Function，深度的CFG重构；
几乎**全面覆盖**循环的终止性和非终止性分析；
```bash
./irankfinder -sccd 5 -dt always -rniv -sif -d Z \
-cfr-call-var -cfr-call -cfr-head-deep -cfr-inv \
-cfr-st-scc -cfr-it 1 -cfr-mx-t 2 \
--invariants polyhedra \
--termination qnlrf_3 \
--nontermination monotonicrecset \
-nt-reach \
-sample-nd-vars \
--file [FILEPATH]
```
参数解释：
```bash
./irankfinder \ 
-sccd 5 # CFG 的强连通分量SCC分析深度为5
-dt always # 始终 为每个CFG节点使用独立模板(Different Template)，适合 多分支循环
-rniv # 移除无关变量
-sif # 某个SCC分析失败，停止整个分析
-d Z # 指定变量值域为整数，适合 循环变量为int类型和int运算
-cfr-call-var \
-cfr-call \
-cfr-head-deep \
-cfr-inv # 以上四个，联合优化 复杂循环结构
-cfr-st-scc \
-cfr-it 1 # CFR迭代次数为1
-cfr-mx-t 2 # CFR在SCC层最大尝试次数为2
--invariants polyhedra # 生成多面体不变量，可以辅助推导Ranking Function
--termination qnlrf_3 # 选择3阶量化非线性秩函数
--nontermination monotonicrecset # 基于单调递归集合证明非终止性
-nt-reach # 非终止性分析启用可达性分析
-sample-nd-vars # 非确定性变量进行采样赋值，应对x=read_input()
--file [FILEPATH]
```

- 简化版参数 `simple`
重点关注线性循环和效率
```bash
./irankfinder -sccd 2 -dt iffail -rniv -d Z \
-cfr-st-scc -cfr-it 0\
--invariants polyhedra \
--termination lrf_pr \
--file [FILEPATH]

# 可以根据需要的输出详细度指定 -v 2
```

### --help
```bash
usage: irankfinder [-h] [-cfr-it {0,1,2,3,4}] [-cfr-mx-t {0,1,2,3,4}]
                   [-cfr-st-before] [-cfr-st-scc] [-cfr-st-after] [-cfr-usr]
                   [-cfr-cone] [-cfr-head] [-cfr-head-var] [-cfr-call]
                   [-cfr-call-var] [-cfr-head-deep] [-cfr-split] [-cfr-inv]
                   [-cfr-nodes [CFR_NODES [CFR_NODES ...]]]
                   [-cfr-nodes-mode {john,cyclecutnodes,all,user}]
                   [-v {0,1,2,3,4}] [-V] [-od OUTPUT_DESTINATION]
                   [-of {fc,dot,svg,koat,pl,smt2} [{fc,dot,svg,koat,pl,smt2} ...]]
                   [-si] [--tmpdir TMPDIR] [--ei-out] [--print-graphs]
                   [-d {Z,Q,user}] [-dt {never,iffail,always}]
                   [-dt-scheme {default,inhomogeneous}] [-sccd SCC_DEPTH]
                   [-usr-reach] [-reach {none,interval,polyhedra}] [-rniv]
                   [-ca] [-rfs-as-cfr-props] [-scc-pl PRINT_SCC_PROLOG] -f
                   FILE [-cfgpf CFG_PROPERTIES_FILE]
                   [-nt [NONTERMINATION [NONTERMINATION ...]]] [-nt-reach]
                   [-sample-nd-vars] [-t [TERMINATION [TERMINATION ...]]]
                   [-ct] [-i {none,interval,polyhedra}]
                   [-inv-wide-nodes [INVARIANT_WIDENING_NODES [INVARIANT_WIDENING_NODES ...]]]
                   [-inv-wide-nodes-mode {cyclecutnodes,all,user}]
                   [-inv-thre INVARIANTS_THRESHOLD [INVARIANTS_THRESHOLD ...]]
                   [-sif]

irankfinder: a Ranking Function finder on python.

optional arguments:
  -h, --help            show this help message and exit
  -v {0,1,2,3,4}, --verbosity {0,1,2,3,4}
                        increase output verbosity
  -V, --version         Shows the version.
  -od OUTPUT_DESTINATION, --output-destination OUTPUT_DESTINATION
                        Folder to save output files.
  -of {fc,dot,svg,koat,pl,smt2} [{fc,dot,svg,koat,pl,smt2} ...], --output-formats {fc,dot,svg,koat,pl,smt2} [{fc,dot,svg,koat,pl,smt2} ...]
                        Formats to print the graphs.
  -si, --show-with-invariants
                        add invariants to the output formats
  --tmpdir TMPDIR       Temporary directory.
  --ei-out              Shows the output supporting ei
  --print-graphs        Shows the output in fc and svg format
  -d {Z,Q,user}, --domain {Z,Q,user}
                        Domain of the variables
  -dt {never,iffail,always}, --different-template {never,iffail,always}
                        Use different templates on each node
  -dt-scheme {default,inhomogeneous}, --different-template-scheme {default,inhomogeneous}
                        Use different templates on each node
  -sccd SCC_DEPTH, --scc-depth SCC_DEPTH
                        Strategy based on SCC to go through the CFG.
  -usr-reach, --user-reachability
                        Compute reachability from user constraints
  -reach {none,interval,polyhedra}, --reachability {none,interval,polyhedra}
                        Analyse reachability
  -rniv, --remove-no-important-variables
                        Remove No Important variables before do anything else.
  -ca, --check-assertions
                        Check Invariants with the assertions defined
  -rfs-as-cfr-props, --rfs-as-cfr-props
                        Print a graph with rfs as user props.
  -scc-pl PRINT_SCC_PROLOG, --print-scc-prolog PRINT_SCC_PROLOG
                        File where print, on certain format, sccs that we don't know if terminate.
  -f FILE, --file FILE  File to be analysed.
  -cfgpf CFG_PROPERTIES_FILE, --cfg-properties-file CFG_PROPERTIES_FILE
                        File with the properties of nodes.
  -nt [NONTERMINATION [NONTERMINATION ...]], --nontermination [NONTERMINATION [NONTERMINATION ...]]
                        Algorithms allowed:
                        	non_fixpoint: non termination looking for a fixpoint
                        	non_monotonicrecset: Based on MphRF
  -nt-reach, --nt-reachability
                        Analyse reachability when NT algorithms says NO.
  -sample-nd-vars, --sample-nodeterm-vars
                        Give values to variables that are not deterministic.
  -t [TERMINATION [TERMINATION ...]], --termination [TERMINATION [TERMINATION ...]]
                        Algorithms allowed:
                        	lrf_pr: Podelski-Rybalchenko Algorithm for Linear Ranking Functions
                        	qlrf_adfg[_nonoptimal]: Quasi Linear Ranking Function via QLRF_ADFG method
                        	qlrf_bg: Quasi Linear Ranking Function via QLRF_BG method
                        	qnlrf[_v2][_N]: Quasi Nested Linear Ranking Function
  -ct, --conditional-termination
                        Do conditional termination over the nodes where we cannot proof termination.
  -i {none,interval,polyhedra}, --invariants {none,interval,polyhedra}
                        Compute Invariants.
  -inv-wide-nodes [INVARIANT_WIDENING_NODES [INVARIANT_WIDENING_NODES ...]], --invariant-widening-nodes [INVARIANT_WIDENING_NODES [INVARIANT_WIDENING_NODES ...]]
                        .
  -inv-wide-nodes-mode {cyclecutnodes,all,user}, --invariant-widening-nodes-mode {cyclecutnodes,all,user}
                        .
  -inv-thre INVARIANTS_THRESHOLD [INVARIANTS_THRESHOLD ...], --invariants-threshold INVARIANTS_THRESHOLD [INVARIANTS_THRESHOLD ...]
                        Use thresholds.
  -sif, --stop-if-fail  If an SCC fails the analysis will stop.

cfr:
  CFR parameters

  -cfr-it {0,1,2,3,4}, --cfr-iterations {0,1,2,3,4}
                        # times to apply cfr
  -cfr-mx-t {0,1,2,3,4}, --cfr-max-tries {0,1,2,3,4}
                        max tries to apply cfr on scc level
  -cfr-st-before, --cfr-strategy-before
  -cfr-st-scc, --cfr-strategy-scc
  -cfr-st-after, --cfr-strategy-after
  -cfr-usr, --cfr-user-properties
  -cfr-cone, --cfr-cone-properties
  -cfr-head, --cfr-head-properties
  -cfr-head-var, --cfr-head-var-properties
  -cfr-call, --cfr-call-properties
  -cfr-call-var, --cfr-call-var-properties
  -cfr-head-deep, --cfr-head-deep-properties
  -cfr-split, --cfr-split-properties
  -cfr-inv, --cfr-invariants
                        CFR with Invariants.
  -cfr-nodes [CFR_NODES [CFR_NODES ...]], --cfr-nodes [CFR_NODES [CFR_NODES ...]]
                        .
  -cfr-nodes-mode {john,cyclecutnodes,all,user}, --cfr-nodes-mode {john,cyclecutnodes,all,user}
                        .

```

# Test Cases

termination and nontermination
Case 1:
```bash
./irankfinder -sccd 5 -dt always -rniv -sif -d Z \
-cfr-call-var -cfr-call -cfr-head-deep -cfr-inv \
-cfr-st-scc -cfr-it 1 -cfr-mx-t 2 \
--invariants polyhedra \
--termination qnlrf_3 \
--nontermination monotonicrecset \
-nt-reach \
-sample-nd-vars \
--file /root/term/TerminationDatabase/SVComp_C/loop-invgen/down.c
```
测试返回：
```bash
YES
Termination: (Ranking Functions Found)
------------
eval_main_6: < < -v_6 + v_j.0 > >
eval_main_7: < < -v_6 + v_j.0 > >
eval_main_bb1_in: < < v_0 -v_k.0 > >
eval_main_bb2_in: < < -1 + v_0 -v_i.0 > >
eval_main_bb3_in: < < v_0 -v_k.0 + v_k.1 > >
eval_main_bb4_in: < < v_j.0 > >
```

Case 2；
```bash
./irankfinder -sccd 5 -dt always -rniv -sif -d Z \
-cfr-call-var -cfr-call -cfr-head-deep -cfr-inv \
-cfr-st-scc -cfr-it 1 -cfr-mx-t 2 \
--invariants polyhedra \
--termination qnlrf_3 \
--nontermination monotonicrecset \
-nt-reach \
-sample-nd-vars \
--file /root/term/TerminationDatabase/SVComp_C/loop-invgen/string_concat-noarr.c
```
报错了

Case 3:
```bash
SVComp_C/loop-invgen/SpamAssassin-loop.c
NO


Termination: (Ranking Functions Found)
------------
eval_main_10: < < -2 * v_10 + v_12 + v_2 + v_i.0 + v_j.0 > >
eval_main_11: < < 1 -2 * v_10 + v_2 + v_i.0 + v_j.0 > >
eval_main_12: < < -2 * v_10 + v_12 + v_2 + v_i.0 + v_j.0 > >
eval_main_13: < < -1 + v_2 + v_i.0 -2 * v_i.1 + v_j.0 > >
eval_main_15: < < v_15 + v_2 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_16: < < v_12 + v_2 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_17: < < -2 * v_10 + v_2 + v_23 + v_i.0 + v_j.0 > >
eval_main_18: < < -2 * v_10 + v_2 + v_23 + v_i.0 + v_j.0 > >
eval_main_19: < < v_15 + v_2 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_20: < < -2 * v_10 + v_2 + v_26 + v_i.0 + v_j.0 > >
eval_main_21: < < v_2 + v_20 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_22: < < v_12 + v_2 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_25: < < -2 * v_10 + v_2 + v_20 + v_i.0 + v_j.0 > >
eval_main_26: < < v_2 + v_31 -2 * v_32 + v_i.0 > >
eval_main_27: < < v_2 + v_31 -2 * v_32 + v_i.0 > >
eval_main_28: < < v_2 + v_31 -2 * v_8 + v_i.0 > >
eval_main_29: < < v_2 + v_31 -2 * v_32 + v_i.0 > >
eval_main_30: < < -2 * v_10 + v_2 + v_31 + v_i.0 > >
eval_main_31: < < v_2 + v_31 -2 * v_32 + v_i.0 > >
eval_main_32: < < v_2 + v_31 -2 * v_32 + v_i.0 > >
eval_main_35: < < -2 * v_10 + v_2 + v_31 + v_i.0 > >
eval_main_36: < < -2 * v_10 + v_2 + v_31 + v_i.0 > >
eval_main_37: < < v_2 + v_31 -2 * v_32 + v_i.0 > >
eval_main_38: < < -2 * v_10 + v_2 + v_31 + v_i.0 > >
eval_main_41: < < 1 + v_2 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_42: < < v_2 + v_55 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_43: < < v_2 + v_58 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_44: < < v_2 + v_58 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_45: < < v_2 + v_61 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_46: < < v_2 + v_58 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_47: < < v_2 + v_64 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_48: < < v_2 + v_64 -2 * v_8 + v_i.0 + v_j.0 > >
eval_main_9: < < -2 * v_10 + v_12 + v_2 + v_i.0 + v_j.0 > >
eval_main_bb2_in: < < v_2 -v_i.0 >, < 0 > >
eval_main_bb3_in: < < v_2 + v_i.0 -2 * v_i.1 + v_j.0 >, < v_j.0 > >
eval_main_bb4_in: < < -1 + v_2 + v_i.0 -2 * v_i.1 + v_j.0 > >
eval_main_bb5_in: < < -1 + v_2 + v_i.0 -2 * v_i.1 + v_j.0 > >
eval_main_bb6_in: < < -2 * v_10 + v_15 + v_2 + v_i.0 + v_j.0 > >
eval_main_bb7_in: < < 1 + v_2 -2 * v_8 + v_i.0 + v_j.0 > >


NON-Termination:
----------------
SCC:
+--transitions: t10,t14
+--nodes: eval_main_bb2_in,eval_main_bb3_in
Closed walk: 2 -> t10, t14
Reachability checked!
- Recurrent Set Found:
{
        v_j.0' == 0,
        v_i.0 -v_i.1' == 0,
        v_i.0 -v_i.0' == 0,
        v_8 -v_8' == 0,
        v_67 -v_67' == 0,
        v_66 -v_66' == 0,
        v_65 -v_65' == 0,
        v_64 -v_64' == 0,
        v_62 -v_62' == 0,
        v_61 -v_61' == 0,
        v_59 -v_59' == 0,
        v_58 -v_58' == 0,
        v_56 -v_56' == 0,
        v_55 -v_55' == 0,
        v_53 -v_53' == 0,
        v_52 -v_52' == 0,
        v_51 -v_51' == 0,
        v_49 -v_49' == 0,
        v_48 -v_48' == 0,
        v_46 -v_46' == 0,
        v_45 -v_45' == 0,
        v_44 -v_44' == 0,
        v_43 -v_43' == 0,
        v_41 -v_41' == 0,
        v_40 -v_40' == 0,
        v_38 -v_38' == 0,
        v_37 -v_37' == 0,
        v_35 -v_35' == 0,
        v_34 -v_34' == 0,
        v_32 -v_32' == 0,
        v_31 -v_31' == 0,
        v_30 -v_30' == 0,
        -4 + v_0 -v_3' == 0,
        v_29 -v_29' == 0,
        v_27 -v_27' == 0,
        v_26 -v_26' == 0,
        v_24 -v_24' == 0,
        v_23 -v_23' == 0,
        v_21 -v_21' == 0,
        v_20 -v_20' == 0,
        v_2 -v_2' == 0,
        v_17 -v_17' == 0,
        v_16 -v_16' == 0,
        v_15 -v_15' == 0,
        v_13 -v_13' == 0,
        v_12 -v_12' == 0,
        v_10 -v_10' == 0,
        v_0 -v_0' == 0,
        X47 == 0,
        v_i.0 -X46 == 0,
        v_i.0 -X45 == 0,
        v_8 -X44 == 0,
        v_67 -X43 == 0,
        v_66 -X42 == 0,
        v_65 -X41 == 0,
        v_64 -X40 == 0,
        v_62 -X39 == 0,
        v_61 -X38 == 0,
        v_59 -X37 == 0,
        v_58 -X36 == 0,
        v_56 -X35 == 0,
        v_55 -X34 == 0,
        v_53 -X33 == 0,
        v_52 -X32 == 0,
        v_51 -X31 == 0,
        v_49 -X30 == 0,
        v_48 -X29 == 0,
        v_46 -X28 == 0,
        v_45 -X27 == 0,
        v_44 -X26 == 0,
        v_43 -X25 == 0,
        v_41 -X24 == 0,
        v_40 -X23 == 0,
        v_38 -X22 == 0,
        v_37 -X21 == 0,
        v_35 -X20 == 0,
        v_34 -X19 == 0,
        v_32 -X18 == 0,
        v_31 -X17 == 0,
        v_30 -X16 == 0,
        -4 + v_0 -X15 == 0,
        v_29 -X14 == 0,
        v_27 -X13 == 0,
        v_26 -X12 == 0,
        v_24 -X11 == 0,
        v_23 -X10 == 0,
        v_21 -X9 == 0,
        v_20 -X8 == 0,
        v_2 -X7 == 0,
        v_17 -X6 == 0,
        v_16 -X5 == 0,
        v_15 -X4 == 0,
        v_13 -X3 == 0,
        v_12 -X2 == 0,
        v_10 -X1 == 0,
        v_0 -X0 == 0,
        -4 + v_0 -v_3 == 0,
        -1 + v_2 -v_i.0 >= 0,
        4 -v_0 >= 0,
        v_i.0 >= 0
}
```