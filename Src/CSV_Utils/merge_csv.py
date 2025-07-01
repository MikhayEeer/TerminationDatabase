import pandas as pd
import sys
import os
from pathlib import Path

def merge_csv_files(*file_paths, output_path=None):
    """
    Merge multiple CSV files based on common 'file' field, extracting respective result and time_taken columns.
    Mark whether all results are consistent.
    
    Args:
        *file_paths: Variable number of CSV file paths
        output_path: Output file path, if None then only return DataFrame without saving
    
    Returns:
        Merged pandas DataFrame
    """
    if len(file_paths) < 2:
        raise ValueError("At least 2 CSV files are required for merging")

    dataframes = []
    file_labels = []
    
    for i, file_path in enumerate(file_paths):
        if not os.path.exists(file_path):
            raise FileNotFoundError(f"File does not exist: {file_path}")
        
        df = pd.read_csv(file_path)
        file_name = Path(file_path).stem  # Use filename as label
        
        print(f"File {file_name} contains {len(df)} rows, columns: {df.columns.tolist()}")
        
        # Ensure required columns exist
        required_cols = ['file', 'result', 'time_taken']
        for col in required_cols:
            if col not in df.columns:
                print(f"Warning: File {file_name} missing column '{col}'. Script may not work as expected.")
        
        # Keep only needed columns: file, result, time_taken
        columns_to_keep = ['file']
        if 'result' in df.columns:
            columns_to_keep.append('result')
        if 'time_taken' in df.columns:
            columns_to_keep.append('time_taken')
        
        df_filtered = df[columns_to_keep].copy()
        
        dataframes.append(df_filtered)
        file_labels.append(file_name)
    
    # Merge all DataFrames step by step
    merged_df = dataframes[0].copy()
    
    # Add suffix to first DataFrame columns
    cols_to_rename = {}
    for col in merged_df.columns:
        if col != 'file':
            cols_to_rename[col] = f"{col}_{file_labels[0]}"
    merged_df = merged_df.rename(columns=cols_to_rename)
    
    # Merge other DataFrames sequentially
    for i, (df, label) in enumerate(zip(dataframes[1:], file_labels[1:]), 1):
        df_renamed = df.copy()
        cols_to_rename = {}
        for col in df_renamed.columns:
            if col != 'file':
                cols_to_rename[col] = f"{col}_{label}"
        df_renamed = df_renamed.rename(columns=cols_to_rename)

        merged_df = merged_df.merge(df_renamed, on='file', how='outer')

    result_columns = []
    time_columns = []
    
    for col in merged_df.columns:
        if col == 'file':
            continue
        elif col.startswith('result_'):
            result_columns.append(col)
        elif col.startswith('time_taken_'):
            time_columns.append(col)

    ordered_columns = ['file']
    for label in file_labels:
        result_col = f'result_{label}'
        time_col = f'time_taken_{label}'
        if result_col in merged_df.columns:
            ordered_columns.append(result_col)
        if time_col in merged_df.columns:
            ordered_columns.append(time_col)

    available_columns = [col for col in ordered_columns if col in merged_df.columns]
    result_df = merged_df[available_columns].copy()

    result_cols = [col for col in result_df.columns if col.startswith('result_')]
    
    if len(result_cols) >= 2:
        consistency = []
        
        for i in range(len(result_df)):
            row_results = []
            for col in result_cols:
                value = result_df.iloc[i][col]
                if pd.notna(value):
                    row_results.append(value)
            if len(row_results) == 0:
                consistency.append("Miss")
            elif len(row_results) == 1:
                consistency.append("Miss")
            else:
                if all(r == row_results[0] for r in row_results):
                    consistency.append("True")
                else:
                    consistency.append("False")
        
        result_df['consistency'] = consistency
    else:
        print("Warning: Cannot find enough result columns to calculate consistency.")
        result_df['consistency'] = "Miss"
    
    if len(result_cols) >= 2:
        consistency_counts = result_df['consistency'].value_counts()
        total_count = len(result_df)
        
        true_count = consistency_counts.get('True', 0)
        false_count = consistency_counts.get('False', 0)
        miss_count = consistency_counts.get('Miss', 0)
        
        true_rate = (true_count / total_count * 100) if total_count > 0 else 0
        false_rate = (false_count / total_count * 100) if total_count > 0 else 0
        miss_rate = (miss_count / total_count * 100) if total_count > 0 else 0
        
        print(f"Consistency statistics:")
        print(f"  True: {true_count}/{total_count} ({true_rate:.2f}%)")
        print(f"  False: {false_count}/{total_count} ({false_rate:.2f}%)")
        print(f"  Miss: {miss_count}/{total_count} ({miss_rate:.2f}%)")
    
    print(f"Merged result has {len(result_df)} rows")
    print(f"Final columns: {result_df.columns.tolist()}")
    
    if output_path:
        result_df.to_csv(output_path, index=False)
        print(f"Results saved to {output_path}")
    
    return result_df

if __name__ == "__main__":
    file_paths = []
    output_file_path = "merged_results_with_consistency.csv"
    
    for arg in sys.argv[1:]:
        if arg.endswith('.csv') and os.path.exists(arg):
            file_paths.append(arg)
        elif arg.endswith('.csv'):
            output_file_path = arg
    
    if len(file_paths) < 2:
        print("Error: need at least 2 valid csv files.")
        sys.exit(1)
    
    merge_csv_files(*file_paths, output_path=output_file_path)
