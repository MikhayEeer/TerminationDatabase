'''
该命令建议在~/term/TerminationDatabase 运行

测试一下：
python Scripts/irank_run_dirs.py SVComp_C/loop-new/ --output Results/test_irank_SV_TP_simpleArgs.csv -cg 1

设置了两组参数组，参数组1是simple后缀，分析线性循环，较为简单的分析
python Scripts/irank_run_dirs.py SVComp_C/ TPDB_Y2024_filtered_VBS/ --output Results/irank_SV_TP_simpleArgs.csv -cg 1

参数组2会更加细致的分析
python Scripts/irank_run_dirs.py SVComp_C/ TPDB_Y2024_filtered_VBS/ --output Results/irank_SV_TP_complexArgs.csv -cg 2
'''
import os
import csv
import argparse
import subprocess
import time
from pathlib import Path
from typing import List, Dict, Tuple, Any, Optional
from tqdm import tqdm  # 添加 tqdm 导入

COMMAND = '../irankfinder-exe/irankfinder'
TIMEOUT = 120

def find_c_files(directories: List[str]) -> List[Dict[str, Any]]:
    """
    查找给定目录中的所有 .c 文件，并检查是否有对应的 .i 文件
    Args:
        directories: 要搜索的目录列表
    Returns:
        包含文件信息的字典列表
    """
    files_info = []
    for directory in directories:
        for root, _, files in os.walk(directory):
            for file in files:
                if file.endswith('.c'):
                    file_path = os.path.join(root, file)
                    i_file = file_path[:-2] + '.i'  # 替换 .c 为 .i
                    
                    file_info = {
                        'c_path': file_path,
                        'i_path': i_file if os.path.exists(i_file) else None,
                        'has_i': os.path.exists(i_file)
                    }
                    files_info.append(file_info)
    print(f"[INFO] Found {len(files_info)} .c files.")  # 修正 size() 方法的错误
    return files_info

def solve(file_path: str, command_group: int = 1) -> Dict[str, Any]:
    """
    处理给定的文件
    
    Args:
        file_path: 文件路径
        command_group: 命令组 (1 或 2)
        
    Returns:
        包含处理结果的字典
    """
    if command_group == 1:
        cmd = [
            COMMAND, 
            '-sccd', '2',
            '-dt', 'iffail',
            '-rniv',
            '-d', 'Z',
            '-v', '0',
            '-cfr-st-scc',
            '-cfr-it', '0',
            '--invariants', 'polyhedra',
            '--termination', 'lrf_pr',
            '--file', file_path
        ]
    elif command_group == 2:
        # 参数组2: 更全面的分析配置
        cmd = [
            COMMAND,
            '-sccd', '5',
            '-dt', 'always',
            '-rniv',
            '-sif',
            '-d', 'Z',
            '-cfr-call-var',
            '-cfr-call',
            '-cfr-head-deep',
            '-cfr-inv',
            '-cfr-st-scc',
            '-cfr-it', '1',
            '-cfr-mx-t', '2',
            '--invariants', 'polyhedra',
            '--termination', 'qnlrf_3',
            '--nontermination', 'monotonicrecset',
            '-nt-reach',
            '-sample-nd-vars',
            '--file', file_path
        ]
    else:
        return {
            'result': 'ERROR: Invalid command group',
            'error': f'Command group {command_group} is not supported',
            'file_type': '.i' if file_path.endswith('.i') else '.c'
        }
    
    try:
        start_time = time.time()
        process = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
        stdout, stderr = process.communicate(timeout=TIMEOUT)
        
        # 计算运行时间
        execution_time = time.time() - start_time
        
        # 检查第一行输出是否为 YES/NO/MAYBE
        first_line = stdout.strip().split('\n')[0] if stdout else ''
        if first_line in ['YES', 'NO', 'MAYBE']:
            result = first_line
            error = None
        else:
            result = 'ERROR'
            error = f'Unexpected output: {first_line}'
            
        # 如果有stderr输出，则视为错误
        if stderr:
            result = 'ERROR'
            error = stderr
            
        return {
            'result': result,
            'error': error,
            'file_type': '.i' if file_path.endswith('.i') else '.c',
            'execution_time': execution_time
        }
    except subprocess.TimeoutExpired:
        # 处理超时情况
        process.kill()
        return {
            'result': 'ERROR',
            'error': 'Execution timed out',
            'file_type': '.i' if file_path.endswith('.i') else '.c',
            'execution_time': TIMEOUT  # 超时时间
        }
    except Exception as e:
        # 处理其他异常
        return {
            'result': 'ERROR',
            'error': str(e),
            'file_type': '.i' if file_path.endswith('.i') else '.c',
            'execution_time': 0
        }

