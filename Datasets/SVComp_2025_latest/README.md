# Newest C Programs

```
Results written to 
sv-benchmarks\latest_c_files_info.csv
Total files processed: 47

Statistics:
  Files with YML: 47
  Files with termination property: 47
  Files with commit date: 47
  TRUE verdicts: 16
  FALSE verdicts: 31
```

# Data Augmentation

## 1022 20:30, First Augmentation

成功为 9 个原始 C 文件生成了 21 个增强版本，所有文件已保存到：`c_augmentation`

增强策略详情
- 变量重命名 (Variable Renaming)
  - 将简短变量名改为描述性名称：i → loop_counter
  - 或改为更简洁的名称：result → res

- 函数内联 (Function Inlining)
  - 保持函数结构，但重命名函数名保持语义等价

- 等价控制流转换 (Control Flow Transformation)
  - if-else 链 → 嵌套三元运算符
  - 多个独立 if 语句 → 合并为单个带 OR/AND 的条件
  - 前缀递增 (++i) → 后缀递增 (i++)

增强保证：
- 循环条件逻辑相同（仅涉及变量名修改）
- 循环体loop body执行次数不变
- 程序终止性结果与原始程序一致
- 增强文件包含清晰注释，说明增强策略

### 增强文件清单

| 原始文件 | 增强版本数量 | 增强策略 |
|---------|------------|---------|
| **Ex02.c** | 2 | • 变量重命名<br>• 控制流转换 (if→ternary) + 变量重命名 |
| **Fibonacci04.c** | 3 | • 变量重命名<br>• 函数内联 + 变量重命名<br>• 控制流转换 (if-else→ternary) + 变量重命名 |
| **Fibonacci05.c** | 2 | • 变量重命名<br>• 控制流转换 (if-else→ternary) + 变量重命名 |
| **Fibonacci01-2.c** | 3 | • 变量重命名<br>• 控制流转换 (if-else→ternary) + 变量重命名<br>• 控制流转换 (合并条件) + 变量重命名 |
| **nonterminating-loop.c** | 2 | • 变量重命名<br>• 内联交换操作 + 变量重命名 |
| **lcm1-both-t.c** | 2 | • 变量重命名<br>• 控制流转换 (合并条件) + 变量重命名 |
| **lcm1-both-nt.c** | 2 | • 变量重命名<br>• 控制流转换 (合并条件) + 变量重命名 |
| **linear-inequality-inv-c.c** | 2 | • 变量重命名<br>• 控制流转换 (合并错误检查) + 变量重命名 |
| **linear-inequality-inv-d.c** | 3 | • 变量重命名<br>• 控制流转换 (合并检查) + 变量重命名<br>• 循环递增转换 (++i→i++) + 变量重命名 |

**总计**: 9 个原始文件 → 21 个增强版本