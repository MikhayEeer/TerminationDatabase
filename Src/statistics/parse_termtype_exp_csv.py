import pandas as pd
import argparse

def main():
    parser = argparse.ArgumentParser(
        description="只合并 kind 为 Nested/Multi 的行: filename,has_match,kind,phase_count,list_column,time"
    )
    parser.add_argument("file1", help="第一个 CSV 路径 (格式: filename, _, kind, phase_count)")
    parser.add_argument("file2", help="第二个 CSV 路径 (至少要有 prefixed_filename, time, list_column)")
    parser.add_argument("output", help="合并后输出的 CSV 路径")
    args = parser.parse_args()

    # 1) 读第一个表：拿 filename, kind, phase_count，并且 **只保留 Nested/Multi**
    df1 = pd.read_csv(
        args.file1,
        header=None,
        names=['filename', '_unused', 'kind', 'phase_count'],
        dtype=str
    )
    df1 = df1[df1['kind'].isin(['Nested', 'Multi'])]

    # 2) 只读第二个表的第0、5、7列
    df2 = pd.read_csv(
        args.file2,
        header=None,
        usecols=[0, 5, 7],
        names=['prefixed_filename', 'time', 'list_column'],
        dtype=str,
        quotechar='"',
        engine='python'
    )

    # 3) 提取基名："k_144.bpl" -> "144.bpl"
    df2['filename'] = df2['prefixed_filename'].str.split('_', n=1).str[1]

    # 4) 合并：只对已过滤的 df1 做左联
    merged = pd.merge(
        df1[['filename', 'kind', 'phase_count']],
        df2[['filename', 'list_column', 'time']],
        on='filename',
        how='left',
        indicator='matched'
    )

    # 5) 构造 has_match：因为这里只剩 Nested/Multi，所以无论是否在 df2 匹配都可以打 Y
    merged['has_match'] = 'Y'

    # 6) 选列并输出
    result = merged[
        ['filename', 'has_match', 'kind', 'phase_count', 'list_column', 'time']
    ]
    result.to_csv(args.output, index=False, header=False, encoding='utf-8')
    print(f"已生成：{args.output}")

if __name__ == "__main__":
    main()
