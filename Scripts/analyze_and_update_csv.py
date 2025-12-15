import csv
import os

# File paths
wide_csv_path = r'd:\Workspace\repo\TerminationDatabase\Results\CPA_Outputs\CPA_loopy_lasso+general_1211.csv'
long_csv_path = r'd:\Workspace\repo\TerminationDatabase\Results\CPA_Outputs\Loopy_summary_sample.csv'
output_csv_path = r'd:\Workspace\repo\TerminationDatabase\Results\CPA_Outputs\Loopy_summary_sample_updated.csv'

# Mapping for result consistency check
result_mapping = {
    'NO': 'FALSE',
    'MAYBE': 'UNKNOWN',
    'YES': 'TRUE',
    'TRUE': 'TRUE',
    'FALSE': 'FALSE',
    'UNKNOWN': 'UNKNOWN'
}

def normalize_result(res):
    if not res: return ""
    return result_mapping.get(res.upper(), res.upper())

def main():
    print(f"Reading reference data from {wide_csv_path}...")
    reference_data = {}
    
    try:
        with open(wide_csv_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                filename = row['file']
                # Handle quoted filenames if necessary, though csv module usually handles it.
                # The preview showed "filename", so csv reader should strip quotes automatically.
                
                reference_data[filename] = {
                    'path': row['path'],
                    'lasso': row['result_lasso'],
                    'general': row['result_general']
                }
    except Exception as e:
        print(f"Error reading wide CSV: {e}")
        return

    print(f"Loaded {len(reference_data)} files from reference CSV.")

    print(f"Reading and processing {long_csv_path}...")
    updated_rows = []
    mismatches = []
    missing_paths = []
    
    fieldnames = []

    try:
        with open(long_csv_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            fieldnames = reader.fieldnames
            if 'relative_path' not in fieldnames:
                fieldnames.append('relative_path')
            
            for row in reader:
                filename = row['file']
                config = row['config']
                result = row['verification_result']
                
                # Find reference
                ref = reference_data.get(filename)
                
                relative_path = ""
                if ref:
                    relative_path = ref['path']
                    
                    # Consistency Check
                    ref_result = ""
                    if config == 'lasso':
                        ref_result = ref['lasso']
                    elif config == 'general':
                        ref_result = ref['general']
                    
                    norm_ref = normalize_result(ref_result)
                    norm_res = normalize_result(result)
                    
                    if norm_ref != norm_res:
                        mismatches.append({
                            'file': filename,
                            'config': config,
                            'long_res': result,
                            'wide_res': ref_result
                        })
                else:
                    missing_paths.append(filename)
                
                row['relative_path'] = relative_path
                updated_rows.append(row)

    except Exception as e:
        print(f"Error reading long CSV: {e}")
        return

    # Report
    print("\n--- Analysis Report ---")
    print(f"Total rows processed: {len(updated_rows)}")
    print(f"Files missing in reference CSV: {len(set(missing_paths))}")
    if missing_paths:
        print(f"Sample missing files: {list(set(missing_paths))[:5]}")
        
    print(f"Mismatches found: {len(mismatches)}")
    if mismatches:
        print("Sample mismatches:")
        for m in mismatches[:5]:
            print(f"  File: {m['file']}, Config: {m['config']} -> Long: {m['long_res']} vs Wide: {m['wide_res']}")
    else:
        print("Content is consistent between the two CSVs (for matching files).")

    # Write output
    print(f"\nWriting updated CSV to {output_csv_path}...")
    try:
        with open(output_csv_path, 'w', encoding='utf-8', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(updated_rows)
        print("Done.")
    except Exception as e:
        print(f"Error writing output CSV: {e}")

if __name__ == "__main__":
    main()
