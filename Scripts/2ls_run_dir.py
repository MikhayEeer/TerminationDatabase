#!/usr/bin/env python3

import os
import subprocess
import argparse
import re
import sys
import csv
from datetime import datetime

COMMAND = '../2ls/src/2ls/2ls'

def get_processed_files(csv_file):
    """读取已存在的CSV文件，获取已处理的文件列表"""
    processed_files = set()
    if not os.path.exists(csv_file):
        return processed_files
    
    try:
        with open(csv_file, 'r') as f:
            reader = csv.reader(f)
            next(reader)  # 跳过表头
            for row in reader:
                if row and len(row) > 0:
                    # 提取文件路径（第一列）
                    file_path = row[0].strip('"')
                    processed_files.add(file_path)
        print(f"[INFO] 从CSV文件中读取到 {len(processed_files)} 个已处理文件记录")
    except Exception as e:
        print(f"[WARNING] 读取CSV文件时出错: {e}")
    
    return processed_files

def analyze_termination(file_path, 
                        timeout=300, 
                        context_sensitive=True,
                        using_i_file=False):  # 添加标志表示是否已经在使用.i文件
    """运行2ls终止性分析，返回结果和可能的错误"""
    cmd = [COMMAND, "--termination"]
    
    if context_sensitive:
        cmd.append("--context-sensitive")
    
    cmd.append(file_path)
    
    try:
        # 设置超时以防止程序永久运行
        result = subprocess.run(
            cmd, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE,
            timeout=timeout,
            universal_newlines=True
        )

        # 如果遇到 Conversion error，则查看是否有后缀.i文件再进行运行

        # 分析输出，判断终止性结果
        if "VERIFICATION SUCCESSFUL" in result.stdout:
            return "YES", None, file_path
        elif "VERIFICATION INCONCLUSIVE" in result.stdout:
            # 检查是否是非终止性结果
            return "Maybe", None, file_path
        elif "VERIFICATION FAILED" in result.stdout:
            return "No", None, file_path
        else:
            # 检查是否有.i文件可用且当前不是已经在处理.i文件
            i_file_path = file_path.replace('.c', '.i')
            if os.path.exists(i_file_path) and not using_i_file:
                print(f"  Trying with preprocessed .i file: {i_file_path}")
                return analyze_termination(i_file_path, timeout, context_sensitive, using_i_file=True)
            return "Failed", f"Unexpected output: {result.stdout[:200]}...", file_path

    except subprocess.TimeoutExpired:
        # 检查是否有.i文件可用且当前不是已经在处理.i文件
        i_file_path = file_path.replace('.c', '.i')
        if os.path.exists(i_file_path) and not using_i_file:
            print(f"  TIMEOUT - Trying with preprocessed .i file: {i_file_path}")
            return analyze_termination(i_file_path, timeout, context_sensitive, using_i_file=True)
        return "TIMEOUT", f"Analysis timed out after {timeout} seconds", file_path
    
    except Exception as e:
        # 检查是否有.i文件可用且当前不是已经在处理.i文件
        i_file_path = file_path.replace('.c', '.i')
        if os.path.exists(i_file_path) and not using_i_file:
            print(f"  ERROR - Trying with preprocessed .i file: {i_file_path}")
            return analyze_termination(i_file_path, timeout, context_sensitive, using_i_file=True)
        return "ERROR", str(e), file_path

def check_workdir():
    '''
    函数在本服务器适用，移植请注意修改；
    函数目的：
        - 执行与存储分离：脚本统一存放，不影响工具目录
        - 减少其他代码修改，增强代码可复用性
    '''
    EXPECTED_DIR = "/root/term/2ls"
    current_dir = os.getcwd()
    if current_dir != EXPECTED_DIR:
        try:
            os.chdir(EXPECTED_DIR)
            print(f"Changed working directory to {EXPECTED_DIR}")
        except Exception as e:
            print(f"Error: Could not change to directory {EXPECTED_DIR}")
            print(f"Error details: {str(e)}")
            sys.exit(1)

def main():
    #check_workdir()

    parser = argparse.ArgumentParser(description="Run 2LS termination analysis on C files")
    parser.add_argument("--directory", 
                        default="SVComp_C/",
                        help="Directory containing C files to analyze")
    parser.add_argument("--output", "-o", 
                        default="Results/2ls_SVComp_copy3-2.csv", 
                        help="Output file for results (default: termination_results.csv)")
    parser.add_argument("--timeout", "-t", type=int, default=300,
                        help="Timeout in seconds for each file (default: 300)")
    parser.add_argument("--no-context-sensitive", action="store_true",
                        help="Disable context-sensitive analysis")
    parser.add_argument("--force", "-f", action="store_true",
                        help="强制重新分析所有文件（忽略已分析过的文件）")
    args = parser.parse_args()
    
    if not os.path.isdir(args.directory):
        print(f"Error: {args.directory} is not a valid directory")
        sys.exit(1)
    
    # 确保2ls存在
    if not os.path.exists(COMMAND):
        print("Error: 2LS executable not found at src/2ls/2ls")
        print("Make sure you're running this script from the 2ls root directory")
        sys.exit(1)
    
    c_files = []
    for root, _, files in os.walk(args.directory):
        for file in files:
            if file.endswith(".c"):
                c_files.append(os.path.join(root, file))
    
    if not c_files:
        print(f"No C files found in {args.directory}")
        sys.exit(0)
    
    print(f"Found {len(c_files)} C files to analyze")
    
    # 检查是否为续传模式
    is_continuation = os.path.exists(args.output) and not args.force
    processed_files = set()
    
    if is_continuation:
        processed_files = get_processed_files(args.output)
        print(f"Continuing from previous run, skipping {len(processed_files)} already processed files")
    else:
        # 创建新CSV文件
        with open(args.output, "w") as f:
            f.write("file,result,error,time_taken,processed_time\n")
    
    skipped_count = 0
    analyzed_count = 0
    
    for i, file_path in enumerate(c_files):
        # 标准化文件路径用于比较
        normalized_path = file_path.replace('/root/term/TerminationDatabase/', '')
        
        # 检查是否已经处理过
        if normalized_path in processed_files:
            print(f"[{i+1}/{len(c_files)}] Skipping already processed file: {file_path}")
            skipped_count += 1
            continue
        
        print(f"[{i+1}/{len(c_files)}] Analyzing {file_path}...")
        start_time = datetime.now()
        
        result, error, real_file_path = analyze_termination(
            file_path, 
            timeout=args.timeout,
            context_sensitive=not args.no_context_sensitive
        )
        
        time_taken = (datetime.now() - start_time).total_seconds()
        current_time = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        print(f"  Result: {result} (took {time_taken:.2f}s)")
        if error:
            print(f"  Error: {error}")
        
        with open(args.output, "a") as f:
            file_path_escaped = real_file_path.replace('/root/term/TerminationDatabase/', '').replace('"', '""')
            error_escaped = "" if error is None else error.replace('"', '""')
            f.write(f'"{file_path_escaped}",{result},"{error_escaped}",{time_taken:.2f},"{current_time}"\n')
        
        analyzed_count += 1
    
    print(f"Analysis complete: {analyzed_count} files analyzed, {skipped_count} files skipped.")

if __name__ == "__main__":
    main()