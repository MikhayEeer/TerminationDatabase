import pandas as pd
import numpy as np

# Load the dataset
file_path = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known\tpdb429term-ET+Bench_summary.csv'
df = pd.read_csv(file_path)

# Normalize column names for easier access if needed (stripping spaces)
df.columns = df.columns.str.strip()

# Define tools and their success criteria
# We are primarily interested in "Terminate" results as per the user's focus on "Termination Value"
target_value = 'Terminate'

# Columns mapping
tool_cols = {
    'SVMR': 'SVMRresult',
    'CPA-Lasso': 'cpalasso25_result',
    'CPA-General': 'cpageneral25_result',
    'Ultimate': 'Ultimate260122_result', 
    'AProVE': 'AProVEonline25',
    '2LS': 'result_2ls',
    'iRank': 'irank_result',
    'MuVal': 'MuVal-online'
}

# Helper to check if a result is 'Terminate' (case-insensitive usually good, but let's check values)
def is_terminate(val):
    if pd.isna(val): return False
    return str(val).strip().lower() == 'terminate'

# Create boolean columns for termination success
for name, col in tool_cols.items():
    if col in df.columns:
        df[f'{name}_is_term'] = df[col].apply(is_terminate)
    else:
        print(f"Warning: Column {col} not found")

# Create Combined SVMR+CPA metric
# We can define CPA as success if either Lasso or General succeeds
if 'cpalasso25_result' in df.columns and 'cpageneral25_result' in df.columns:
    df['CPA_Combined_is_term'] = df['CPA-Lasso_is_term'] | df['CPA-General_is_term']
else:
    df['CPA_Combined_is_term'] = df['CPA-Lasso_is_term'] # Fallback

df['SVMR_CPA_Combined_is_term'] = df['SVMR_is_term'] | df['CPA_Combined_is_term']

# --- Analysis Functions ---

def print_stats(subset_name, sub_df):
    if len(sub_df) == 0:
        return
    
    print(f"\n--- Analysis for: {subset_name} (Count: {len(sub_df)}) ---")
    
    # Calculate success rates
    stats = {}
    for name in tool_cols.keys():
        if f'{name}_is_term' in sub_df.columns:
            count = sub_df[f'{name}_is_term'].sum()
            rate = count / len(sub_df)
            stats[name] = rate
    
    # Add combined stats
    stats['SVMR+CPA'] = sub_df['SVMR_CPA_Combined_is_term'].sum() / len(sub_df)
    
    # Sort by success rate
    sorted_stats = sorted(stats.items(), key=lambda x: x[1], reverse=True)
    
    for tool, rate in sorted_stats:
        print(f"{tool}: {rate:.2%} ({int(rate*len(sub_df))}/{len(sub_df)})")
        
    return stats

# --- Requirement 1: Categorical Analysis ---

print("=== Requirement 1: Categorical Analysis ===")

# 1.1 Program Type: Loop vs Recur
print_stats("Type: Loop", df[df['program_type'] == 'loop'])
print_stats("Type: Recursion", df[df['program_type'] == 'recur'])

# 1.2 Loop Counts != 1 and Depth != 1
# Ensure columns are numeric
df['loops_count'] = pd.to_numeric(df['loops_count'], errors='coerce').fillna(0)
df['loops_depth'] = pd.to_numeric(df['loops_depth'], errors='coerce').fillna(0)

complex_loops = df[(df['loops_count'] != 1) | (df['loops_depth'] != 1)]
print_stats("Complex Loops (Count!=1 or Depth!=1)", complex_loops)

# 1.3 Array Operations
# Ensure boolean
df['array_operator'] = df['array_operator'].astype(str).str.lower() == 'true'
val_with_arrays = df[df['array_operator'] == True]
print_stats("With Array Operations", val_with_arrays)


# --- Requirement 2: SVMR Terminate Results ---
print("\n=== Requirement 2: SVMR General Stats ===")
svmr_term_df = df[df['SVMR_is_term']]
print(f"Total SVMR Terminate: {len(svmr_term_df)} out of {len(df)} ({len(svmr_term_df)/len(df):.2%})")


