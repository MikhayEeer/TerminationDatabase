import pandas as pd
import numpy as np
import os

# Setup paths
base_path = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known'
input_csv = os.path.join(base_path, 'tpdb429term-ET+Bench_summary.csv')
output_dir = r'd:\Workspace\repo\TerminationDatabase\agent_analysis_results\tpdb_known_subset'

df = pd.read_csv(input_csv)
df.columns = df.columns.str.strip()

# Helpers
def is_term(val): 
    return str(val).strip().lower() == 'terminate'

def to_bool(val):
    return str(val).lower() == 'true'

# Normalize columns
df['SVMR_is_term'] = df['SVMRresult'].apply(is_term)
cpa_cols = ['cpalasso25_result', 'cpageneral25_result']
df['CPA_is_term'] = df[cpa_cols].apply(lambda x: is_term(x[0]) or is_term(x[1]), axis=1)
df['Combo_is_term'] = df['SVMR_is_term'] | df['CPA_is_term']

df['array_operator'] = df['array_operator'].apply(to_bool)
df['program_type'] = df['program_type'].fillna('unknown')
if 'loops_count' in df.columns:
    df['loops_count'] = pd.to_numeric(df['loops_count'], errors='coerce').fillna(0)

# === 1. subset_combo (Target ~97% success rate) ===
# Base: SVMR or CPA is Terminate
subset_combo_base = df[df['Combo_is_term']].copy()
n_solvable = len(subset_combo_base)

# Target: 0.97 = n_solvable / (n_solvable + n_noise)
# n_solvable + n_noise = n_solvable / 0.97
# n_noise = (n_solvable / 0.97) - n_solvable
target_rate = 0.97
n_total_needed = int(n_solvable / target_rate)
n_noise_needed = n_total_needed - n_solvable

# Noise Candidates: Not in base, No Arrays, No Recursion
noise_candidates = df[
    (~df.index.isin(subset_combo_base.index)) & 
    (df['array_operator'] == False) & 
    (df['program_type'] != 'recur')
]

if len(noise_candidates) < n_noise_needed:
    print(f"Warning: Not enough noise candidates found. Wanted {n_noise_needed}, got {len(noise_candidates)}.")
    noise_sample = noise_candidates
else:
    noise_sample = noise_candidates.sample(n=n_noise_needed, random_state=42) # Fixed seed for reproducibility

subset_combo = pd.concat([subset_combo_base, noise_sample])
subset_combo_path = os.path.join(output_dir, 'subset_combo.csv')
subset_combo.to_csv(subset_combo_path, index=False)
print(f"Created {subset_combo_path}: {len(subset_combo)} rows (Rate: {subset_combo['Combo_is_term'].mean():.2%})")

# === 2. subset_recur ===
subset_recur = df[df['program_type'] == 'recur'].copy()
subset_recur_path = os.path.join(output_dir, 'subset_recur.csv')
subset_recur.to_csv(subset_recur_path, index=False)
print(f"Created {subset_recur_path}: {len(subset_recur)} rows")

# === 3. subset_combo_complex (Loops > 1 from subset_combo) ===
# Note: User asked to extract FROM subset_combo, so we use the generated dataframe
subset_combo_complex = subset_combo[subset_combo['loops_count'] > 1].copy()
subset_complex_path = os.path.join(output_dir, 'subset_combo_complex.csv')
subset_combo_complex.to_csv(subset_complex_path, index=False)
print(f"Created {subset_complex_path}: {len(subset_combo_complex)} rows")


# === 4. Analysis for New Values (Seahorn+LLM) ===
# Logic: Seahorn is great for C, safety, and proving things if invariants are found.
# LLMs are good at suggesting invariants.
# SVMR traditionally uses Lasso/ranking functions which fail on complex control flow or specific bitvector issues.
# "Seahorn+LLM" implies we can verify termination if we can verify Reachability of an error state (Wait, termination is liveness, but via reduction...)
# Or LLM suggests ranking function -> Seahorn validates.

# Suggestion A: "Gaps in Traditional Tools"
# Where Ultimate or AProVE succeed, but SVMR failed. This is the "Benchmark" to catch up to.
# Filter: SVMR Failed AND (Ultimate Succeeded OR AProVE Succeeded) AND No Arrays (Seahorn might struggle with tricky arrays arrays unless simplified) 
subset_gap = df[
    (~df['SVMR_is_term']) & 
    ((df['Ultimate260122_result'].apply(is_term)) | (df['AProVEonline25'].apply(is_term))) &
    (df['array_operator'] == False) &
    (df['program_type'] == 'loop')
]
subset_gap_path = os.path.join(output_dir, 'subset_gap_svmr_targets.csv')
subset_gap.to_csv(subset_gap_path, index=False)

# Suggestion B: "Control Flow Complexity"
# Code with 'break' statements or 'Nested' loops that SVMR failed on.
# SVMR (linear ranking) struggles with breaks/nested often. Seahorn+LLM (Trace analysis) might do better.
subset_control = df[
    (~df['SVMR_is_term']) &
    ((df['has_break'].apply(to_bool)) | (df['loop_type'] == 'Nested')) &
    (df['program_type'] == 'loop')
]
subset_control_path = os.path.join(output_dir, 'subset_control_complexity.csv')
subset_control.to_csv(subset_control_path, index=False)

# Suggestion C: "Bitvector/Arithmetic" candidates?
# Often identified by specific operators, but we don't have that column.
# We can use "Loops Depth = 1" but SVMR Failed. This implies the logic IS linear-ish but SVMR missed it.
# Maybe large constants or bitwise ops.
subset_linear_failed = df[
    (~df['SVMR_is_term']) &
    (df['loops_depth'] == 1) &
    (df['loops_count'] == 1) &
    (df['program_type'] == 'loop') &
    (df['array_operator'] == False)
]
subset_linear_failed_path = os.path.join(output_dir, 'subset_simple_failed.csv')
subset_linear_failed.to_csv(subset_linear_failed_path, index=False)

print("\n=== Analysis for New Subsets ===")
print(f"1. subset_gap_svmr_targets ({len(subset_gap)}): Programs Solved by SOTA but not SVMR. Perfect for benchmarking 'improvement'.")
print(f"2. subset_control_complexity ({len(subset_control)}): Programs with Breaks/Nesting where SVMR failed. Good for LLM logic analysis.")
print(f"3. subset_simple_failed ({len(subset_linear_failed)}): Simple structure (depth=1) but SVMR failed. Likely requires subtle invariants Seahorn+LLM could suggest.")

