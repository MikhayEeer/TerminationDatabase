#!/usr/bin/env python3
"""
解析SVMRanker输出文件的脚本
将output_*.bpl.txt文件的内容解析并存储到CSV文件中
"""

import os
import re
import csv
import glob
from typing import Dict, List, Optional, Tuple


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
        'is_terminating': None,
        'mode': None,
        'running_time': None,
        'ranking_function': None
    }
    
    depth_match = re.search(r'(NESTED|MULTIPHASE) DEPTH:\s*(\d+)', content)
    if depth_match:
        result['depth'] = int(depth_match.group(2))

    learning_result_match = re.search(r'LEARNING RESULT:\s*(TERMINATE|NONTERM|UNKNOWN)', content)
    if learning_result_match:
        result['is_terminating'] = learning_result_match.group(1)
    
    # 解析Mode
    mode_match = re.search(r'Mode:\s*([^\n]+)', content)
    if mode_match:
        result['mode'] = mode_match.group(1).strip()
    
    # 解析Running time
    time_match = re.search(r'Running time:\s*([\d.]+)\s*s', content)
    if time_match:
        result['running_time'] = float(time_match.group(1))
    
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


def parse_all_output_files(directory: str, output_csv: str) -> None:
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
    
    for file_path in files:
        print(f"正在处理: {os.path.basename(file_path)}")
        result = parse_output_file(file_path)
        if result:
            results.append(result)
        else:
            failed_files.append(file_path)
    
    # 保存到CSV
    if results:
        fieldnames = ['file', 'depth', 'is_terminating', 'mode', 'running_time', 'ranking_function']
        
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
    打印解析结果的统计信息
    
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
        terminating = sum(1 for row in data if row['is_terminating'] == 'TERMINATE')
        non_terminating = sum(1 for row in data if row['is_terminating'] == 'NONTERM')
        unknown = sum(1 for row in data if row['is_terminating'] == 'UNKNOWN')
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

        mode_count = {}
        for row in data:
            mode = row['mode']
            if mode:
                mode_count[mode] = mode_count.get(mode, 0) + 1
        
        print(f"\nMode Distribution:")
        for mode in sorted(mode_count.keys()):
            print(f"  {mode}: {mode_count[mode]} files")
            
    except Exception as e:
        print(f"读取统计信息失败: {e}")


def main():
    input_directory = r"e:\Repo\TerminationDatabase\LLM_Pipeline_Exp"
    output_csv = r"e:\Repo\TerminationDatabase\parsed_results.csv"
    
    print("开始解析SVMRanker输出文件...")
    print(f"输入目录: {input_directory}")
    print(f"输出CSV: {output_csv}")
    print("-" * 50)

    parse_all_output_files(input_directory, output_csv)
    
    if os.path.exists(output_csv):
        print_statistics(output_csv)


if __name__ == "__main__":
    main()
