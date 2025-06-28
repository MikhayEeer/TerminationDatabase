#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import os
import glob
import ast
import csv
import argparse

def is_incorrect_prediction(list_column_str, expected_kind):
    """
    判断 list_column 中是否存在与 (TERM, expected_kind) 不一致的条目
    """
    try:
        entries = ast.literal_eval(list_column_str)
    except Exception:
        # 解析失败视为“异常判断”
        return True

    for status, kind in entries:
        if status != 'TERM' or kind != expected_kind:
            return True
    return False

def main():
    p = argparse.ArgumentParser(
        description='对每个 CSV 文件，统计 phase_count!=1 的行数及其中预测不全为 (TERM, kind) 的行数'
    )
    p.add_argument('input_dir', help='存放 .csv 文件的目录')
    args = p.parse_args()

    pattern = os.path.join(args.input_dir, '*.csv')
    for csv_path in glob.glob(pattern):
        source = os.path.basename(csv_path)
        total_non1 = 0
        total_incorrect = 0

        # 若想打印具体的错误行，可取消下面两行注释
        # print(f"\n--- Incorrect predictions in {source} ---")
        # print(','.join(['filename','has_match','kind','phase_count','list_column','time']))

        with open(csv_path, newline='', encoding='utf-8') as f:
            reader = csv.reader(f)
            for row in reader:
                if len(row) < 6:
                    continue

                kind = row[2].strip()         # e.g. 'Nested' or 'Multi'
                phase_count = row[3].strip()  # string
                list_column = row[4].strip()

                # 只处理 phase_count != '1'
                if phase_count != '1':
                    total_non1 += 1
                    if is_incorrect_prediction(list_column, kind):
                        total_incorrect += 1
                        # 若要打印出错行，可启用下面这一行
                        # print(','.join([row[0], row[1], kind, phase_count,
                        #                  f'"{list_column.replace(\'"\', \'""\')}"', row[5]]))

        # 输出该文件的统计结果
        print(f"{source}: non1 count = {total_non1}, incorrect = {total_incorrect}")

if __name__ == '__main__':
    main()