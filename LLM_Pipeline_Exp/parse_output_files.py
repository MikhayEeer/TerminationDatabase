#!/usr/bin/env python3
"""
解析SVMRanker输出文件的脚本
将output_*.bpl.txt文件的内容解析并存储到CSV文件中
"""

import os
import re
import csv
import glob
import argparse
from typing import Dict, List, Optional, Tuple
import matplotlib.pyplot as plt
import pandas as pd


def parse_output_file(file_path: str) -> Optional[Dict]:
    """
    解析单个输出文件
    Args:
        file_path: 输出文件路径
        
    Returns:
        包含解析结果的字典，如果解析失败返回None
    """
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
    except Exception as e:
        print(f"读取文件 {file_path} 失败: {e}")
        return None
    
    result = {
        'file': os.path.basename(file_path).replace('output_', '').replace('.bpl.txt', ''),
        'depth': None,
        'terminating': None,
        'mode': None,
        'svmranker_time': None,
        'ranking_function': None
    }
    
    depth_match = re.search(r'(NESTED|MULTIPHASE) DEPTH:\s*(\d+)', content)
    if depth_match:
        result['depth'] = int(depth_match.group(2))

    learning_result_match = re.search(r'LEARNING RESULT:\s*(TERMINATE|NONTERM|UNKNOWN)', content)
    if learning_result_match:
        result['terminating'] = learning_result_match.group(1)
    
    # 解析Mode
    mode_match = re.search(r'Mode:\s*([^\n]+)', content)
    if mode_match:
        result['mode'] = mode_match.group(1).strip()
    
    # 解析Running time
    time_match = re.search(r'Running time:\s*([\d.]+)\s*s', content)
    if time_match:
        result['svmranker_time'] = float(time_match.group(1))
    
    # 解析Ranking Functions (如果存在)
    ranking_functions = []
    ranking_section_match = re.search(r'-----------RANKING FUNCTIONS----------\n(.*?)(?=\n\n|\nFilename|\Z)', content, re.DOTALL)
    if ranking_section_match:
        ranking_content = ranking_section_match.group(1).strip()
        if ranking_content:
            # 分割多个ranking function（用分号分隔）
            functions = [f.strip() for f in ranking_content.split(';') if f.strip()]
            ranking_functions = functions
    
    # 将ranking functions合并为字符串
    if ranking_functions:
        result['ranking_function'] = '; '.join(ranking_functions)
    else:
        result['ranking_function'] = None
    
    return result


