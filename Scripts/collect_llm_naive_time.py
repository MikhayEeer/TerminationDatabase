import pandas as pd
import argparse
import os


def compute_avg_time(csv_path):
    # 读取 CSV，确保有 processing_time 列
    df = pd.read_csv(csv_path)
    # 计算每行 time/2，然后取平均
    avg_time = (df['processing_time'].astype(float) / 2.0).mean()
    return avg_time


def main():
    parser = argparse.ArgumentParser(
        description="统计每个 llm_results_Certain_LLMName.csv 文件的平均运行时间"
    )
    parser.add_argument('input_folder', help='包含实验数据 CSV 的文件夹路径')
    args = parser.parse_args()

    # 遍历符合命名模式的文件
    for fname in sorted(os.listdir(args.input_folder)):
        if not fname.startswith('llm_results_Certain_') or not fname.endswith('.csv'):
            continue
        csv_path = os.path.join(args.input_folder, fname)
        try:
            avg_time = compute_avg_time(csv_path)
        except Exception as e:
            print(f"处理文件 {fname} 时发生错误: {e}")
            continue

        # 从文件名提取 LLMName
        # 格式: llm_results_Certain_LLMName.csv
        llm_name = fname[len('llm_results_Certain_'):-len('.csv')]
        print(f"{llm_name}: 平均运行时间 = {avg_time:.4f}")

if __name__ == '__main__':
    main()