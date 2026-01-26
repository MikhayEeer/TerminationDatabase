import pandas as pd
import numpy as np

file_path = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known\tpdb429term-ET+Bench_summary.csv'
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()

# Target value
def is_term(val):
    if pd.isna(val): return False
    return str(val).strip().lower() == 'terminate'

# Create boolean cols
tools = ['SVMRresult', 'cpalasso25_result', 'result_2ls', 'Ultimate260122_result', 'AProVEonline25', 'MuVal-online', 'irank_result']
tool_names = ['SVMR', 'CPA', '2LS', 'Ultimate', 'AProVE', 'MuVal', 'iRank']

for col, name in zip(tools, tool_names):
    if col in df.columns:
        df[f'{name}_is_term'] = df[col].apply(is_term)

df['SVMR_CPA_Combined'] = df['SVMR_is_term'] | df['CPA_is_term']

# --- Deep Dive ---
print("=== Deep Dive Analysis ===")

svmr_wins = df[df['SVMR_is_term']]
print(f"Total SVMR Wins: {len(svmr_wins)}")

# Check overlap
print("\nOverlap with AProVE in SVMR Wins:")
overlap = svmr_wins['AProVE_is_term'].sum()
print(f"AProVE also terminates: {overlap}/{len(svmr_wins)}")

print("\nOverlap with Ultimate in SVMR Wins:")
overlap_ult = svmr_wins['Ultimate_is_term'].sum()
print(f"Ultimate also terminates: {overlap_ult}/{len(svmr_wins)}")

# Find distinct features of SVMR wins
# Loop Type
if 'loop_type' in df.columns:
    print("\nSVMR Success Rate by Loop Type:")
    print(df.groupby('loop_type')['SVMR_is_term'].agg(['mean', 'count']))

# Loop Count
print("\nSVMR Success Rate by Loop Count:")
print(df.groupby('loops_count')['SVMR_is_term'].agg(['mean', 'count']))

# Language or other meta
print("\nSVMR Success Rate by Program Type:")
print(df.groupby('program_type')['SVMR_is_term'].agg(['mean', 'count']))


# Try to identify a subset where SVMR is distinct
# Strategy: Find a cluster of files (maybe by name pattern or specific property) where SVMR is strong.
# Look at 'lines' count - maybe short programs?
df['lines_bin'] = pd.cut(df['lines'], bins=[0, 20, 50, 100, 1000])
print("\nSVMR by Lines:")
print(df.groupby('lines_bin', observed=True)['SVMR_is_term'].agg(['mean', 'count']))


# Requirement 3 Search: "Approximating" the Golden Subset
# Since we might not find a pure >95% subset where others are weak,
# let's look for a subset where SVMR is at least respectable (>80%?) or where it complements.

# Let's try combining conditions
# Condition idea: Linear loops, single loop, no arrays.
subset1 = df[
    (df['loop_type'] == 'Linear') & 
    (df['loops_count'] == 1) & 
    (df['array_operator'].astype(str) == 'False')
]
print(f"\nSubset: Linear, Single Loop, No Arrays (Size: {len(subset1)})")
print(f"SVMR: {subset1['SVMR_is_term'].mean():.2%}")
print(f"AProVE: {subset1['AProVE_is_term'].mean():.2%}")

# Let's try to reverse engineer: What characteristic covers the 67 wins?
# Filter to only the wins
wins = df[df['SVMR_is_term']]
# print(wins.head(10))

# Result 4: SVMR+CPA
# Where does the combo allow us to reach high numbers?
# Especially if CPA adds to SVMR.
cpa_adds = df[df['CPA_is_term'] & ~df['SVMR_is_term']]
print(f"\nCPA adds {len(cpa_adds)} cases to SVMR.")

# --- Analysis by File Name / Benchmark Source ---
df['file_prefix'] = df['file'].apply(lambda x: str(x).split('_')[0] if pd.notna(x) else 'Unknown')
# Attempt to get a bit more granular if prefixes are generic
df['file_prefix_detailed'] = df['file'].apply(lambda x: str(x).split('-')[0] if pd.notna(x) else 'Unknown')

print("\n--- Success by File Prefix (Top 5 for SVMR) ---")
stats_prefix = df.groupby('file_prefix')['SVMR_is_term'].agg(['mean', 'count'])
print(stats_prefix.sort_values('mean', ascending=False).head(10))

print("\n--- Success by File Prefix (Top 5 for SVMR+CPA) ---")
df['Combined_is_term'] = df['SVMR_CPA_Combined']
stats_combo = df.groupby('file_prefix')['Combined_is_term'].agg(['mean', 'count'])
print(stats_combo.sort_values('mean', ascending=False).head(10))

# Check specifically for "svcomp" or similar buckets
print("\n--- Checking Specific Families ---")
prefixes = stats_prefix.index.tolist()
for p in prefixes:
    if stats_prefix.loc[p, 'count'] < 5: continue
    
    subset = df[df['file_prefix'] == p]
    svmr_rate = subset['SVMR_is_term'].mean()
    combo_rate = subset['Combined_is_term'].mean()
    
    others_max = 0
    for t in ['Ultimate', 'AProVE']:
        others_max = max(others_max, subset[f'{t}_is_term'].mean())
        
    if svmr_rate > 0.8 or combo_rate > 0.8: # Lower threshold to just find candidates
        print(f"Prefix: {p} (Count: {len(subset)})")
        print(f"  SVMR: {svmr_rate:.2%}")
        print(f"  Combo: {combo_rate:.2%}")
        print(f"  Best Other: {others_max:.2%}")
