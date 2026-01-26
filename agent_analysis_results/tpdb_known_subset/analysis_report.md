# TPDB Known Subset 深度分析报告
报告生成日期: 2026-01-26

## 数据集: subset_combo.csv
**总样本数 (Total Samples): 220**

### 1. 工具解决能力分析 (Solvability Analysis)
| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |
|---|---|---|
| SVMR+CPA Combo | 214 | 97.27% |
| AProVE | 205 | 93.18% |
| Ultimate | 203 | 92.27% |
| MuVal | 202 | 91.82% |
| CPA-Lasso | 177 | 80.45% |
| iRank | 176 | 80.00% |
| CPA-General | 162 | 73.64% |
| 2LS | 103 | 46.82% |
| SVMR | 67 | 30.45% |


### 2. 代码复杂度与特征 (Code Complexity & Features)
#### a. 规模统计 (Scale Statistics)
| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |
|---|---|---|---|---|
| Lines | 54.46 | 24.0 | 2948.0 | 10.0 |
| Loop Count | 1.25 | 1.0 | 3.0 | 0.0 |
| Loop Depth | 1.19 | 1.0 | 2.0 | 0.0 |
| Vars in Condition | 1.90 | 2.0 | 6.0 | 0.0 |


#### b. 程序类型分布 (Program Types)
- **loop**: 219 (99.55%)
- **Unknown**: 1 (0.45%)


#### c. 关键语法特征 (Syntactic Features)
- **Has Break**: 12 (5.45%)
- **Has Arrays**: 6 (2.73%)
- **Has Pointers**: 110 (50.00%)


---

## 数据集: subset_combo_complex.csv
**总样本数 (Total Samples): 52**

### 1. 工具解决能力分析 (Solvability Analysis)
| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |
|---|---|---|
| AProVE | 52 | 100.00% |
| SVMR+CPA Combo | 49 | 94.23% |
| Ultimate | 44 | 84.62% |
| MuVal | 44 | 84.62% |
| CPA-Lasso | 38 | 73.08% |
| iRank | 37 | 71.15% |
| CPA-General | 33 | 63.46% |
| 2LS | 24 | 46.15% |
| SVMR | 17 | 32.69% |


### 2. 代码复杂度与特征 (Code Complexity & Features)
#### a. 规模统计 (Scale Statistics)
| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |
|---|---|---|---|---|
| Lines | 25.65 | 23.5 | 46.0 | 10.0 |
| Loop Count | 2.10 | 2.0 | 3.0 | 2.0 |
| Loop Depth | 1.81 | 2.0 | 2.0 | 1.0 |
| Vars in Condition | 2.62 | 2.0 | 6.0 | 1.0 |


#### b. 程序类型分布 (Program Types)
- **loop**: 52 (100.00%)


#### c. 关键语法特征 (Syntactic Features)
- **Has Break**: 1 (1.92%)
- **Has Arrays**: 5 (9.62%)
- **Has Pointers**: 31 (59.62%)


---

## 数据集: subset_control_complexity.csv
**总样本数 (Total Samples): 84**

### 1. 工具解决能力分析 (Solvability Analysis)
| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |
|---|---|---|
| AProVE | 79 | 94.05% |
| Ultimate | 67 | 79.76% |
| MuVal | 64 | 76.19% |
| iRank | 46 | 54.76% |
| SVMR+CPA Combo | 35 | 41.67% |
| CPA-Lasso | 35 | 41.67% |
| CPA-General | 32 | 38.10% |
| 2LS | 30 | 35.71% |
| SVMR | 0 | 0.00% |


### 2. 代码复杂度与特征 (Code Complexity & Features)
#### a. 规模统计 (Scale Statistics)
| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |
|---|---|---|---|---|
| Lines | 85.21 | 27.0 | 3782.0 | 10.0 |
| Loop Count | 2.04 | 2.0 | 6.0 | 1.0 |
| Loop Depth | 1.81 | 2.0 | 2.0 | 1.0 |
| Vars in Condition | 2.29 | 2.0 | 7.0 | 0.0 |


#### b. 程序类型分布 (Program Types)
- **loop**: 84 (100.00%)


