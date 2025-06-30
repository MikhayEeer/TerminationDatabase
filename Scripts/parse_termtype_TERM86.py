#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import csv
import ast
import argparse
from statistics import mean

def process(input_csv, output_dir):
    # 确保输出目录存在
    os.makedirs(output_dir, exist_ok=True)

    base = os.path.splitext(os.path.basename(input_csv))[0]
    models = ['claude37', 'gpt4o', 'o1mini']
    modes  = ['direct', 'fewshot']

    # 为每个 (model, mode) 创建一个 writer
    writers = {}
    for m in models:
        for mode in modes:
            out_fname = os.path.join(
                output_dir,
                f"termtype_{base}_{m}_{mode}_processed.csv"
            )
            f = open(out_fname, 'w', newline='', encoding='utf-8')
            w = csv.writer(f)
            w.writerow(['file_name', 'terminate', 'category', 'phase_count', 'list_column', 'avg_time'])
            writers[(m, mode)] = (f, w)

    # 读取并处理输入 CSV
    with open(input_csv, newline='', encoding='utf-8') as fin:
        reader = csv.DictReader(fin)
        for row in reader:
            fn   = row['file_name']
            term = row['terminate']
            cat  = row['category']
            pc   = row['phase_count']

            for m in models:
                for mode in modes:
                    res_col  = f"{m}_{mode}_results"
                    time_col = f"{m}_{mode}_times"

                    try:
                        res_tuple = ast.literal_eval(row[res_col])
                    except Exception:
                        res_tuple = ()
                    try:
                        time_tuple = [float(x) for x in ast.literal_eval(row[time_col])]
                    except Exception:
                        time_tuple = []

                    list_column = "[" + ", ".join(
                        f"('TERM', '{r.capitalize()}')" for r in res_tuple
                    ) + "]"
                    avg_time = mean(time_tuple) if time_tuple else 0.0
                    avg_time_str = f"{avg_time:.2f}"

                    _, writer = writers[(m, mode)]
                    writer.writerow([fn, term, cat, pc, list_column, avg_time_str])

    # 关闭所有输出文件
    for f, _ in writers.values():
        f.close()

    print(f"Done: generated 6 files in '{output_dir}'")

if __name__ == "__main__":
    p = argparse.ArgumentParser(
        description="拆分 termtype CSV 为每个模型 direct/fewshot 的 6 个 processed 文件，并输出到指定目录"
    )
    p.add_argument("input_csv", help="原始 CSV 文件路径")
    p.add_argument("output_dir", help="输出目录")
    args = p.parse_args()
    process(args.input_csv, args.output_dir)
