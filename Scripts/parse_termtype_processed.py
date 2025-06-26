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
    for _, row in df.iterrows():
        if row['has_match'] != 'Y':
            continue
        try:
            tuples = ast.literal_eval(row['list_column'])
        except Exception:
            tuples = []

        e = n = c = 0
        phase = int(row['phase_count']) if row['phase_count'].isdigit() else 1
        k = row['kind']

        for status, kind in tuples:
            s = status.upper()
            if s == 'NONTERM':
                e += 1
                continue
            if s == 'TERM' and kind == 'Other':
                n += 1
                continue
            label = (s, kind)
            if k == 'Nested':
                if phase == 1:
                    if label in [('TERM', 'Single'), ('TERM', 'Nested')]:
                        c += 1
                    else:
                        e += 1
                else:
                    if label == ('TERM', 'Nested'):
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

        rows.append((row['filename'], e, n, c, float(row['time'])))
    return rows


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
        summary_rows = process_file(csv_path)

        # 写_summary.csv
        base, _ = os.path.splitext(fname)
        out_name = f"{base}_summary.csv"
        out_path = os.path.join(args.output_folder, out_name)
        with open(out_path, 'w', encoding='utf-8') as f:
            for filename, e, n, c, t in summary_rows:
                f.write(f"{filename},{e},{n},{c},{t}\n")

        # 统计本文件
        total_e = sum(r[1] for r in summary_rows)
        total_n = sum(r[2] for r in summary_rows)
        total_c = sum(r[3] for r in summary_rows)
        avg_t = sum(r[4] for r in summary_rows) / len(summary_rows) if summary_rows else 0.0
        # 打印本文件统计
        print(f"文件: {out_name}")
        print(f"  总错误数: {total_e}")
        print(f"  总不错数: {total_n}")
        print(f"  总正确数: {total_c}")
        print(f"  平均时间: {avg_t:.2f}\n")

if __name__ == '__main__':
    main()
