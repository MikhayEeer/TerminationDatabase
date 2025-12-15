import csv
import re
import os

# Paths
source_csv_path = r'd:\Workspace\repo\TerminationDatabase\Results\CPA_Outputs\Loopy_summary_sample_updated.csv'
output_dir = r'd:\Workspace\repo\TerminationDatabase\Results\CPA_Outputs'

output_invariants_path = os.path.join(output_dir, 'Lasso_with_invariants.csv')
output_unknown_path = os.path.join(output_dir, 'Lasso_unknown.csv')
output_terminating_path = os.path.join(output_dir, 'Lasso_terminating.csv')

def has_effective_invariants(invariants_str):
    if not invariants_str:
        return False
    # Split by semicolon to handle multiple invariants
    parts = invariants_str.split(';')
    for part in parts:
        # Look for content inside []
        match = re.search(r'\[(.*?)\]', part)
        if match:
            content = match.group(1).strip()
            if content:
                return True
    return False

def main():
    print(f"Reading from {source_csv_path}...")
    
    rows_invariants = []
    rows_unknown = []
    rows_terminating = []
    
    fieldnames = []

    try:
        with open(source_csv_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            fieldnames = reader.fieldnames
            
            for row in reader:
                if row['config'] != 'lasso':
                    continue
                
                # 1. Lasso with effective invariants
                if has_effective_invariants(row['invariants']):
                    rows_invariants.append(row)
                
                # 2. Lasso Unknown
                if row['verification_result'] == 'UNKNOWN':
                    rows_unknown.append(row)
                
                # 3. Lasso Terminating (TRUE)
                if row['verification_result'] == 'TRUE':
                    rows_terminating.append(row)

    except Exception as e:
        print(f"Error reading CSV: {e}")
        return

    # Write outputs
    for path, rows, desc in [
        (output_invariants_path, rows_invariants, "Lasso with Invariants"),
        (output_unknown_path, rows_unknown, "Lasso Unknown"),
        (output_terminating_path, rows_terminating, "Lasso Terminating")
    ]:
        print(f"Writing {len(rows)} rows to {desc} ({path})...")
        try:
            with open(path, 'w', encoding='utf-8', newline='') as f:
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()
                writer.writerows(rows)
        except Exception as e:
            print(f"Error writing {desc}: {e}")

    print("Done.")

if __name__ == "__main__":
    main()
