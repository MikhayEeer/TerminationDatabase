#!/usr/bin/env python3
"""
从 CPA 输出目录批量收集信息到 CSV。

聚合来源：
- CPALog.txt：备用结果信息。
- Statistics.txt：终止性结论、时间/CPU、内存。
- terminationAnalysisResult.txt：秩函数 / 不变式 / 非终止证据。
- UsedConfiguration.properties：记录使用的配置。

关注字段：终止性结论、秩函数、不变式、性能（时间、CPU）。
缺失信息留空。
"""
from __future__ import annotations

import argparse
import csv
import re
from pathlib import Path
from typing import Dict, List, Optional


def parse_termination_result(path: Path) -> Dict[str, str]:
    """提取 terminationAnalysisResult.txt 中的秩函数、不变式、非终止证据。"""
    if not path.exists():
        return {"ranking_functions": "", "invariants": "", "nontermination": ""}

    ranking: List[str] = []
    invariants: List[str] = []
    nonterm: List[str] = []

    for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        line = line.strip()
        if not line:
            continue
        if line.startswith("Ranking function"):
            # 直接收集完整行，方便后处理
            ranking.append(line)
        elif "Supporting invariants" in line:
            invariants.append(line)
        elif line.lower().startswith("non-termination argument"):
            nonterm.append(line)

    return {
        "ranking_functions": "; ".join(ranking),
        "invariants": "; ".join(invariants),
        "nontermination": "; ".join(nonterm),
    }


def parse_statistics(path: Path) -> Dict[str, str]:
    """从 Statistics.txt 中提取终止性结论和性能数据。"""
    result = {
        "verification_result": "",
        "total_time": "",
        "analysis_time": "",
        "cpu_time": "",
        "used_heap": "",
    }
    if not path.exists():
        return result

    text = path.read_text(encoding="utf-8", errors="ignore").splitlines()
    for line in text:
        if "Verification result:" in line:
            # 例如：Verification result: FALSE. Property violation (termination) found by chosen configuration.
            match = re.search(r"Verification result:\s*([A-Z]+)", line)
            if match:
                result["verification_result"] = match.group(1)
        elif line.strip().startswith("Total time for CPAchecker"):
            match = re.search(r"Total time for CPAchecker:\s*(\S+)", line)
            if match:
                result["total_time"] = match.group(1)
        elif line.strip().startswith("Time for Analysis"):
            match = re.search(r"Time for Analysis:\s*(\S+)", line)
            if match:
                result["analysis_time"] = match.group(1)
        elif line.strip().startswith("Total CPU time for CPAchecker"):
            match = re.search(r"Total CPU time for CPAchecker:\s*(\S+)", line)
            if match:
                result["cpu_time"] = match.group(1)
        elif line.strip().startswith("Used heap memory"):
            match = re.search(r"Used heap memory:\s*([0-9A-Za-z().\\s]+)", line)
            if match:
                result["used_heap"] = match.group(1).strip()
    return result


def parse_used_config(path: Path) -> Dict[str, str]:
    """提取 UsedConfiguration.properties 中的关键配置（如 termination.config / analysis.name）。"""
    info = {"termination_config": "", "analysis_name": ""}
    if not path.exists():
        return info

    for line in path.read_text(encoding="utf-8", errors="ignore").splitlines():
        if line.startswith("termination.config"):
            parts = line.split("=", 1)
            if len(parts) == 2:
                info["termination_config"] = parts[1].strip()
        elif line.startswith("analysis.name"):
            parts = line.split("=", 1)
            if len(parts) == 2:
                info["analysis_name"] = parts[1].strip()
    return info


def parse_cpalog(path: Path) -> Dict[str, str]:
    """从 CPALog.txt 兜底提取终止性结论。"""
    if not path.exists():
        return {"verification_result_log": ""}

    text = path.read_text(encoding="utf-8", errors="ignore")
    match = re.search(r"Verification result:\s*([A-Z]+)", text)
    return {"verification_result_log": match.group(1) if match else ""}


def collect_one_run(run_dir: Path) -> Dict[str, str]:
    """汇总单个输出目录的信息。"""
    base_name = run_dir.name
    config_type = ""
    if base_name.endswith("_lasso_out"):
        config_type = "lasso"
        file_name = base_name[: -len("_lasso_out")]
    elif base_name.endswith("_general_out"):
        config_type = "general"
        file_name = base_name[: -len("_general_out")]
    else:
        file_name = base_name

    term_path = run_dir / "terminationAnalysisResult.txt"
    stats_path = run_dir / "Statistics.txt"
    log_path = run_dir / "CPALog.txt"
    used_cfg_path = run_dir / "UsedConfiguration.properties"

    result: Dict[str, str] = {
        "file": file_name,
        "config": config_type,
        "output_dir": str(run_dir),
    }

    result.update(parse_termination_result(term_path))
    result.update(parse_statistics(stats_path))
    result.update(parse_cpalog(log_path))
    result.update(parse_used_config(used_cfg_path))

    # 若 Statistics 缺少结论，尝试使用 CPALog 兜底
    if not result.get("verification_result") and result.get("verification_result_log"):
        result["verification_result"] = result["verification_result_log"]

    return result


def main():
    parser = argparse.ArgumentParser(
        description="收集 CPA 输出（CPALog/Statistics/terminationAnalysisResult/UsedConfiguration）信息到 CSV。"
    )
    parser.add_argument(
        "-i",
        "--input",
        default="Results/CPA_Outputs/Loopy_dataset_InvarBenchmark",
        help="CPA 输出根目录，内部包含 *_lasso_out / *_general_out 子目录。",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="Results/cpa_outputs_summary.csv",
        help="汇总结果 CSV 路径。",
    )
    args = parser.parse_args()

    input_dir = Path(args.input)
    if not input_dir.exists():
        raise SystemExit(f"输入目录不存在: {input_dir}")

    runs = [p for p in input_dir.iterdir() if p.is_dir()]
    runs.sort()

    rows: List[Dict[str, str]] = []
    for run_dir in runs:
        rows.append(collect_one_run(run_dir))

    # 确定 CSV 字段顺序，便于阅读
    fieldnames = [
        "file",
        "config",
        "verification_result",
        "ranking_functions",
        "invariants",
        "nontermination",
        "total_time",
        "analysis_time",
        "cpu_time",
        "used_heap",
        "termination_config",
        "analysis_name",
        "output_dir",
    ]

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with output_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for row in rows:
            writer.writerow({key: row.get(key, "") for key in fieldnames})

    print(f"收集完成，共 {len(rows)} 条，写入 {output_path}")


if __name__ == "__main__":
    main()
