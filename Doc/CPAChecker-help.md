# Command
可以禁止output
```bash
--no-output-files 

--benchmark
# 加速策略可能导致精度受损
```
- 脚本中策略
```bash
cpachecker --preprocess --timelimit 120 \
    --config /opt/cpachecker/config/lassoRankerAnalysis.properties \
    --spec /opt/cpachecker/config/specification/TerminatingStatements.spc \
    --heap 32G --no-output-files --output-path ../CPAcherck/output/ \
    [file]
```

- 运行命令
```bash
# lassoranker
cpachecker --preprocess --timelimit 120 \
    --config /opt/cpachecker/config/lassoRankerAnalysis.properties \
    --spec /opt/cpachecker/config/specification/TerminatingStatements.spc \
    --heap 32G --benchmark \
    [file]

# 常规
cpachecker --preprocess --timelimit 120 \
    --config /opt/cpachecker/config/terminationAnalysis.properties \
    --spec /opt/cpachecker/config/specification/TerminatingStatements.spc \
    [file]

# some test files;
TPDB_YES/Bangalore_true-termination.c
```

# CLI Output
Analysis Output in terminal, can write code for parsing cpachecker results;

## YES
eg : `TPDB_YES/Bangalore_true-termination.c`

- config-lassoranker + spec-TerminationState
```bash
# YES
Starting analysis ... (CPAchecker.runAlgorithm, INFO)

Starting termination algorithm. (TerminationAlgorithm.run0, INFO)

Termination algorithm did not find a non-terminating loop. (TerminationAlgorithm.run0, INFO)

Stopping analysis ... (CPAchecker.runAlgorithm, INFO)

Verification result: TRUE. No property violation found by chosen configuration.
```
- config-terminate + spec-TerminationState
```bash
# YES
Starting analysis 1 ... (RestartAlgorithm.run, INFO)

Starting termination algorithm. (Analysis /opt/cpachecker/config/components/termination-recursion.properties:TerminationAlgorithm.run0, INFO)

Termination algorithm did not find a non-terminating loop. (Analysis /opt/cpachecker/config/components/termination-recursion.properties:TerminationAlgorithm.run0, INFO)

Stopping analysis ... (CPAchecker.runAlgorithm, INFO)
...
Verification result: TRUE. No property violation found by chosen configuration.
```

## NO
eg: `TPDB_NO/Rotation180_false-termination.c`
- lasso
```bash
Starting analysis ... (CPAchecker.runAlgorithm, INFO)
Starting termination algorithm. (TerminationAlgorithm.run0, INFO)
Stopping analysis ... (CPAchecker.runAlgorithm, INFO)

Verification result: FALSE. Property violation (termination) found by chosen configuration.
```
- general
```bash
Verification result: UNKNOWN, incomplete analysis.
More details about the verification run can be found in the directory "./output".
Graphical representation included in the file "./output/Counterexample.3.html".
```

## MAYBE
eg: `TPDB_NO/AlternDivWidening.c`
`llm: YES, 2ls: Maybe, irank-complex: MAYBE, irank-simple: MAYBE`

应该是出现`UNKNOW`

# Source
```bash
Running CPAchecker with default heap size (1200M). Specify a larger value with --heap if you have more RAM.
Running CPAchecker with default stack size (1024k). Specify a larger value with --stack if needed.

CPAchecker 4.0 (OpenJDK 64-Bit Server VM 17.0.14)

OPTIONS:
 --32                 set platform to 32-bit x86 Linux (ILP32)
 --64                 set platform to 64-bit x86 Linux (LP64)
 --benchmark          disable assertions and optional features such as output files for improved performance
 --class-path         set the classpath for the analysis of Java programs
 --config/-c          set the configuration for the analysis
 --cpas               set CPAs for the analysis
 --entry-function     set the initial function for the analysis
 --help/-h            print help message
 --java               language of the sourcefile
 --no-output-files    disable all output (except directly specified files)
 --option             set an option directly
 --output-path        where to store the files with results, statistics, logs
 --preprocess         execute a preprocessor before starting the analysis
 --print-options      print all possible options on StdOut
 --print-used-options print all used options
 --secure-mode        allow to use only secure options
 --skip-recursion     skip recursive function calls
 --source-path        set the sourcepath for the analysis of Java programs
 --spec               set the specification for the main analysis
 --stats              collect statistics during the analysis and print them afterwards
 --timelimit          set a timelimit for the analysis
 --version            print version number
 --witness/-w         the witness to validate

You can also specify any of the configuration files in the directory config/
with --CONFIG_FILE, e.g., --default for config/default.properties.
If no configuration is given, CPAchecker uses a default configuration.

More information on how to configure CPAchecker can be found in 'doc/Configuration.md'.
```
# Analysis
一些重要的命令行参数记录
```bash
--config, -c 指定配置文件(*.properties)
--spec  定义验证的目标规范文件(*.prp)

--heap
--stack  调整堆内存和线程栈大小，默认为1200M和1024KB

--stats 输出过程统计信息，包括耗时等

--preprocess 代码预处理器，用于分析复杂宏定义C代码
```

## config 与 spec
注意区分`--config`和`--spec`
一个是配置，一个是规范；
	config：指定验证策略和算法配置，包括 分析引擎/优化策略/抽象域 等内容
	spec：规定了验证的 目标/属性/标准，程序必须满足的属性（例如终止性）

`--config`内容默认存在于`/opt/cpachecker/config`下
常用的有：
```json
lassoRankerAnalysis.properties 
svcomp25--termination.properties 
terminationAnalysis.properties 
terminationAnalysisWithRecursion.properties 
terminationToSafety.properties 
violation-witness-validation-termination.properties
```

根据文档阅读分析，`--spec`规范存在于`/opt/cpachecker/config/specification`
```json
config/specification/sv-comp-terminatingfunctions.spc
config/specification/termination_as_reach.spc
config/specification/test-comp-terminatingfunctions.spc
config/specification/TerminatingFunctions.spc
config/specification/TerminatingStatements.spc
```

| 归属     | 名称                               | 作用                 |
| ------ | -------------------------------- | ------------------ |
| config | **lassoRankerAnalysis**          | lassoranker算法验证    |
| config | *svcomp25--termination*          | svcomp竞赛优化配置，多策略组合 |
| config | **terminationAnalysis**          | 通用终止性分析，抽象解释和符号执行  |
| config | terminationAnalysisWithRecursion | 递归函数终止性验证       |
| spec   | TerminatingFunctions             | 验证函数终止性（递归）        |
| spec   | **TerminatingStatements**        | 验证语句终止性（循环体，条件分支）  |
| spec   | *sv-comp-terminatingfunctions*   | svcomp标准化函数终止性规范   |

```bash
cpachecker --preprocess --timelimit 60 --heap 8G --benchmark --config /opt/cpachecker/config/lassoRankerAnalysis.properties --spec /opt/cpachecker/config/specification/TerminatingStatements.spc 
[filename]
```