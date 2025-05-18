#!/usr/bin/env python3

import os
import subprocess
import argparse
import re
import sys
from datetime import datetime

def analyze_termination(file_path, timeout=60):
    """运行CPAchecker终止性分析，返回结果和可能的错误"""
    cmd = [
        "cpachecker",
        "--preprocess",
        "--timelimit", str(timeout),
        "--heap", "8G",
        "--benchmark",
        "--config", "/cpachecker/config/lassoRankerAnalysis.properties",
        "--spec", "/cpachecker/config/specification/TerminatingStatements.spc",
        file_path
    ]
    
    try:
        # 设置超时以防止程序永久运行
        result = subprocess.run(
            cmd, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE,
            timeout=timeout+10,  # 给工具自身超时多留一点时间
            universal_newlines=True
        )

        # 合并stdout和stderr以便更好地分析输出
        output = result.stdout + result.stderr
        
        # CPAchecker的输出格式不同，需要适应性地解析
        if "Verification result: TRUE" in output:
            return "YES", None
        elif "Verification result: UNKNOWN" in output:
            return "Maybe", None
        elif "Verification result: FALSE" in output:
            return "No", None
        elif "Verification status: termination determined" in output:
            return "YES", None
        elif "Verification status: non-termination determined" in output:
            return "No", None
        elif "Verification status: unknown" in output:
            return "Maybe", None
        # 将部分日志保存以便确定问题
        else:
            # 保存完整输出到日志文件以便调试
            log_filename = f"cpachecker_log_{datetime.now().strftime('%Y%m%d_%H%M%S')}.txt"
            with open(log_filename, "w") as log_file:
                log_file.write(f"STDOUT:\n{result.stdout}\n\nSTDERR:\n{result.stderr}")
                
            # 返回更多有用信息
            if "terminate called after throwing an instance of" in output:
                return "ERROR", "CPAchecker crashed with exception"
            elif "OutOfMemoryError" in output:
                return "ERROR", "CPAchecker ran out of memory"
            else:
                return "Unknown", f"Could not determine result. Log saved to {log_filename}"

    except subprocess.TimeoutExpired:
        return "TIMEOUT", f"Analysis timed out after {timeout} seconds"
    except Exception as e:
        return "ERROR", str(e)

def check_workdir():
    '''
    函数确保我们在正确的工作目录，不再需要切换到2ls目录
    '''
    # CPAchecker是系统级安装的，所以不需要特定工作目录
    pass

def main():
    check_workdir()

    parser = argparse.ArgumentParser(description="Run CPAchecker termination analysis on C files")
    parser.add_argument("--directory", 
                        default="/root/term/TerminationDatabase/SVComp_C/",
                        help="Directory containing C files to analyze")
    parser.add_argument("--output", "-o", 
                        default="CPAchecker_Term_Res_SVCOMP.csv", 
                        help="Output file for results (default: CPAchecker_Term_Res_SVCOMP.csv)")
    parser.add_argument("--timeout", "-t", type=int, default=60,
                        help="Timeout in seconds for each file (default: 60)")
    parser.add_argument("--copy", "-c", required=True,
                        help="Copy identifier for this run (required)")
    args = parser.parse_args()
    
    if not os.path.isdir(args.directory):
        print(f"Error: {args.directory} is not a valid directory")
        sys.exit(1)
    
    # 检查CPAchecker是否可用
    try:
        subprocess.run(["cpachecker", "--help"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=5)
    except (subprocess.SubprocessError, FileNotFoundError):
        print("Error: CPAchecker not found or not executable")
        print("Make sure CPAchecker is properly installed and in your PATH")
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
        f.write("file,result,error,copy\n")
    
    for i, file_path in enumerate(c_files):
        print(f"[{i+1}/{len(c_files)}] Analyzing {file_path}...")
        start_time = datetime.now()
        
        result, error = analyze_termination(
            file_path, 
            timeout=args.timeout
        )
        
        time_taken = (datetime.now() - start_time).total_seconds()
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        print(f"  Result: {result} (took {time_taken:.2f}s)")
        if error:
            print(f"  Error: {error}")
        
        with open(args.output, "a") as f:
            file_path_escaped = file_path.replace('/root/term/TerminationDatabase/', '').replace('"', '""')
            error_escaped = "" if error is None else error.replace('"', '""')
            f.write(f'"{file_path_escaped}",{result},"{error_escaped}",{args.copy}\n')

if __name__ == "__main__":
    main()