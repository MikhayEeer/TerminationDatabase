#!/usr/bin/env python3

import os
import subprocess
import argparse
import re
import sys
from datetime import datetime

def analyze_termination(file_path, 
                        timeout=300, 
                        context_sensitive=True):
    """运行2ls终止性分析，返回结果和可能的错误"""
    cmd = ["src/2ls/2ls", "--termination"]
    
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

        # 分析输出，判断终止性结果
        if "VERIFICATION SUCCESSFUL" in result.stdout:
            return "YES", None
        elif "VERIFICATION INCONCLUSIVE" in result.stdout:
            # 检查是否是非终止性结果
            return "Maybe", None
        elif "VERIFICATION FAILED" in result.stdout:
            return "No", None
        else:
            # 检查是否有.i文件可用
            i_file_path = file_path.replace('.c', '.i')
            if os.path.exists(i_file_path):
                print(f"  Trying with preprocessed .i file: {i_file_path}")
                return analyze_termination(i_file_path, timeout, context_sensitive)
            return "Failed", f"Unexpected output: {result.stdout[:200]}..."

    except subprocess.TimeoutExpired:
        # 检查是否有.i文件可用
        i_file_path = file_path.replace('.c', '.i')
        if os.path.exists(i_file_path):
            print(f"  TIMEOUT - Trying with preprocessed .i file: {i_file_path}")
            return analyze_termination(i_file_path, timeout, context_sensitive)
        return "TIMEOUT", f"Analysis timed out after {timeout} seconds"
    
    except Exception as e:
        # 检查是否有.i文件可用
        i_file_path = file_path.replace('.c', '.i')
        if os.path.exists(i_file_path):
            print(f"  ERROR - Trying with preprocessed .i file: {i_file_path}")
            return analyze_termination(i_file_path, timeout, context_sensitive)
        return "ERROR", str(e)

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
    check_workdir()

    parser = argparse.ArgumentParser(description="Run 2LS termination analysis on C files")
    parser.add_argument("--directory", 
                        default="/root/term/TerminationDatabase/SVComp_C/",
                        help="Directory containing C files to analyze")
    parser.add_argument("--output", "-o", 
                        default="2ls_Term_Res_SVCOMP.csv", 
                        help="Output file for results (default: termination_results.csv)")
    parser.add_argument("--timeout", "-t", type=int, default=300,
                        help="Timeout in seconds for each file (default: 300)")
    parser.add_argument("--no-context-sensitive", action="store_true",
                        help="Disable context-sensitive analysis")
    args = parser.parse_args()
    
    if not os.path.isdir(args.directory):
        print(f"Error: {args.directory} is not a valid directory")
        sys.exit(1)
    
    # 确保2ls存在
    if not os.path.exists("src/2ls/2ls"):
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
    
    with open(args.output, "w") as f:
        f.write("file,result,error,time_taken\n")
    
    for i, file_path in enumerate(c_files):
        print(f"[{i+1}/{len(c_files)}] Analyzing {file_path}...")
        start_time = datetime.now()
        
        result, error = analyze_termination(
            file_path, 
            timeout=args.timeout,
            context_sensitive=not args.no_context_sensitive
        )
        
        time_taken = (datetime.now() - start_time).total_seconds()
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        print(f"  Result: {result} (took {time_taken:.2f}s)")
        if error:
            print(f"  Error: {error}")
        
        with open(args.output, "a") as f:
            file_path_escaped = file_path.replace('/root/term/TerminationDatabase/', '').replace('"', '""')
            error_escaped = "" if error is None else error.replace('"', '""')
            f.write(f'"{file_path_escaped}",{result},"{error_escaped}",{time_taken:.2f}\n')

if __name__ == "__main__":
    main()