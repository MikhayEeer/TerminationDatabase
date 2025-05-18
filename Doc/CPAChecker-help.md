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

