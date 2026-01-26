import pandas as pd
import itertools

file_path = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known\tpdb429term-ET+Bench_summary.csv'
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()

# Clean up
def to_bool(val): return str(val).lower() == 'true'
def is_term(val): return str(val).strip().lower() == 'terminate'

df['array_operator'] = df['array_operator'].apply(to_bool)
df['pointer_operator'] = df['pointer_operator'].apply(to_bool)
df['has_break'] = df['has_break'].apply(to_bool)

df['SVMR_is_term'] = df['SVMRresult'].apply(is_term)
cpa_cols = ['cpalasso25_result', 'cpageneral25_result']
df['CPA_is_term'] = df[cpa_cols].apply(lambda x: is_term(x[0]) or is_term(x[1]), axis=1)
df['Combo_is_term'] = df['SVMR_is_term'] | df['CPA_is_term']

others = ['AProVEonline25', 'Ultimate260122_result', 'result_2ls', 'MuVal-online', 'irank_result']
for o in others:
    df[f'{o}_term'] = df[o].apply(is_term)

# Define filters
filters = {
    'Type: Loop': df['program_type'] == 'loop',
    'Type: Recur': df['program_type'] == 'recur',
    'Loop: Linear': df['loop_type'] == 'Linear',
    'Loop: Nested': df['loop_type'] == 'Nested',
    'Loop: Multiple': df['loop_type'] == 'Multiple',
    'Count: 1': df['loops_count'] == 1,
    'Depth: 1': df['loops_depth'] == 1,
    'No Arrays': ~df['array_operator'],
    'Has Arrays': df['array_operator'],
    'No Pointers': ~df['pointer_operator'],
    'No Break': ~df['has_break'],
}

# Generate combinations of 2 filters
filter_names = list(filters.keys())
combinations = list(itertools.combinations(filter_names, 2))

print("Searching for high SVMR or Combo performance...")

results = []

for name1, name2 in combinations:
    mask = filters[name1] & filters[name2]
    subset = df[mask]
    
    if len(subset) < 20: continue # Ignore small subsets
    
    svmr_rate = subset['SVMR_is_term'].mean()
    combo_rate = subset['Combo_is_term'].mean()
    
    # Calculate best other
    best_other = 0
    for o in others:
        best_other = max(best_other, subset[f'{o}_term'].mean())
        
    results.append({
        'Subset': f"{name1} + {name2}",
        'Size': len(subset),
        'SVMR': svmr_rate,
        'Combo': combo_rate,
        'BestOther': best_other
    })

# Add single filters too
for name in filter_names:
    subset = df[filters[name]]
    if len(subset) < 20: continue
    
    svmr_rate = subset['SVMR_is_term'].mean()
    combo_rate = subset['Combo_is_term'].mean()
    best_other = 0
    for o in others:
        best_other = max(best_other, subset[f'{o}_term'].mean())
        
    results.append({
        'Subset': name,
        'Size': len(subset),
        'SVMR': svmr_rate,
        'Combo': combo_rate,
        'BestOther': best_other
    })

# Sort and print Top SVMR
print("\n--- Top SVMR Subsets ---")
results.sort(key=lambda x: x['SVMR'], reverse=True)
for r in results[:10]:
    print(f"{r['Subset']} (n={r['Size']}): SVMR={r['SVMR']:.1%}, Other={r['BestOther']:.1%}")

# Sort and print Top Combo
print("\n--- Top Combo Subsets ---")
results.sort(key=lambda x: x['Combo'], reverse=True)
for r in results[:10]:
    print(f"{r['Subset']} (n={r['Size']}): Combo={r['Combo']:.1%}, Other={r['BestOther']:.1%}")
