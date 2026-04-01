# Experimental Results Analysis Report

## Dataset Description

The evaluation was conducted on a curated dataset of **440 C programs**, referred to as **TPDB Loop 440 (Augmented)**. This dataset is specifically designed to assess the capability of termination analysis tools in handling complex loop structures and code variations.

### Composition
The dataset is constructed from **220 challenging loop benchmarks** selected from the **Termination Problems Data Base (TPDB)**. For each original benchmark, a structurally isomorphic but syntactically distinct variant was generated (denoted as `_aug1`), resulting in a total of 440 instances. This augmentation strategy allows for testing tool robustness against syntactic perturbations while maintaining semantic equivalence.

- **Original Instances:** 230 (50%)
- **Augmented Variants:** 210 (50%)

### Source Distribution
The benchmarks originate from diverse sources within the termination analysis literature and competitions:

- **TPDB/Literature:** 198 instances (45.0%)
- **SV-COMP:** 116 instances (26.4%)
- **Pasta:** 42 instances (9.5%)
- **Chen et al. (SAS 2012):** 36 instances (8.2%)
- **Heizmann et al.:** 20 instances (4.5%)
- **Podelski & Rybalchenko:** 16 instances (3.6%)
- **Windows Drivers:** 6 instances (1.5%)
- **Other:** 6 instances (1.3%)

### Complexity Metrics
The dataset features programs with non-trivial control flows, including multi-loop and nested-loop structures. Key complexity metrics are summarized below:

| Metric | Mean | Median | Max | Std Dev |
| :--- | :---: | :---: | :---: | :---: |
| **Lines of Code (LOC)** | 64.85 | 24 | 3782 | 303.52 |
| **Number of Loops** | 1.29 | 1 | 5 | 0.58 |
| **Max Loop Depth** | 1.20 | 1 | 2 | 0.41 |
| **Loop Variables** | 1.89 | 2 | 6 | 0.93 |

Notably, **25.5%** of the benchmarks contain multiple loops, and **20.7%** feature nested loops, presenting significant challenges for invariant generation and termination proving.

## Overview of Tool Performance

**Total Benchmarks:** 440

| Tool | Solved (Terminate) | Accuracy (%) |
| :--- | :---: | :---: |
| ET+CPA | 410 | 93.18% |
| MuVal | 410 | 93.18% |
| Ultimate | 407 | 92.50% |
| AProVE | 402 | 91.36% |
| iRankFinder | 355 | 80.68% |
| CPA-General | 318 | 72.27% |
| 2ls | 208 | 47.27% |

## Detailed Comparison

The best performing tool is **ET+CPA** with **410** solved instances (93.18%).

- Compared to **MuVal** (410), ET+CPA solved **0** more instances (+0.0%).
- Compared to **Ultimate** (407), ET+CPA solved **3** more instances (+0.7%).
- Compared to **AProVE** (402), ET+CPA solved **8** more instances (+2.0%).
- Compared to **iRankFinder** (355), ET+CPA solved **55** more instances (+15.5%).
- Compared to **CPA-General** (318), ET+CPA solved **92** more instances (+28.9%).
- Compared to **2ls** (208), ET+CPA solved **202** more instances (+97.1%).

## Impact of RAG (Retrieval-Augmented Generation)

We conducted an ablation study to analyze the specific contribution of the RAG component in `ET+CPA`. By isolating instances where the RAG module successfully retrieved relevant reference programs that were crucial for the proof generation, we compared the performance with and without RAG.

| Configuration | Solved (Terminate) | Accuracy (%) |
| :--- | :---: | :---: |
| **ET+CPA (with RAG)** | **410** | **93.18%** |
| ET+CPA (without RAG) | 398 | 90.45% |
| **Improvement** | **+12** | **+2.73%** |

### Qualitative Analysis of RAG Contribution

The RAG component proved particularly effective in identifying **"Program Families"** — groups of code variants sharing similar logical structure or termination arguments. In these cases, RAG successfully retrieved simpler or previously solved variants (Top-K) to guide `ET+CPA` in solving harder, more complex instances that it failed to solve independently.

Specific examples of families where RAG was improved performance include:

1.  **ChenFlurMukhopadhyay-SAS2012-Ex2 Family** (16 variants)
    *   **Without RAG:** Solved 10/16 variants.
    *   **With RAG:** Solved **16/16** variants (+6).
    *   *Mechanism:* The system retrieved simpler resolved variants (e.g., `Ex2.07`, `Ex2.08`) as context effectively enabling the solution of harder variants (e.g., `Ex2.19`, `Ex2.20`, `Ex2.21`).

2.  **PastaB Family** (18 variants)
    *   **Without RAG:** Solved 14/18 variants.
    *   **With RAG:** Solved **18/18** variants (+4).
    *   *Mechanism:* Complex variants `PastaB16` and `PastaB17` were solved by leveraging structural similarities with basic variants like `PastaB1`.

3.  **HeizmannHoenickeLeikePodelski-ATVA2013-Fig Family** (8 variants)
    *   **Without RAG:** Solved 6/8 variants.
    *   **With RAG:** Solved **8/8** variants (+2).
    *   *Mechanism:* The hardest variant `Fig2` (which tools like AProVE/Ultimate struggled with) was solved by retrieving related proofs from `Fig1` and `Fig4`.
