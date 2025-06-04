#!/usr/bin/env python3
'''
Run this scripts:
ulimit -Sv $((64*1024*1024)) && \
    python Scripts/cpa_run_dir.py \
        -d TPDB_YES/ TPDB_NO/ \
        -o Results/CPA_TPDB_Certain_lasso+general.csv \
        -m 32

test mode:
ulimit -Sv $((64*1024*1024)) && \
    python Scripts/cpa_run_dir.py \
        -d TPDB_Y2024_filtered_VBS/Di_Stefano_20 \
        -o Results/Test_CPA_TPDB_Di_lasso+general.csv \
        -m 32

Original Command:
cpachecker --preprocess --timelimit 120 \
    --config /opt/cpachecker/config/lassoRankerAnalysis.properties \
    --spec /opt/cpachecker/config/specification/TerminatingStatements.spc \
    --heap 32G --no-output-files --output-path ../CPAcheck/output/ \
    [file]
'''
import os
import subprocess
import argparse
import re
import sys
from datetime import datetime

COMMAND = "cpachecker"
CONFIG_GENERAL = "/opt/cpachecker/config/terminationAnalysis.properties"
CONFIG_LASSO = "/opt/cpachecker/config/lassoRankerAnalysis.properties"
OUTPUT_PATH = "../CPAchecker/output/"
SPEC_PATH = "/opt/cpachecker/config/specification/TerminatingStatements.spc"

def analyze_termination(file_path, 
                        config_type, 
                        timeout=120,
                        mem=32):
    """
    Runs CPAchecker termination analysis on a given C file.
    Parameters:
        file_path (str): Path to the C file to analyze.
        config_type (str): Path to the CPAchecker configuration file to use.
        timeout (int, optional): Maximum time in seconds for the analysis (default: 120).
        mem (int, optional): Maximum heap memory in GB for CPAchecker (default: 32).
    Returns:
        tuple: A tuple containing:
            - result (str): One of "YES", "NO", "MAYBE", "ERROR", or "TIMEOUT".
            - error (str or None): Error message if an error occurred, otherwise None.
    """
    cmd = [
        COMMAND,
        "--preprocess",
        "--timelimit", str(timeout),
        "--heap", str(mem)+'G',
        "--no-output-files",
        "--output-path", OUTPUT_PATH,
        "--config", config_type,
        "--spec", SPEC_PATH,
        file_path
    ]
    
    try:
        # 设置超时以防止程序永久运行
        result = subprocess.run(
            cmd, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE,
            timeout=timeout,  # 给工具自身超时多留一点时间
            universal_newlines=True
        )

        # 合并stdout和stderr以便更好地分析输出
        output = result.stdout + result.stderr
        
        # CPAchecker的输出格式不同，需要适应性地解析
        if "Verification result: TRUE" in output:
            return "YES", None
        elif "Verification result: UNKNOWN" in output:
            return "MAYBE", None
        elif "Verification result: FALSE" in output:
            return "NO", None
        else:
            return "ERROR", None

    except subprocess.TimeoutExpired:
        return "TIMEOUT", f"Analysis timed out after {timeout} seconds"
    except Exception as e:
        return "ERROR", str(e)

def main():

    parser = argparse.ArgumentParser(description="Run CPAchecker termination analysis on C files")
    parser.add_argument("-d","--directory", nargs='+',
                        default=["/root/term/TerminationDatabase/SVComp_C/"],
                        help="Directories containing C files to analyze (can specify multiple)")
    parser.add_argument("--output", "-o", 
                        default="CPAchecker_Term_Res_SVCOMP.csv", 
                        help="Output file for results (default: CPAchecker_Term_Res_SVCOMP.csv)")
    parser.add_argument("--timeout", "-t", type=int, default=120,
                        help="Timeout in seconds for each file (default: 120)")
    parser.add_argument("-m", "--memory", type=int, default=8,
                        help="int, Memory for cpachecker use (default: 8GB)")
    args = parser.parse_args()
    
    # 验证所有目录是否存在
    for directory in args.directory:
        if not os.path.isdir(directory):
            print(f"Error: {directory} is not a valid directory")
            sys.exit(1)
    
    # 检查CPAchecker是否可用
    try:
        subprocess.run(["cpachecker", "--help"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=5)
    except (subprocess.SubprocessError, FileNotFoundError):
        print("Error: CPAchecker not found or not executable")
        print("Make sure CPAchecker is properly installed and in your PATH")
        sys.exit(1)
    
    # find c programs from multiple directories
    c_files = []
    for directory in args.directory:
        print(f"Searching for C files in {directory}...")
        for root, _, files in os.walk(directory):
            for file in files:
                if file.endswith(".c"):
                    c_files.append(os.path.join(root, file))
    
    if not c_files:
        print(f"No C files found in directories: {', '.join(args.directory)}")
        sys.exit(0)
    print(f"Found {len(c_files)} C files to analyze")

    with open(args.output, "w") as f:
        f.write("file,result_lasso,error1,result_general,error2,path\n")
    
    for i, file_path in enumerate(c_files):
        start_time = datetime.now()
        basename = os.path.basename(file_path)
        print(f"[ {i+1}:1 / {len(c_files)} ] Analyzing {file_path}...")
        result1, error1 = analyze_termination(
            file_path, 
            CONFIG_LASSO,
            args.timeout,
            args.memory
        )
        print(f"[ {i+1}:2 / {len(c_files)} ] Analyzing {file_path}...")
        result2, error2 = analyze_termination(
            file_path, 
            CONFIG_GENERAL,
            args.timeout,
            args.memory
        )
        
        time_taken = (datetime.now() - start_time).total_seconds()
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        print(f"  Lasso   Result: {result1}")
        print(f"  General Result: {result2}\n  (took {time_taken:.2f}s)")
        if error1 or error2:
            print(f"  Lasso   Error: {error1}")
            print(f"  General Error: {error2}")
        
        with open(args.output, "a") as f:
            file_path_escaped = file_path.replace('/root/term/TerminationDatabase/', '').replace('"', '""')
            error1_escaped = "" if error1 is None else error1.replace('"', '""')
            error2_escaped = "" if error2 is None else error2.replace('"', '""')
            f.write(f'"{basename}",{result1},"{error1_escaped}",{result2},"{error2_escaped}","{file_path_escaped}"\n')

if __name__ == "__main__":
    main()