#### c. 关键语法特征 (Syntactic Features)
- **Has Break**: 20 (23.81%)
- **Has Arrays**: 20 (23.81%)
- **Has Pointers**: 57 (67.86%)


---

## 数据集: subset_gap_svmr_targets.csv
**总样本数 (Total Samples): 265**

### 1. 工具解决能力分析 (Solvability Analysis)
| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |
|---|---|---|
| AProVE | 251 | 94.72% |
| MuVal | 238 | 89.81% |
| Ultimate | 232 | 87.55% |
| iRank | 165 | 62.26% |
| SVMR+CPA Combo | 144 | 54.34% |
| CPA-Lasso | 141 | 53.21% |
| CPA-General | 128 | 48.30% |
| 2LS | 98 | 36.98% |
| SVMR | 0 | 0.00% |


### 2. 代码复杂度与特征 (Code Complexity & Features)
#### a. 规模统计 (Scale Statistics)
| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |
|---|---|---|---|---|
| Lines | 60.66 | 25.0 | 3782.0 | 7.0 |
| Loop Count | 1.32 | 1.0 | 5.0 | 1.0 |
| Loop Depth | 1.19 | 1.0 | 2.0 | 1.0 |
| Vars in Condition | 1.97 | 2.0 | 6.0 | 0.0 |


#### b. 程序类型分布 (Program Types)
- **loop**: 265 (100.00%)


#### c. 关键语法特征 (Syntactic Features)
- **Has Break**: 14 (5.28%)
- **Has Arrays**: 0 (0.00%)
- **Has Pointers**: 157 (59.25%)


---

## 数据集: subset_recur.csv
**总样本数 (Total Samples): 46**

### 1. 工具解决能力分析 (Solvability Analysis)
| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |
|---|---|---|
| AProVE | 42 | 91.30% |
| 2LS | 37 | 80.43% |
| Ultimate | 36 | 78.26% |
| MuVal | 20 | 43.48% |
| SVMR+CPA Combo | 0 | 0.00% |
| CPA-General | 0 | 0.00% |
| CPA-Lasso | 0 | 0.00% |
| SVMR | 0 | 0.00% |
| iRank | 0 | 0.00% |


### 2. 代码复杂度与特征 (Code Complexity & Features)
#### a. 规模统计 (Scale Statistics)
| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |
|---|---|---|---|---|
| Lines | 34.15 | 34.0 | 56.0 | 15.0 |
| Loop Count | 0.00 | 0.0 | 0.0 | 0.0 |
| Loop Depth | 0.00 | 0.0 | 0.0 | 0.0 |
| Vars in Condition | 0.00 | 0.0 | 0.0 | 0.0 |


#### b. 程序类型分布 (Program Types)
- **recur**: 46 (100.00%)


#### c. 关键语法特征 (Syntactic Features)
- **Has Break**: 0 (0.00%)
- **Has Arrays**: 1 (2.17%)
- **Has Pointers**: 18 (39.13%)


---

## 数据集: subset_simple_failed.csv
**总样本数 (Total Samples): 195**

### 1. 工具解决能力分析 (Solvability Analysis)
| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |
|---|---|---|
| MuVal | 186 | 95.38% |
| AProVE | 179 | 91.79% |
| Ultimate | 175 | 89.74% |
| iRank | 127 | 65.13% |
| SVMR+CPA Combo | 114 | 58.46% |
| CPA-Lasso | 111 | 56.92% |
| CPA-General | 102 | 52.31% |
| 2LS | 72 | 36.92% |
| SVMR | 0 | 0.00% |


### 2. 代码复杂度与特征 (Code Complexity & Features)
#### a. 规模统计 (Scale Statistics)
| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |
|---|---|---|---|---|
| Lines | 51.13 | 25.0 | 2948.0 | 10.0 |
| Loop Count | 1.00 | 1.0 | 1.0 | 1.0 |
| Loop Depth | 1.00 | 1.0 | 1.0 | 1.0 |
| Vars in Condition | 1.67 | 2.0 | 5.0 | 0.0 |


#### b. 程序类型分布 (Program Types)
- **loop**: 195 (100.00%)


#### c. 关键语法特征 (Syntactic Features)
- **Has Break**: 13 (6.67%)
- **Has Arrays**: 0 (0.00%)
- **Has Pointers**: 110 (56.41%)


---
