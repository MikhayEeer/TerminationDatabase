#!/usr/bin/env python3
'''
Run this scripts:
ulimit -Sv $((64*1024*1024)) && \
    python3 Src/benchmarks_tools/cpa_run_dir.py \
        -d Datasets/Loopy_dataset_InvarBenchmark \
        -o Results/CPA_loopy_lasso_1211.csv \
        --cpa-output-path Results/CPA_Outputs/Loopy_dataset_InvarBenchmark \
        -m 32

test mode:
ulimit -Sv $((64*1024*1024)) && \
    python Scripts/cpa_run_dir.py \
        -d TPDB_Y2024_filtered_VBS/Di_Stefano_20 \
        -o Results/Test_CPA_TPDB_Di_lasso+general.csv \
        --cpa-output-path Results/CPA_Outputs/TPDB_Y2024_filtered_VBS/Di_Stefano_20 \
        --cpachecker-root /path/to/CPAchecker-4.2.2-unix \
        -m 32

Original Command:
./bin/cpachecker --preprocess --timelimit 300 \
    --config config/lassoRankerAnalysis.properties \
    --spec config/specification/TerminatingStatements.spc \
    --heap 32G --output Testoutputs/ \
    [file]
./bin/cpachecker --preprocess --timelimit 300\
    --config config/lassoRankerAnalysis.properties\
    --spec config/specification/TerminatingStatements.spc\
    --heap 32G --output-path Testoutputs/\
    ../TerminationDatabase/Datasets/Loopy_dataset_InvarBenchmark/loop_invariants/code2inv/23.c
'''
import os
import subprocess
import argparse
import re
import sys
import shutil
from pathlib import Path
from datetime import datetime

# CPAchecker is checked first via CPACHECKER_ROOT env, then relative to this file
SCRIPT_DIR = Path(__file__).resolve().parent
DEFAULT_CPACHECKER_ROOT = (SCRIPT_DIR / "../../../CPAchecker-4.2.2-unix").resolve()
CPACHECKER_ROOT = Path(os.environ.get("CPACHECKER_ROOT", DEFAULT_CPACHECKER_ROOT)).expanduser()
COMMAND = CPACHECKER_ROOT / "bin/cpachecker"
CONFIG_GENERAL = CPACHECKER_ROOT / "config/terminationAnalysis.properties"
CONFIG_LASSO = CPACHECKER_ROOT / "config/lassoRankerAnalysis.properties"
OUTPUT_PATH_DEFAULT = "Results/CPA_Outputs/Loopy_dataset_InvarBenchmark"
OUTPUT_PATH = OUTPUT_PATH_DEFAULT
SPEC_PATH = CPACHECKER_ROOT / "config/specification/TerminatingStatements.spc"
TIMEOUT = 300