def parse_cli_output_times(cli_output_path: str) -> dict:
    """
    解析CLI_OUTPUT.txt，提取每个bpl文件的Execution Time（单位：秒）
    返回: { bpl文件名(不带路径): execution_time(float) }
    """
    times = {}
    try:
        with open(cli_output_path, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        current_file = None
        for line in lines:
            if line.startswith('--- Processing file'):
                # 例如: --- Processing file 1/226: 43.bpl ---
                m = re.search(r':\s*([^\s]+\.bpl)\s*---', line)
                if m:
                    current_file = m.group(1).strip()
            elif 'Execution Time:' in line and current_file:
                m = re.search(r'Execution Time:\s*([\d.]+)\s*seconds', line)
                if m:
                    times[current_file] = float(m.group(1))
                    current_file = None  # 重置，防止误匹配
    except Exception as e:
        print(f"解析CLI_OUTPUT.txt失败: {e}")
    return times


def parse_all_output_files(directory: str, output_csv: str, cli_output_path: str = None) -> None:
    """
    解析目录中所有的output_*.bpl.txt文件并保存到CSV
    
    Args:
        directory: 包含输出文件的目录路径
        output_csv: 输出CSV文件路径
    """
    pattern = os.path.join(directory, 'output_*.bpl.txt')
    files = glob.glob(pattern)
    
    if not files:
        print(f"在目录 {directory} 中未找到匹配的文件")
        return
    
    print(f"找到 {len(files)} 个文件需要处理")
    input("Press any key to continue...")
    print("Continue to parse the files")

    results = []
    failed_files = []
    
    # 新增：如果提供CLI_OUTPUT.txt路径，则解析llm_run_time
    llm_times = {}
    if cli_output_path and os.path.exists(cli_output_path):
        llm_times = parse_cli_output_times(cli_output_path)
        # 文件名统一为不带路径的bpl名
        # print(f"llm_times: {llm_times}")

    for file_path in files:
        print(f"正在处理: {os.path.basename(file_path)}")
        result = parse_output_file(file_path)
        if result:
            # 增加llm_run_time字段
            bpl_name = result['file'] + '.bpl'
            result['llm_run_time'] = llm_times.get(bpl_name)
            results.append(result)
        else:
            failed_files.append(file_path)
    
    # 保存到CSV
    if results:
        fieldnames = ['file', 'depth', 'terminating', 'mode', 'svmranker_time', 'ranking_function', 'llm_run_time']
        
        try:
            with open(output_csv, 'w', newline='', encoding='utf-8') as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                writer.writeheader()
                writer.writerows(results)
            
            print(f"\n成功处理 {len(results)} 个文件")
            print(f"结果已保存到: {output_csv}")
            
            if failed_files:
                print(f"\n处理失败的文件 ({len(failed_files)} 个):")
                for file_path in failed_files:
                    print(f"  - {os.path.basename(file_path)}")
                    
        except Exception as e:
            print(f"保存CSV文件失败: {e}")
    else:
        print("没有成功解析的文件")


def print_statistics(csv_file: str) -> None:
    """
    打印解析结果的统计信息（更丰富的统计）
    Args:
        csv_file: CSV文件路径
    """
    try:
        with open(csv_file, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            data = list(reader)

        if not data:
            print("CSV文件为空")
            return

        total = len(data)
        terminating = sum(1 for row in data if row['terminating'] == 'TERMINATE')
        non_terminating = sum(1 for row in data if row['terminating'] == 'NONTERM')
        unknown = sum(1 for row in data if row['terminating'] == 'UNKNOWN')
        print(f"\n=== 统计信息 ===")
        print(f"total files: {total}")
        print(f"terminate programs: {terminating} ({terminating/total*100:.1f}%)")
        print(f"nonterm   programs: {non_terminating} ({non_terminating/total*100:.1f}%)")
        print(f"unknown   programs: {unknown} ({unknown/total*100:.1f}%)")

        # 统计nested/multi depth分布
        depth_count = {}
        for row in data:
            depth = row['depth']
            if depth:
                depth_count[depth] = depth_count.get(depth, 0) + 1

        print(f"\nNested/Multi Depth Distribution:")
        for depth in sorted(depth_count.keys()):
            print(f"  Nested/Multi Depth {depth}:{depth_count[depth]} files")

        # 统计mode分布
        mode_count = {}
        for row in data:
            mode = row['mode']
            if mode:
                mode_count[mode] = mode_count.get(mode, 0) + 1

        print(f"\nMode Distribution:")
        for mode in sorted(mode_count.keys()):
            print(f"  {mode}: {mode_count[mode]} files")

        # 收集时间数据
        def safe_float(val):
            try:
                return float(val)
            except Exception:
                return None

        svm_times = [safe_float(row['svmranker_time']) for row in data if row.get('svmranker_time')]
        llm_times = [safe_float(row['llm_run_time']) for row in data if row.get('llm_run_time')]
        total_times = [safe_float(row['svmranker_time']) + safe_float(row['llm_run_time'])
                       for row in data if row.get('svmranker_time') and row.get('llm_run_time')]

        def print_time_stats(times, label):
            if times:
                print(f"{label}:")
                print(f"  min: {min(times):.2f}s, max: {max(times):.2f}s, avg: {sum(times)/len(times):.2f}s, count: {len(times)}")
            else:
                print(f"{label}: 无数据")

        print("\n=== 时间统计 ===")
        print_time_stats(svm_times, "svmranker_time")
        print_time_stats(llm_times, "llm_run_time")
        print_time_stats(total_times, "svmranker_time + llm_run_time")

        # 按terminating分类统计时间
        print("\n=== 按终止性分类的时间统计 ===")
        for term_type in ['TERMINATE', 'NONTERM', 'UNKNOWN']:
            group = [row for row in data if row['terminating'] == term_type]
            svm = [safe_float(row['svmranker_time']) for row in group if row.get('svmranker_time')]
            llm = [safe_float(row['llm_run_time']) for row in group if row.get('llm_run_time')]
            total_t = [safe_float(row['svmranker_time']) + safe_float(row['llm_run_time'])
                       for row in group if row.get('svmranker_time') and row.get('llm_run_time')]
            print(f"\n{term_type}: {len(group)} files")
            print_time_stats(svm, "  svmranker_time")
            print_time_stats(llm, "  llm_run_time")
            print_time_stats(total_t, "  total_time")

        # 按mode分类统计时间
        print("\n=== 按SVM类型(mode)分类的时间统计 ===")
        all_modes = sorted(set(row['mode'] for row in data if row['mode']))
        for mode in all_modes:
            group = [row for row in data if row['mode'] == mode]
            svm = [safe_float(row['svmranker_time']) for row in group if row.get('svmranker_time')]
            llm = [safe_float(row['llm_run_time']) for row in group if row.get('llm_run_time')]
            total_t = [safe_float(row['svmranker_time']) + safe_float(row['llm_run_time'])
                       for row in group if row.get('svmranker_time') and row.get('llm_run_time')]
            print(f"\nmode={mode}: {len(group)} files")
            print_time_stats(svm, "  svmranker_time")
            print_time_stats(llm, "  llm_run_time")
            print_time_stats(total_t, "  total_time")

        # 统计svmranker_time和llm_run_time的分布区间
        def print_histogram(times, label, bins=[0, 1, 3, 10, 30, 60, 120, 300, 600, 999999]):
            if not times:
                print(f"{label}分布: 无数据")
                return
            hist = [0] * (len(bins) - 1)
            for t in times:
                for i in range(len(bins) - 1):
                    if bins[i] <= t < bins[i+1]:
                        hist[i] += 1
                        break
            print(f"{label}分布:")
            for i in range(len(hist)):
                print(f"  {bins[i]:>3} - {bins[i+1]:>3} s: {hist[i]}")

        print("\n=== 时间分布直方图 ===")
        print_histogram(svm_times, "svmranker_time")
        print_histogram(llm_times, "llm_run_time")
        print_histogram(total_times, "total_time")

    except Exception as e:
        print(f"读取统计信息失败: {e}")


def plot_statistics(csv_file: str, output_dir: str = None):
    """
    只绘制统计表格为PNG图片，不再绘制直方图。表头和表格距离更近，表格项加上单位。
    Args:
        csv_file: CSV文件路径
        output_dir: 输出图片目录，默认为csv同目录
    """
    try:
        plt.rcParams['font.sans-serif'] = ['SimHei', 'Microsoft YaHei', 'Arial Unicode MS', 'sans-serif']
        plt.rcParams['axes.unicode_minus'] = False

        df = pd.read_csv(csv_file)
        if output_dir is None:
            output_dir = os.path.dirname(csv_file)
        output_dir = os.path.join(output_dir, 'visualize')
        os.makedirs(output_dir, exist_ok=True)

        df['svmranker_time'] = pd.to_numeric(df['svmranker_time'], errors='coerce')
        df['llm_run_time'] = pd.to_numeric(df['llm_run_time'], errors='coerce')
        df['total_time'] = df['svmranker_time'] + df['llm_run_time']

        def add_unit(val, unit='s'):
            if pd.isna(val):
                return ""
            return f"{val:.2f}{unit}"

        def save_table_as_img(table_df, title, filename, unit='s'):
            # 给表格项加单位（除了count列）
            for col in table_df.columns:
                if col not in ['terminating', 'mode', 'count']:
                    table_df[col] = table_df[col].apply(lambda x: add_unit(x, unit))
            fig, ax = plt.subplots(figsize=(table_df.shape[1]*2.5, table_df.shape[0]*0.6+1.2))
            ax.axis('off')
            tbl = ax.table(cellText=table_df.values, colLabels=table_df.columns, loc='center', cellLoc='center')
            tbl.auto_set_font_size(False)
            tbl.set_fontsize(12)
            tbl.scale(1, 1.5)
            # 表头和表格距离更近
            plt.subplots_adjust(top=0.82, bottom=0.18)
            plt.title(title, fontsize=14, pad=10)
            plt.tight_layout()
            plt.savefig(os.path.join(output_dir, filename))
            plt.close()

        stat_cols = ['count', 'mean', 'min', 'max']
        for col in ['svmranker_time', 'llm_run_time', 'total_time']:
            grouped = df.groupby('terminating')[col].agg(['count', 'mean', 'min', 'max']).round(2)
            grouped = grouped.reset_index()
            save_table_as_img(grouped, f'{col} 按终止性统计', f'{col}_by_terminating.png')

        for col in ['svmranker_time', 'llm_run_time', 'total_time']:
            grouped = df.groupby('mode')[col].agg(['count', 'mean', 'min', 'max']).round(2)
            grouped = grouped.reset_index()
            save_table_as_img(grouped, f'{col} 按类型统计', f'{col}_by_mode.png')

        print(f"统计图像和表格已保存到: {output_dir}")

    except Exception as e:
        print(f"绘制统计图像失败: {e}")


def main():
    parser = argparse.ArgumentParser(description="解析SVMRanker输出文件或分析CSV统计信息")
    parser.add_argument('--mode', choices=['parse', 'stats'], default='parse', help='运行模式: parse(解析txt) 或 stats(分析csv)')
    parser.add_argument('--input_directory', type=str, default=r"LLM_Pipeline_Exp", help='输出txt文件所在目录')
    parser.add_argument('--output_csv', type=str, default=r"LLM_Pipeline_Exp\parsed_results.csv", help='生成的csv文件路径')
    parser.add_argument('--cli_output', type=str, default=r"LLM_Pipeline_Exp\CLI_OUTPUT.txt", help='CLI_OUTPUT.txt路径')
    args = parser.parse_args()

    if args.mode == 'parse':
        print("开始解析SVMRanker输出文件...")
        print(f"输入目录: {args.input_directory}")
        print(f"输出CSV: {args.output_csv}")
        print("-" * 50)
        parse_all_output_files(args.input_directory, args.output_csv, args.cli_output)
        if os.path.exists(args.output_csv):
            print_statistics(args.output_csv)
    elif args.mode == 'stats':
        print("分析CSV统计信息...")
        print(f"CSV文件: {args.output_csv}")
        print("-" * 50)
        if os.path.exists(args.output_csv):
            print_statistics(args.output_csv)
            plot_statistics(args.output_csv)
        else:
            print(f"CSV文件不存在: {args.output_csv}")

if __name__ == "__main__":
    main()
