import pandas as pd
import numpy as np
from collections import Counter

def analyze_csv():
    # 读取CSV文件
    df = pd.read_csv('TPDB_NO/TPDB_Nonterm_categorization.csv')
    
    # 过滤掉category为FunctionCall和Memory的行
    # filtered_df = df[~df['category'].isin(['FunctionCall', 'Memory'])]
    filtered_df = df[df['category'].isin(['RECUR', 'GEOMETRIC', 'Divergent'])]
    filtered_df = filtered_df[~filtered_df['is_recursion'].isin(['Recursion'])]
    print(f"总行数: {len(df)}")
    print(f"过滤后行数: {len(filtered_df)}")
    print(f"过滤掉的行数: {len(df) - len(filtered_df)}")
    print("\n" + "="*50 + "\n")
    # 定义三个大模型的列名
    models = {
        'claude3.7': {
            'type_col': 'claude3.7_nonterm_type',
            'time_col': 'claude3.7_avg_time'
        },
        'gpt-4o': {
            'type_col': 'gpt-4o_nonterm_type', 
            'time_col': 'gpt-4o_avg_time'
        },
        'gpt-o4-mini': {
            'type_col': 'gpt-o4-mini_nonterm_type',
            'time_col': 'gpt-o4-mini_avg_time'
        }
    }
    
    # 统计结果
    results = {}
    
    for model_name, cols in models.items():
        type_col = cols['type_col']
        time_col = cols['time_col']
        consistent = model_name + '_consistent'
        
        # 统计各类别数量
        temp_filtered_df = filtered_df[~filtered_df[type_col].isin(['OTHER'])]
        #print(temp_filtered_df[consistent].unique())
        temp_filtered_df = temp_filtered_df[temp_filtered_df[consistent].isin([True])]
        type_counts = Counter(temp_filtered_df[type_col])
        #print(temp_filtered_df[consistent].unique())
        #input("Press Enter to continue...")
        # 计算平均时间，仅关注recur、divergent、geometric三类
        valid_times = [float(row[time_col]) for _, row in temp_filtered_df.iterrows() if row[type_col] in ['RECUR', 'DIVERGENT', 'GEOMETRIC']]
        avg_time = sum(valid_times) / len(valid_times) if valid_times else 0
        
        # 统计总数
        total = len(temp_filtered_df)
        
        results[model_name] = {
            'DIVERGENT': type_counts.get('DIVERGENT', 0),
            'RECUR': type_counts.get('RECUR', 0),
            'GEOMETRIC': type_counts.get('GEOMETRIC', 0),
            'OTHER': type_counts.get('OTHER', 0),
            'total': total,
            'avg_time': round(avg_time, 2)
        }
    
    # 统计原始category分布
    category_counts = Counter(filtered_df['category'])
    
    # 打印结果表格
    print("LLM处理结果统计表:")
    print("|LLM|DIVERGENT|RECUR|GEOMETRIC|OTHER|total|avg_time|")
    print("|---|---------|-----|---------|-----|-----|--------|")
    
    for model_name, stats in results.items():
        print(f"|{model_name}|{stats['DIVERGENT']}|{stats['RECUR']}|{stats['GEOMETRIC']}|{stats['OTHER']}|{stats['total']}|{stats['avg_time']}|")
    
    print("\n" + "="*50 + "\n")
    
    # 打印原始category分布
    print("原始Category分布:")
    print("|Category|Count|")
    print("|--------|-----|")
    for category, count in sorted(category_counts.items()):
        print(f"|{category}|{count}|")
    
    print("\n" + "="*50 + "\n")
    
    # 详细分析每个模型的处理情况
    print("详细分析:")
    for model_name, cols in models.items():
        type_col = cols['type_col']
        time_col = cols['time_col']
        
        print(f"\n{model_name}:")
        print(f"  类别分布: {dict(Counter(filtered_df[type_col]))}")
        print(f"  平均处理时间: {filtered_df[time_col].mean():.2f}秒")
        print(f"  时间范围: {filtered_df[time_col].min():.2f} - {filtered_df[time_col].max():.2f}秒")
    
    # 按原始category分组统计每个模型的表现
    print("\n" + "="*50 + "\n")
    print("按原始Category分组的模型表现:")
    
    for category in sorted(filtered_df['category'].unique()):
        category_data = filtered_df[filtered_df['category'] == category]
        print(f"\n{category} (共{len(category_data)}个样本):")
        
        for model_name, cols in models.items():
            type_col = cols['type_col']
            time_col = cols['time_col']
            
            model_types = Counter(category_data[type_col])
            model_avg_time = category_data[time_col].mean()
            
            print(f"  {model_name}: {dict(model_types)}, 平均时间: {model_avg_time:.2f}秒")

if __name__ == "__main__":
    analyze_csv()
