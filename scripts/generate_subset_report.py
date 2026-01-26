import pandas as pd
import numpy as np
import os
import glob

# Configuration
input_dir = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known_subset'
report_path = os.path.join(input_dir, 'analysis_report.md')

def is_terminate(val):
    if pd.isna(val): return False
    return str(val).strip().lower() == 'terminate'

def to_bool(val):
    return str(val).lower() == 'true'

def analyze_file(file_path):
    filename = os.path.basename(file_path)
    df = pd.read_csv(file_path)
    # Clean columns
    df.columns = df.columns.str.strip()
    
    # --- Tool Analysis ---
    tool_map = {
        'SVMR': 'SVMRresult',
        'CPA-Lasso': 'cpalasso25_result',
        'CPA-General': 'cpageneral25_result',
        'Ultimate': 'Ultimate260122_result',
        'AProVE': 'AProVEonline25',
        '2LS': 'result_2ls',
        'MuVal': 'MuVal-online',
        'iRank': 'irank_result'
    }
    
    # Calculate CPA Combined and SVMR+CPA
    if 'cpalasso25_result' in df.columns and 'cpageneral25_result' in df.columns:
        df['CPA_Combined_ok'] = df['cpalasso25_result'].apply(is_terminate) | df['cpageneral25_result'].apply(is_terminate)
    elif 'cpalasso25_result' in df.columns:
        df['CPA_Combined_ok'] = df['cpalasso25_result'].apply(is_terminate)
    else:
        df['CPA_Combined_ok'] = False
        
    if 'SVMRresult' in df.columns:
        df['SVMR_is_term'] = df['SVMRresult'].apply(is_terminate)
        df['SVMR_CPA_Combo_ok'] = df['SVMR_is_term'] | df['CPA_Combined_ok']
    
    tool_stats = []
    
    # Add Combo manually
    if 'SVMR_CPA_Combo_ok' in df.columns:
        c = df['SVMR_CPA_Combo_ok'].sum()
        tool_stats.append({
            'Tool': 'SVMR+CPA Combo',
            'Solved': c,
            'Rate': c / len(df)
        })
        
    for name, col in tool_map.items():
        if col in df.columns:
            count = df[col].apply(is_terminate).sum()
            tool_stats.append({
                'Tool': name,
                'Solved': count,
                'Rate': count / len(df)
            })
            
    tool_df = pd.DataFrame(tool_stats).sort_values('Rate', ascending=False)
    
    # --- Code Characteristics ---
    
    # Numeric cols
    numeric_cols = {
        'Lines': 'lines',
        'Loop Count': 'loops_count',
        'Loop Depth': 'loops_depth',
        'Vars in Condition': 'loop_condition_variables_count'
    }
    
    num_stats = {}
    for label, col in numeric_cols.items():
        if col in df.columns:
            ser = pd.to_numeric(df[col], errors='coerce')
            desc = ser.describe()
            num_stats[label] = {
                'Mean': desc['mean'],
                'Max': desc['max'],
                'Min': desc['min'],
                'Median': desc['50%']
            }
            
    # Categorical/Boolean
    # Program Type
    prog_type_counts = df['program_type'].value_counts().to_dict() if 'program_type' in df.columns else {}
    
    # Features
    feature_cols = {
        'Has Break': 'has_break',
        'Has Arrays': 'array_operator',
        'Has Pointers': 'pointer_operator'
    }
    feature_counts = {}
    for label, col in feature_cols.items():
        if col in df.columns:
            # Handle string 'True'/'False' or booleans
            count = df[col].astype(str).str.lower().eq('true').sum()
            feature_counts[label] = count

    return {
        'filename': filename,
        'count': len(df),
        'tool_df': tool_df,
        'num_stats': num_stats,
        'prog_type_counts': prog_type_counts,
        'feature_counts': feature_counts
    }

def generate_report(results):
    lines = []
    lines.append("# TPDB Known Subset 深度分析报告")
    lines.append(f"报告生成日期: {pd.Timestamp.now().strftime('%Y-%m-%d')}\n")
    
    for res in results:
        lines.append(f"## 数据集: {res['filename']}")
        lines.append(f"**总样本数 (Total Samples): {res['count']}**\n")
        
        lines.append("### 1. 工具解决能力分析 (Solvability Analysis)")
        lines.append("| 工具 (Tool) | 解决数量 (Solved) | 解决率 (Rate) |")
        lines.append("|---|---|---|")
        for _, row in res['tool_df'].iterrows():
            lines.append(f"| {row['Tool']} | {row['Solved']} | {row['Rate']:.2%} |")
        lines.append("\n")
        
        lines.append("### 2. 代码复杂度与特征 (Code Complexity & Features)")
        
        lines.append("#### a. 规模统计 (Scale Statistics)")
        lines.append("| 指标 (Metric) | 平均值 (Mean) | 中位数 (Median) | 最大值 (Max) | 最小值 (Min) |")
        lines.append("|---|---|---|---|---|")
        for label, stat in res['num_stats'].items():
            lines.append(f"| {label} | {stat['Mean']:.2f} | {stat['Median']:.1f} | {stat['Max']:.1f} | {stat['Min']:.1f} |")
        lines.append("\n")
        
        lines.append("#### b. 程序类型分布 (Program Types)")
        for ptype, count in res['prog_type_counts'].items():
            lines.append(f"- **{ptype}**: {count} ({count/res['count']:.2%})")
        lines.append("\n")
        
        lines.append("#### c. 关键语法特征 (Syntactic Features)")
        for feat, count in res['feature_counts'].items():
            lines.append(f"- **{feat}**: {count} ({count/res['count']:.2%})")
        lines.append("\n")
        
        lines.append("---\n")
        
    return "\n".join(lines)

# Main execution
files = glob.glob(os.path.join(input_dir, "*.csv"))
results = []
for f in files:
    results.append(analyze_file(f))

report_content = generate_report(results)

with open(report_path, 'w', encoding='utf-8') as f:
    f.write(report_content)

print(report_content)
