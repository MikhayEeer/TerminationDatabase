#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import glob
import ast
import csv
import argparse

def is_non_single_term(list_column_str):
    """
    判断 list_column 中是否存在任何不等于 ('TERM','Single') 的条目
    """
    try:
        entries = ast.literal_eval(list_column_str)
    except Exception:
        # 解析失败也视为“异常情况”
        return True

    for status, kind in entries:
        if status != 'TERM' or kind != 'Single':
            return True
    return False

def main():
    p = argparse.ArgumentParser(
        description='对每个 CSV 文件，统计 phase_count==1 的行数和其中异常行（非 ("TERM","Single")）的数量'
    )
    p.add_argument('input_dir', help='存放 .csv 文件的目录')
    args = p.parse_args()

    pattern = os.path.join(args.input_dir, '*.csv')
    for csv_path in glob.glob(pattern):
        source = os.path.basename(csv_path)
        total_phase1 = 0
        total_anomalies = 0

        # 如果你也想打印具体的异常行，请取消下面两行的注释
        # print(f"\n--- Anomalies in {source} ---")
        # print(','.join(['filename','has_match','kind','phase_count','list_column','time']))

        with open(csv_path, newline='', encoding='utf-8') as f:
            reader = csv.reader(f)
            for row in reader:
                if len(row) < 6:
                    continue
                phase_count = row[3].strip()
                list_column = row[4].strip()

                if phase_count == '1':
                    total_phase1 += 1
                    if is_non_single_term(list_column):
                        total_anomalies += 1
                        # 若要输出异常行，可启用下面这一行
                        # print(','.join([row[0], row[1], row[2], phase_count, f'"{list_column.replace("\"", "\"\"")}"', row[5]]))

        # 输出该文件统计
        print(f"{source}: phase1 count = {total_phase1}, anomalies = {total_anomalies}")

if __name__ == '__main__':
    main()
