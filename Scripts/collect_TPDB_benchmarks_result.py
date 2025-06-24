import pandas as pd
import argparse
import os

def summarize_tools(csv_path):
    df = pd.read_csv(csv_path)
    # 找到工具
    result_cols = [col for col in df.columns if col.endswith('_result') or col.startswith('result_')]
    summary = {}
    for res_col in result_cols:
        if res_col.startswith('result_'):
            tool = res_col[len('result_'):]
        else:
            tool = res_col[:-len('_result')]
        time_col = f"{tool}_time"
        # 初始化统计结构
        stats = {
            'overall': {'correct_yes': 0, 'correct_no': 0, 'incorrect': 0, 'failed': 0, 'timeout': 0, 'total_time': 0.0, 'count_time': 0},
            'YES':    {'correct_yes': 0, 'correct_no': 0, 'incorrect': 0},
            'NO':     {'correct_yes': 0, 'correct_no': 0, 'incorrect': 0}
        }
        for _, row in df.iterrows():
            ground = str(row['result']).upper()
            tool_r = str(row.get(res_col, '')).upper()
            # 时间统计
            if time_col in row and pd.notna(row[time_col]):
                try:
                    t = float(row[time_col])
                    stats['overall']['total_time'] += t
                    stats['overall']['count_time'] += 1
                except:
                    pass
            # 结果统计
            if tool_r == 'FAILED':
                stats['overall']['failed'] += 1
            elif tool_r == 'TIMEOUT':
                stats['overall']['timeout'] += 1
            else:
                # 跳过 ground 为 MAYBE 的 YES/NO 统计
                if ground in ('YES','NO'):
                    # 按 overall 统计
                    if ground == 'YES' and tool_r == 'YES':
                        stats['overall']['correct_yes'] += 1
                    elif ground == 'NO' and tool_r == 'NO':
                        stats['overall']['correct_no'] += 1
                    elif (ground == 'YES' and tool_r == 'NO') or (ground == 'NO' and tool_r == 'YES'):
                        stats['overall']['incorrect'] += 1
                    # 按单独的 YES/NO 组统计
                    if ground == 'YES':
                        if tool_r == 'YES': stats['YES']['correct_yes'] += 1
                        elif tool_r == 'NO': stats['YES']['incorrect'] += 1
                    elif ground == 'NO':
                        if tool_r == 'NO': stats['NO']['correct_no'] += 1
                        elif tool_r == 'YES': stats['NO']['incorrect'] += 1
                # ignore other cases
        # 计算平均时间
        ov = stats['overall']
        avg_time = ov['total_time'] / ov['count_time'] if ov['count_time'] else 0.0
        stats['overall']['avg_time'] = avg_time
        summary[tool] = stats
    return summary


def main():
    parser = argparse.ArgumentParser(description='统计各工具在实验数据上的表现')
    parser.add_argument('csv_file', help='待分析的 CSV 文件路径')
    args = parser.parse_args()

    summary = summarize_tools(args.csv_file)
    print("工具评估摘要：")
    for tool, stats in summary.items():
        ov = stats['overall']
        print(f"\n{tool} (Overall):\n"
              f"  正确(YES): {ov['correct_yes']}  正确(NO): {ov['correct_no']}  错误: {ov['incorrect']}\n"
              f"  FAILED: {ov['failed']}  TIMEOUT: {ov['timeout']}  平均时间: {ov['avg_time']:.4f}")
        yes = stats['YES']
        print(f"{tool} (Ground=YES): Correct YES: {yes['correct_yes']}  Incorrect: {yes['incorrect']}")
        no  = stats['NO']
        print(f"{tool} (Ground=NO): Correct NO: {no['correct_no']}  Incorrect: {no['incorrect']}")

if __name__ == '__main__':
    main()
