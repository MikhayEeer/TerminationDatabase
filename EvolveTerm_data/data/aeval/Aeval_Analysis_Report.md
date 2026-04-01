# Aeval Dataset 实验结果分析报告

**日期:** 2025年12月18日
**分析对象:** EvolveTerm (两种配置) vs CPA-Lasso
**数据集:** Aeval Benchmarks (包含 `c_bench_term` 和 `c_bench_nonterm`)
**数据总量:** 347 个基准文件

---

## 1. 核心结论摘要

*   **预测准确率 (Prediction Accuracy):**
    *   **EvolveTerm (最佳配置):** **89.05%** (309/347)
    *   **CPA-Lasso:** **59.37%** (206/347)
    *   **结论:** EvolveTerm 在终止性预测的准确率上大幅领先 CPA-Lasso (+29.68%)。

*   **召回率对比 (Recall):**
    *   **Terminating:** ET (84.8%) vs CPA (54.4%) -> ET 领先 **+30.4%**
    *   **Non-Terminating:** ET (93.2%) vs CPA (64.2%) -> ET 领先 **+29.0%**
    *   **结论:** ET 在正负样本上的表现非常均衡且优异，而 CPA 在两类样本上均有较大差距。

*   **配置对比 (Ablation Study):**
    *   **NoRAG+NoInvar (无RAG无不变式):** 89.05%
    *   **NoInvar (有RAG无不变式):** 87.90%
    *   **发现:** 在该数据集上，移除 RAG 模块反而微弱提升了准确率 (+1.15%)。这可能暗示 Aeval 数据集的特征与 RAG 知识库中的样本差异较大，或者 RAG 引入了误导性上下文。

*   **形式化验证 (Verification):**
    *   由于本次实验配置为 "NoInvar" (不生成/使用不变式)，Z3 验证通过率较低 (约 10%)，这是符合预期的。因为没有不变式辅助，Z3 很难验证复杂的 Ranking Function。

---

## 2. 详细数据对比

### 2.1 总体表现

| 工具配置 | 总数 | 准确率 (Accuracy) | 正确预测数 | 错误预测数 |
| :--- | :--- | :--- | :--- | :--- |
| **ET (NoRAG + NoInvar)** | 347 | **89.05%** | **309** | 38 |
| **ET (With RAG + NoInvar)** | 347 | 87.90% | 305 | 42 |
| **CPA-Lasso** | 347 | 59.37% | 206 | 141 |

### 2.2 分类召回率 (Recall Breakdown)

| 类别 (Ground Truth) | 样本数 | ET (NoRAG) 正确率 | CPA-Lasso 正确率 | 差距 (ET - CPA) |
| :--- | :--- | :--- | :--- | :--- |
| **Terminating** | 171 | **84.8%** (145/171) | 54.4% (93/171) | **+30.4%** |
| **Non-Terminating** | 176 | **93.2%** (164/176) | 64.2% (113/176) | **+29.0%** |

### 2.3 形式化验证 (Z3 Results)
*注：本次实验未启用完整的不变式生成模块，因此验证率仅供参考。*

| 配置 | Verified (验证通过) | Verified Correct (真阳性) | Verified Wrong (假阳性) |
| :--- | :--- | :--- | :--- |
| **ET (NoRAG)** | 34 | 32 | 2 |
| **ET (RAG)** | 38 | 34 | 4 |

*   **Soundness 分析:** 即使在低验证率下，ET 的验证结果依然保持了较高的可靠性。在 NoRAG 配置下，34 个验证通过的案例中仅有 2 个与 Ground Truth 冲突（需人工复核，可能是 GT 标注问题或 Z3 溢出问题）。

---

## 3. 深度分析与讨论

### 3.1 为什么 CPA-Lasso 表现不佳？
CPA-Lasso 依赖于线性模板 (Linear Templates) 来合成 Ranking Function。
*   **Terminating 侧 (54.4%):** 许多 Aeval 用例可能包含非线性逻辑或复杂的控制流，超出了 Lasso 的线性表达能力。
*   **Non-Terminating 侧 (64.2%):** CPA 在证明不终止（寻找循环反例）方面通常较强，但在此数据集上依然有大量漏报 (MAYBE/UNKNOWN)。

### 3.2 为什么移除 RAG 反而提升了性能？
*   **假设 1 (Out-of-Distribution):** Aeval 数据集的代码风格或逻辑模式可能与 EvolveTerm 知识库 (主要基于 SV-Benchmarks) 差异较大。RAG 检索到的“相似”案例可能实际上具有误导性的终止原因。
*   **假设 2 (Overfitting):** LLM 在没有 RAG 干扰的情况下，更倾向于依赖代码本身的逻辑进行推理，这在处理“陌生”代码时可能更稳健。

### 3.3 结论
EvolveTerm 展现了强大的**零样本 (Zero-shot) 推理能力**。即使在不依赖 RAG 和复杂不变式生成的情况下，仅凭 LLM 对代码语义的理解，就能在终止性预测任务上达到 ~89% 的准确率，远超传统工具 CPA-Lasso。

---

## 4. 后续建议

1.  **开启不变式生成:** 建议在 Aeval 数据集上运行完整的 EvolveTerm (With Invariants) 配置，预期可以显著提高 Z3 验证通过率 (目前仅 ~10%)。
2.  **人工复核冲突:** 检查那 2 个 Verified 但 GT 为 Non-Terminating 的案例，确认是否发现了数据集的标注错误。