def analyze_termination(file_path, 
                        config_type, 
                        timeout=TIMEOUT,
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
            - ranking_function (str): Extracted ranking function or "None".
            - output_dir (str): Path to the directory containing full output files.
    """
    file_name = os.path.basename(file_path)
    # Create specific output directory for this file and config
    # We append a suffix based on config to avoid overwriting if running both configs
    config_str = str(config_type)
    config_suffix = "lasso" if "lasso" in config_str else "general"
    specific_out_dir = os.path.join(OUTPUT_PATH, f"{file_name}_{config_suffix}_out")
    
    if os.path.exists(specific_out_dir):
        try:
            shutil.rmtree(specific_out_dir)
        except:
            pass
    os.makedirs(specific_out_dir, exist_ok=True)

    cmd = [
        str(COMMAND),
        "--preprocess",
        "--timelimit", str(timeout),
        "--heap", str(mem)+'G',
        "--output-path", specific_out_dir,
        "--config", config_str,
        "--spec", str(SPEC_PATH),
        file_path
    ]
    #print(f"Debug: \n {cmd}")
    
    ranking_function = "None"

    try:
        # 设置超时以防止程序永久运行
        result = subprocess.run(
            cmd, 
            stdout=subprocess.PIPE, 
            stderr=subprocess.PIPE,
            timeout=timeout + 10,  # 给工具自身超时多留一点时间
            universal_newlines=True
        )

        # 合并stdout和stderr以便更好地分析输出
        output = result.stdout + result.stderr
        
        # 尝试从 stdout 提取 Ranking Function
        rf_match = re.search(r"Ranking function:\s*(.+)", output)
        if rf_match:
            ranking_function = rf_match.group(1).strip()
        
        # CPAchecker的输出格式不同，需要适应性地解析
        status = "FAILED"
        if "Verification result: TRUE" in output:
            status = "YES"
        elif "Verification result: UNKNOWN" in output:
            status = "MAYBE"
        elif "Verification result: FALSE" in output:
            status = "NO"
        #print(f"Debug: \n{output}")
        #exit(0)
        
        return status, None, ranking_function, specific_out_dir

    except subprocess.TimeoutExpired:
        return "TIMEOUT", f"Analysis timed out after {timeout} seconds", "None", specific_out_dir
    except Exception as e:
        return "ERROR", str(e), "None", specific_out_dir

def main():

    parser = argparse.ArgumentParser(description="Run CPAchecker termination analysis on C files")
    parser.add_argument("-d","--directory", nargs='+',
                        default=["/root/term/TerminationDatabase/SVComp_C/"],
                        help="Directories containing C files to analyze (can specify multiple) | 待分析的C文件目录（可多个）")
    parser.add_argument("--output", "-o", 
                        default="CPAchecker_Term_Res_SVCOMP.csv", 
                        help="Output CSV file for results (default: CPAchecker_Term_Res_SVCOMP.csv) | 结果CSV输出路径")
    parser.add_argument("--cpa-output-path",
                        default=OUTPUT_PATH_DEFAULT,
                        help=f"CPAchecker output directory root (default: {OUTPUT_PATH_DEFAULT}) | CPAchecker输出目录根路径")
    parser.add_argument("--timeout", "-t", type=int, default=TIMEOUT,
                        help=f"Timeout in seconds for each file (default: {TIMEOUT}) | 每个文件超时秒数")
    parser.add_argument("-m", "--memory", type=int, default=8,
                        help="int, Memory for cpachecker use (default: 8GB) | CPAchecker堆内存(GB)")
    parser.add_argument("--cpachecker-root",
                        default=None,
                        help="CPAchecker root directory (overrides CPACHECKER_ROOT env if set) | CPAchecker根目录(优先于环境变量)")
    parser.add_argument(
        "--enable-general",
        action="store_true",
        help="同时运行 general 配置（默认仅运行 lasso）",
    )
    args = parser.parse_args()
    
    # Apply CLI overrides for CPAchecker and output paths
    global CPACHECKER_ROOT, COMMAND, CONFIG_GENERAL, CONFIG_LASSO, SPEC_PATH, OUTPUT_PATH
    if args.cpachecker_root:
        CPACHECKER_ROOT = Path(args.cpachecker_root).expanduser()
    COMMAND = CPACHECKER_ROOT / "bin/cpachecker"
    CONFIG_GENERAL = CPACHECKER_ROOT / "config/terminationAnalysis.properties"
    CONFIG_LASSO = CPACHECKER_ROOT / "config/lassoRankerAnalysis.properties"
    SPEC_PATH = CPACHECKER_ROOT / "config/specification/TerminatingStatements.spc"
    OUTPUT_PATH = args.cpa_output_path

    # 验证所有目录是否存在
    for directory in args.directory:
        if not os.path.isdir(directory):
            print(f"Error: {directory} is not a valid directory")
            sys.exit(1)
    
    # 检查CPAchecker是否可用
    if not COMMAND.exists():
        print(f"Error: CPAchecker not found at {COMMAND}")
        print("Set CPACHECKER_ROOT or install CPAchecker in the default location.")
        sys.exit(1)
    try:
        subprocess.run([str(COMMAND), "--help"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, timeout=5)
    except (subprocess.SubprocessError, FileNotFoundError):
        print(f"Error: CPAchecker not executable at {COMMAND}")
        print("Check your CPACHECKER_ROOT or CPAchecker installation.")
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

    # Ensure output directories exist
    output_dir = os.path.dirname(args.output)
    if output_dir:
        os.makedirs(output_dir, exist_ok=True)
    os.makedirs(OUTPUT_PATH, exist_ok=True)

    # Updated header to include Ranking Function and Output Path
    with open(args.output, "w") as f:
        f.write("file,result_lasso,error1,rf_lasso,out_lasso,result_general,error2,rf_general,out_general,cost_time_lasso,cost_time_general,path\n")
    
    for i, file_path in enumerate(c_files):
        start_time = datetime.now()
        basename = os.path.basename(file_path)
        print(f"[ {i+1}:1 / {len(c_files)} ] Analyzing {file_path}...")
        
        lasso_start = datetime.now()
        result1, error1, rf1, out1 = analyze_termination(
            file_path, 
            CONFIG_LASSO,
            args.timeout,
            args.memory
        )
        lasso_time = (datetime.now() - lasso_start).total_seconds()
        
        # 根据命令行开关决定是否运行 general 配置，默认不跑
        if args.enable_general:
            print(f"[ {i+1}:2 / {len(c_files)} ] Analyzing {file_path}...")
            general_start = datetime.now()
            result2, error2, rf2, out2 = analyze_termination(
                file_path, 
                CONFIG_GENERAL,
                args.timeout,
                args.memory
            )
            general_time = (datetime.now() - general_start).total_seconds()
        else:
            # 占位值保持 CSV 列一致
            result2, error2, rf2, out2 = ("", None, "None", "")
            general_time = 0.0
        
        time_taken = (datetime.now() - start_time).total_seconds()
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        
        print(f"  Lasso   Result: {result1} (RF: {rf1})")
        if args.enable_general:
            print(f"  General Result: {result2} (RF: {rf2})")
        else:
            print("  General Result: [skipped]")
        print(f"  (took {time_taken:.2f}s)")
        if error1:
            print(f"  Lasso   Error: {error1}")
        if error2:
            print(f"  General Error: {error2}")
        
        with open(args.output, "a") as f:
            file_path_escaped = file_path.replace('/root/term/TerminationDatabase/', '').replace('"', '""')
            error1_escaped = "" if error1 is None else error1.replace('"', '""')
            error2_escaped = "" if error2 is None else error2.replace('"', '""')
            rf1_escaped = rf1.replace('"', '""')
            rf2_escaped = rf2.replace('"', '""')
            
            # Write extended row
            f.write(f'"{basename}",{result1},"{error1_escaped}","{rf1_escaped}","{out1}",{result2},"{error2_escaped}","{rf2_escaped}","{out2}",{lasso_time:.2f},{general_time:.2f},"{file_path_escaped}"\n')

if __name__ == "__main__":
    main()
