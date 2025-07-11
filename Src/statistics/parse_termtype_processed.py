import pandas as pd
import argparse
import os
import ast


def process_file(csv_path):
    # 读取 CSV，假设无表头，字段顺序：filename,has_match,kind,phase_count,list_column,time
    df = pd.read_csv(
        csv_path,
        header=None,
        names=['filename', 'has_match', 'kind', 'phase_count', 'list_column', 'time'],
        dtype=str
    )

    rows = []
    full_correct = 0        # 行中所有预测都正确的行数 (c == total)
    full_no_error = 0       # 行中无任何错误的行数 (e == 0)
    error_any = 0           # 行中至少有一次错误的行数 (e > 0)

    for _, row in df.iterrows():
        if row['has_match'] != 'Y':
            continue
        try:
            tuples = ast.literal_eval(row['list_column'])
        except Exception:
            tuples = []

        e = c = 0
        total = len(tuples)
        phase = int(row['phase_count']) if row['phase_count'].isdigit() else 1
        k = row['kind']

        for status, kind_pred in tuples:
            s = status.upper()
            if s == 'NONTERM':
                e += 1
            elif s == 'TERM' and kind_pred == 'Other':
                c += 1
            else:
                label = (s, kind_pred)
                if k == 'Nested':
                    if phase == 1:
                        if label in [('TERM', 'Single'), ('TERM', 'Nested'), ('TERM', 'Multi')]:
                            c += 1
                        else:
                            e += 1
                    else:
                        if label in [('TERM', 'Nested'), ('TERM', 'Multi')]:
                            c += 1
                        else:
                            e += 1
                elif k == 'Multi':
                    if phase == 1:
                        if label in [('TERM', 'Single'), ('TERM', 'Multi')]:
                            c += 1
                        else:
                            e += 1
                    else:
                        if label == ('TERM', 'Multi'):
                            c += 1
                        else:
                            e += 1
                else:
                    e += 1

        # 行级统计
        if total > 0:
            if c == total:
                full_correct += 1
            if e == 0:
                full_no_error += 1
            if e > 0:
                error_any += 1

        rows.append((row['filename'], e, c, float(row['time'])))

    return rows, full_correct, full_no_error, error_any


def main():
    parser = argparse.ArgumentParser(description="生成每个CSV的_summary.csv并输出各文件统计")
    parser.add_argument("input_folder", help="包含原始 CSV 的输入文件夹")
    parser.add_argument("output_folder", help="输出_summary.csv的文件夹")
    args = parser.parse_args()

    os.makedirs(args.output_folder, exist_ok=True)

    for fname in os.listdir(args.input_folder):
        if not fname.lower().endswith('.csv') or fname.lower().endswith('_summary.csv'):
            continue
        csv_path = os.path.join(args.input_folder, fname)
        summary_rows, full_correct, full_no_error, error_any = process_file(csv_path)

        # 写_summary.csv
        base, _ = os.path.splitext(fname)
        out_name = f"{base}_summary.csv"
        out_path = os.path.join(args.output_folder, out_name)
        with open(out_path, 'w', encoding='utf-8') as f:
            f.write("filename,error_count,correct_count,time\n")
            for filename, e, c, t in summary_rows:
                f.write(f"{filename},{e},{c},{t}\n")

        # 汇总统计
        total_errors = sum(r[1] for r in summary_rows)
        total_correct_preds = sum(r[2] for r in summary_rows)  # 总不错数: 所有正确预测
        total_preds = total_errors + total_correct_preds  # 总预测次数
        avg_time = sum(r[3] for r in summary_rows) / len(summary_rows) if summary_rows else 0.0

        # 打印统计结果
        print(f"文件: {out_name}")
        print(f"  总预测次数: {total_preds}")
        print(f"  总错误数: {total_errors}")
        print(f"  总正确数: {total_correct_preds}")
        print(f"  总不错数: {total_correct_preds}")  # 与总正确数相同
        print(f"  平均时间: {avg_time:.2f}")
        print(f"  完全正确行数 (行中全部预测正确): {full_correct}")
        print(f"  无任何错误行数 (行中无错误): {full_no_error}")
        print(f"  至少一次错误行数: {error_any}\n")

if __name__ == '__main__':
    main()
