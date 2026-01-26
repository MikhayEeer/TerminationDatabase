import pandas as pd

file_path = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known\tpdb429term-ET+Bench_summary.csv'
df = pd.read_csv(file_path)
df.columns = df.columns.str.strip()

def is_term(val): return str(val).strip().lower() == 'terminate'

# Define Success
df['SVMR_ok'] = df['SVMRresult'].apply(is_term)
cpa = df[['cpalasso25_result', 'cpageneral25_result']].apply(lambda x: is_term(x[0]) or is_term(x[1]), axis=1)
df['Combo_ok'] = df['SVMR_ok'] | cpa

# Competitors
others = ['AProVEonline25', 'Ultimate260122_result', 'result_2ls', 'MuVal-online', 'irank_result']
for o in others:
    df[o] = df[o].apply(is_term)

# Req 3 Analysis: Subset = SVMR Wins
subset_svmr = df[df['SVMR_ok']]
print(f"Subset: SVMR Solvable (n={len(subset_svmr)})")
print(f"SVMR: 100%")
for o in others:
    print(f"{o}: {subset_svmr[o].mean():.2%}")

# Req 4 Analysis: Subset = Combo Wins
subset_combo = df[df['Combo_ok']]
print(f"\nSubset: SVMR+CPA Solvable (n={len(subset_combo)})")
print(f"Combo: 100%")
for o in others:
    print(f"{o}: {subset_combo[o].mean():.2%}")
