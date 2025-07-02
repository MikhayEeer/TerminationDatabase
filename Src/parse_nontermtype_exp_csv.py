import pandas as pd
import sys

def evaluate_models(csv_path):
    df = pd.read_csv(csv_path)
    # 打印df的基本信息
    print("DataFrame基本信息:")
    print(df.info())
    df = df[df['is_recursion'].isin(['Loop'])]
    print("DataFrame基本信息2:")
    print(df.info())
    input("debug...")
    models = {
        'claude3.7':  ('claude3.7_nonterm_type',   'claude3.7_avg_time'),
        'gpt-4o':     ('gpt-4o_nonterm_type',       'gpt-4o_avg_time'),
        'gpt-o4-mini':('gpt-o4-mini_nonterm_type',  'gpt-o4-mini_avg_time'),
    }

    rows = []
    for model_name, (pred_col, time_col) in models.items():
        df[time_col] = pd.to_numeric(df[time_col], errors='coerce')
        for category, grp in df.groupby('category', sort=True):
            total = len(grp)
            def is_correct(pred, cat=category):
                return (pred == 'RECUR') if cat == 'FunctionCall' else (pred == cat)
            correct = grp[pred_col].apply(is_correct).sum()
            incorrect = total - correct
            avg_time = grp[time_col].mean()
            rows.append({
                'model':      model_name,
                'category':   category,
                'total':      total,
                'correct':    int(correct),
                'incorrect':  int(incorrect),
                'avg_time':   round(float(avg_time), 2),
            })

    return pd.DataFrame(rows)

def main():
    if len(sys.argv) != 2:
        print("用法: python evaluate_nonterm.py <path_to_csv>")
        sys.exit(1)

    csv_path = sys.argv[1]
    summary_df = evaluate_models(csv_path)

    # 按模型分组，格式化输出
    for model, group in summary_df.groupby('model'):
        print(f"\n模型: {model}")
        for _, row in group.iterrows():
            print(f"  类别: {row['category']}")
            print(f"    样本总数:   {row['total']}")
            print(f"    正确数:     {row['correct']}")
            print(f"    错误数:     {row['incorrect']}")
            print(f"    平均耗时:   {row['avg_time']}s")
        print("-" * 40)

if __name__ == '__main__':
    main()
