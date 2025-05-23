# 日志记录
存放上传说明，例如当前上传还存在什么问题，后续预计如何解决等内容
```text
- 0514: 
    2ls运行，测试少量数据时，发现不能正确处理False情况；
    部分内容需要再次运行.i文件，尤其是conversion error；

- 0518:
    - 上传两个csv，为初轮2ls运行的结果；部分Error和timeout，如果有.i文件，则运行.i文件的；
    - cpachecker参数组 config-lassoranker,spec-TerminationState 全部Failed，重新跑
    - 2ls第二轮带有.i的正在跑；
    - 2ls 似乎并没有 Termination Failed也就是No这个存在;

- 0519
    - 部分2ls的.i由于脚本策略，陷入了递归死循环，重新跑；TPDB的copy重新跑完，但是copy的结果中，似乎Failed的151例并没有得到改善，csv也没有记录是否切换了.i文件进行运行，修正脚本再次运行

- 0522 
    - 2ls copy3上传，但是SVComp 的 copy3没有运行完整
    - irank 把内存占满了，靠`ssh user@host "pkill -9 tmux"`给终止了

- 0523
    - irankfinder会创建子进程，不杀光的话会吃完内存
    - 为irankfinder加入断点续传功能
    - 为2ls加入断点续传功能，并且在copy3的结果中，复制一份作为copy3-2来测试断点续传，尝试完成所有的2ls for SVComp工作
        - 2ls断点续传没有起到效果，需要有时间进行检修
        - Solve: output有误
```