# --- Requirement 3 & 4: Search for "Golden Subsets" ---
print("\n=== Requirement 3 & 4: Finding Subsets where SVMR or SVMR+CPA Dominates ===")

# Possible slicing criteria
slices = {
    'All': df,
    'Loop Programs': df[df['program_type'] == 'loop'],
    'Recursive Programs': df[df['program_type'] == 'recur'],
    'With Arrays': df[df['array_operator'] == True],
    'No Arrays': df[df['array_operator'] == False],
    'Pointers': df[df['pointer_operator'].astype(str).str.lower() == 'true'],
    'No Pointers': df[df['pointer_operator'].astype(str).str.lower() == 'false'],
    'Complex Loops (Depth > 1)': df[df['loops_depth'] > 1],
    'Simple Loops (Depth == 1)': df[df['loops_depth'] == 1],
    'Multi-Loop (Count > 1)': df[df['loops_count'] > 1],
    'Single Loop (Count == 1)': df[df['loops_count'] == 1],
    'Has Break': df[df['has_break'].astype(str).str.lower() == 'true'],
}

# Search for SVMR dominance
print("\n--- Searching for SVMR > 95% Subsets ---")
found_svmr = False
for name, sub_df in slices.items():
    if len(sub_df) < 10: continue # Skip too small groups
    
    svmr_rate = sub_df['SVMR_is_term'].mean()
    
    # Check if SVMR is high
    if svmr_rate >= 0.95:
        # Check against others (find the max of others)
        other_max = 0
        best_other = ""
        for tool in tool_cols.keys():
            if tool == 'SVMR': continue
            rate = sub_df[f'{tool}_is_term'].mean()
            if rate > other_max:
                other_max = rate
                best_other = tool
        
        print(f"\n[FOUND] Subset: {name} (Size: {len(sub_df)})")
        print(f"SVMR Rate: {svmr_rate:.2%}")
        print(f"Next Best: {best_other} ({other_max:.2%})")
        print_stats(name, sub_df)
        found_svmr = True

if not found_svmr:
    print("No simple subset found with SVMR > 95%. listing top 3 SVMR performance subsets:")
    # List top 3 anyway
    results = []
    for name, sub_df in slices.items():
        if len(sub_df) < 10: continue
        results.append((name, sub_df['SVMR_is_term'].mean(), sub_df))
    
    sorted_res = sorted(results, key=lambda x: x[1], reverse=True)[:3]
    for name, rate, s_df in sorted_res:
         print(f"\nSubset: {name} (SVMR: {rate:.2%})")
         print_stats(name, s_df)


# Search for SVMR+CPA dominance
print("\n--- Searching for SVMR+CPA > 95% Subsets ---")
found_combo = False
for name, sub_df in slices.items():
    if len(sub_df) < 10: continue
    
    combo_rate = sub_df['SVMR_CPA_Combined_is_term'].mean()
    
    if combo_rate >= 0.95:
        other_max = 0
        best_other = ""
        # Compare against single tools (excluding component tools if desired, 
        # but technically user said "other tools", usually implies Ultimate/AProVE)
        # We should check if the Combo beats the best SINGLE tool (like Ultimate)
        
        competitors = ['Ultimate', 'AProVE', '2LS', 'iRank', 'MuVal']
        for tool in competitors:
            rate = sub_df[f'{tool}_is_term'].mean()
            if rate > other_max:
                other_max = rate
                best_other = tool
        
        print(f"\n[FOUND] Subset: {name} (Size: {len(sub_df)})")
        print(f"SVMR+CPA Rate: {combo_rate:.2%}")
        print(f"Best Competitor: {best_other} ({other_max:.2%})")
        print_stats(name, sub_df)
        found_combo = True

if not found_combo:
    print("No simple subset found with SVMR+CPA > 95%. Listing top 3:")
    results = []
    for name, sub_df in slices.items():
         if len(sub_df) < 10: continue
         results.append((name, sub_df['SVMR_CPA_Combined_is_term'].mean(), sub_df))
    
    sorted_res = sorted(results, key=lambda x: x[1], reverse=True)[:3]
    for name, rate, s_df in sorted_res:
         print(f"\nSubset: {name} (SVMR+CPA: {rate:.2%})")
         print_stats(name, s_df)
