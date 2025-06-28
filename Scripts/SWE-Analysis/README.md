## Prepare

`pip install datasets`

## 分析切入点
**problem_statement (核心中的核心!)​**​
​这是筛选的核心依据！​​ 死循环问题必然会在 Issue 的描述（problem_statement）中体现。
​搜索关键词/短语：​​
    infinite loop (无限循环)
    endless loop (死循环)
    hangs (挂起/卡住)
    never returns (永不返回)
    never terminates (永不终止)
    stuck in a loop (卡在循环中)
    freezes (冻结 - 也可能是阻塞，但常与死循环相关)
    loop condition (循环条件 - 结合上下文看是否有问题)
    does not exit (无法退出)
    iteration + indefinitely (无限迭代)
​分析描述：​​ 寻找用户描述程序卡住、CPU 飙升、长时间无响应、特定操作导致程序“冻住”等现象。通常用户或开发者会明确指出或强烈暗示这是一个循环逻辑错误导致的问题。

​**FAIL_TO_PASS (重要筛选条件)​**​
死循环问题几乎必然导致测试失败​（测试超时、结果未返回）。确保筛选的问题是 "FAIL_TO_PASS" 类型的实例。这大大缩小范围（从约 1200+ 个实例中筛选）。
​原因：​​ 测试用例通常会有超时设置（timeout）。如果一个测试因死循环而永不结束，必然超时失败。修复后（退出循环），测试应该能在规定时间内通过。

​**patch (验证判断)​**​
一旦通过 problem_statement 初步筛选出一个可能是死循环的实例，​查看其 patch (真实修复的代码差异 diff)​。
​检查 Patch：​​
修复是否集中在 while 或 for 循环的条件判断上？
是否增加了 break 条件？
是否修正了循环内的变量更新逻辑（导致循环条件永不满足）？
如果 patch 清晰显示修改的是循环控制部分，就极强地印证了你的判断。

​**hints_text (如果有，作为补充)​**​
这个字段有时包含讨论线索或额外说明，可能更明确提到 infinite loop，可以作为辅助确认。