def process_files(files_info: List[Dict[str, Any]], command_group: int = 1) -> List[Dict[str, Any]]:
    """
    处理文件并获取结果
    Args:
        files_info: 包含文件信息的字典列表
        command_group: 使用的命令组 (1 或 2)
    Returns:
        包含处理结果的字典列表
    """
    results = []
    
    for file_info in tqdm(files_info, desc="[Processing]", unit="file"):
        c_result = solve(file_info['c_path'], command_group)
        
        # irankfinder 默认不支持 .i 文件，暂时先屏蔽这部分代码
        if False and (c_result['error'] is not None) and file_info['has_i']:
            i_result = solve(file_info['i_path'], command_group)
            results.append({
                'c_path': file_info['c_path'],
                'has_i': file_info['has_i'],
                'processed_file': file_info['i_path'],
                'result': i_result['result'],
                'error': i_result['error'],
                'file_type': i_result['file_type'],
                'execution_time': i_result['execution_time']
            })
        else:
            results.append({
                'c_path': file_info['c_path'],
                'has_i': file_info['has_i'],
                'processed_file': file_info['c_path'],
                'result': c_result['result'],
                'error': c_result['error'],
                'file_type': c_result['file_type'],
                'execution_time': c_result['execution_time']
            })
    return results

def save_to_csv(results: List[Dict[str, Any]], csv_file: str) -> None:
    """
    将结果保存到 CSV 文件
    Args:
        results: 处理结果列表
        csv_file: CSV 文件路径
    """
    with open(csv_file, 'w', newline='') as f:
        # 基础字段，添加执行时间
        fieldnames = ['c_path', 'result', 'error', 'status', 'execution_time']
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        
        for result in results:
            row = {
                'c_path': result['c_path'],
                'result': result['result'],
                'error': result['error'],
                'status': 'success' if result['error'] is None else 'failed',
                'execution_time': result.get('execution_time', 0)  # 添加执行时间
            }
            writer.writerow(row)

def main(directories: List[str], csv_file: str, command_group: int = 1) -> None:
    """
    主函数：查找文件、处理文件并保存结果

    Args:
        command_group: 使用的命令组 (1 或 2)
        csv_file: 保存结果的 CSV 文件
        directories: 要查找的目录列表
    """
    files_info = find_c_files(directories)
    
    results = process_files(files_info, command_group)
    
    save_to_csv(results, csv_file)

    print(f"[INFO] Processed {len(results)} files, results have saved into {csv_file}")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='处理 .c 和 .i 文件并保存结果')
    parser.add_argument('directories', nargs='+', 
                        help='要处理的目录列表')
    parser.add_argument('--output', '-o', 
                        default='Results/default_results.csv', help='输出 CSV 文件路径')
    parser.add_argument('--command-group', '-cg', type=int, choices=[1, 2], default=1,
                        help='使用的命令组 (1 或 2)')
    args = parser.parse_args()
    if not args.output.endswith('.csv'):
        raise ValueError("Output file must have .csv extension")
    if os.path.exists(args.output):
        raise FileExistsError(f"CSV文件 {args.output} 已存在，请指定一个新的文件名以避免覆盖")
   
    main(args.directories, args.output, args.command_group)
