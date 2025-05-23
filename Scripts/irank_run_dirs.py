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
import signal
from pathlib import Path
from typing import List, Dict, Tuple, Any, Optional
from tqdm import tqdm

COMMAND = '../irankfinder-exe/irankfinder'
TIMEOUT = 120

# 命令组1: 简单分析配置 (分析线性循环)
CMD_GROUP_1 = [
    '-sccd', '2',
    '-dt', 'iffail',
    '-rniv',
    '-d', 'Z',
    '-v', '0',
    '-cfr-st-scc',
    '-cfr-it', '0',
    '--invariants', 'polyhedra',
    '--termination', 'lrf_pr'
]

# 命令组2: 更全面的分析配置
CMD_GROUP_2 = [
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
    '-sample-nd-vars'
]

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
    print(f"[INFO] Found {len(files_info)} .c files.")
    return files_info

def cleanup_irankfinder():
    """清理所有irankfinder进程"""
    try:
        subprocess.call(['pkill', '-9', '-f', 'irankfinder'],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    except Exception as e:
        print(f"[WARNING] 清理进程失败: {e}")

def solve(file_path: str, command_group: int = 1) -> Dict[str, Any]:
    """处理给定的文件"""
    # 根据命令组选择相应的命令参数
    if command_group == 1:
        cmd_params = CMD_GROUP_1.copy()
    elif command_group == 2:
        cmd_params = CMD_GROUP_2.copy()
    else:
        return {
            'result': 'ERROR: Invalid command group',
            'error': f'Command group {command_group} is not supported',
            'file_type': '.i' if file_path.endswith('.i') else '.c'
        }
    
    # 构建完整命令
    cmd = [COMMAND] + cmd_params + ['--file', file_path]
    
    try:
        # 确保启动前没有残留进程
        cleanup_irankfinder()
        
        start_time = time.time()
        process = subprocess.Popen(cmd, 
                                  stdout=subprocess.PIPE, 
                                  stderr=subprocess.PIPE, 
                                  text=True,
                                  preexec_fn=os.setsid)  # 创建新进程组
        
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
            
        # 确保进程及其子进程都被终止
        try:
            os.killpg(os.getpgid(process.pid), signal.SIGKILL)
        except:
            process.kill()
            
        return {
            'result': result,
            'error': error,
            'file_type': '.i' if file_path.endswith('.i') else '.c',
            'execution_time': execution_time
        }
    except subprocess.TimeoutExpired:
        # 超时处理 - 彻底终止进程组
        try:
            os.killpg(os.getpgid(process.pid), signal.SIGKILL)
        except:
            process.kill()
            
        # 确保没有残留进程
        cleanup_irankfinder()
            
        return {
            'result': 'ERROR',
            'error': 'Execution timed out',
            'file_type': '.i' if file_path.endswith('.i') else '.c',
            'execution_time': TIMEOUT
        }
    except Exception as e:
        # 其他异常处理
        cleanup_irankfinder()  # 确保清理
        return {
            'result': 'ERROR',
            'error': str(e),
            'file_type': '.i' if file_path.endswith('.i') else '.c',
            'execution_time': 0
        }

def write_result_to_csv(result: Dict[str, Any], csv_file: str, is_first: bool = False) -> None:
    """
    将单个结果写入CSV文件
    
    Args:
        result: 处理结果
        csv_file: CSV文件路径
        is_first: 是否是第一条记录(需要写入表头)
    """
    fieldnames = ['c_path', 'result', 'error', 'status', 'execution_time']
    
    # 转换为CSV行
    row = {
        'c_path': result['c_path'],
        'result': result['result'],
        'error': result['error'],
        'status': 'success' if result['error'] is None else 'failed',
        'execution_time': result.get('execution_time', 0)
    }
    
    # 写入模式：第一次为'w'创建文件，之后为'a'追加
    mode = 'w' if is_first else 'a'
    
    with open(csv_file, mode, newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        if is_first:
            writer.writeheader()
        writer.writerow(row)

def process_files(files_info: List[Dict[str, Any]], csv_file: str, command_group: int = 1) -> None:
    """
    处理文件并实时写入结果到CSV
    
    Args:
        files_info: 包含文件信息的字典列表
        csv_file: 输出CSV文件路径
        command_group: 使用的命令组
    """
    processed_count = 0
    
    for idx, file_info in enumerate(tqdm(files_info, desc="[Processing]", unit="file")):
        # 处理当前文件
        c_result = solve(file_info['c_path'], command_group)
        
        # 准备结果
        result = {
            'c_path': file_info['c_path'],
            'has_i': file_info['has_i'],
            'processed_file': file_info['c_path'],
            'result': c_result['result'],
            'error': c_result['error'],
            'file_type': c_result['file_type'],
            'execution_time': c_result['execution_time']
        }
        
        # 立即写入CSV (第一个文件需要写入表头)
        write_result_to_csv(result, csv_file, is_first=(idx==0))
        
        processed_count += 1
        
        # 确保在处理下一个文件前没有残留进程
        cleanup_irankfinder()
    
    print(f"[INFO] Processed {processed_count} files, results saved into {csv_file}")

def main(directories: List[str], csv_file: str, command_group: int = 1) -> None:
    """主函数：查找文件、处理文件并保存结果"""
    # 初始清理
    cleanup_irankfinder()
    
    # 查找所有.c文件
    files_info = find_c_files(directories)
    
    # 处理文件并实时写入CSV
    process_files(files_info, csv_file, command_group)

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
