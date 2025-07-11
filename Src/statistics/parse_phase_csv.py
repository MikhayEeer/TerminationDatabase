import os
import csv
import argparse


PHASE_JUDGE_Exp_folder = os.path.join(os.getcwd(), "LLM_Phase_Exp")
PHASE_JUDGE_Exp_Result_folder = os.path.join(PHASE_JUDGE_Exp_folder, "LLM_Phase_Results")
NESTED_PHASE_JUDGE_Exp_Result_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Nested")
MULTI_PHASE_JUDGE_Exp_Result_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Multi")
# newly added
NESTED_PHASE_JUDGE_Exp_Rem_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Nested_rem")

NESTED_PHASE_JUDGE_Exp_Process_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Nested_processed")
MULTI_PHASE_JUDGE_Exp_Process_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Multi_processed")
# newly added
NESTED_PHASE_JUDGE_Exp_Rem_Process_folder = os.path.join(PHASE_JUDGE_Exp_Result_folder, "Nested_rem_processed")

def process_file(input_file, output_file):
    with open(input_file, newline='') as infile, open(output_file, 'w', newline='') as outfile:
        reader = csv.reader(infile)
        writer = csv.writer(outfile)
        for row in reader:
            filename = row[0]
            nums = list(map(int, row[1:4]))
            last_val = row[4]

            # Extract base number from filename (before the underscore)
            base = int(filename.split('_')[0])

            # Count equal, greater, and smaller occurrences
            equal_count = sum(1 for n in nums if n == base)
            greater_count = sum(1 for n in nums if n > base)
            smaller_count = sum(1 for n in nums if n < base)

            # Write the new row
            writer.writerow([base, filename, equal_count, greater_count, smaller_count, last_val])

def do_process(input_dir, output_dir):
    os.makedirs(output_dir, exist_ok=True)
    for fname in os.listdir(input_dir):
        if fname.lower().endswith('.csv'):
            input_path = os.path.join(input_dir, fname)
            name, ext = os.path.splitext(fname)
            output_fname = f"{name}_process{ext}"
            output_path = os.path.join(output_dir, output_fname)
            process_file(input_path, output_path)
            print(f"Processed {fname} -> {output_fname}")



def categorize_rows(input_dir):
    result_list = []
    # Iterate over all processed CSV files in the directory
    for fname in os.listdir(input_dir):
        if not fname.lower().endswith('.csv'):
            continue
        file_path = os.path.join(input_dir, fname)
        
        with open(file_path, newline='') as csvfile:
            total_time = 0
            row_num = 0
            phase_num_vec = []
            categories_count = {
                'fully_correct': 0,    # All three numbers equal to base
                'safe': 0,             # No number smaller than base
                'unsafe': 0,           # Any number less than base
                'max_safe': 0,          # At least one number >= base
                'max_unsafe': 0  
            }
            reader = csv.reader(csvfile)
            for row in reader:
                row_num = row_num + 1
                base = int(row[0])
                phase_num_vec.append(int(base))
                eq_count = int(row[2])
                gt_count = int(row[3])
                lt_count = int(row[4])
                total_time = total_time + float(row[5])

                # Fully correct: all three equal
                if eq_count == 3:
                    categories_count['fully_correct'] += 1

                # Safe: no number is smaller than base
                if lt_count == 0:
                    categories_count['safe'] += 1

                # Unsafe: any smaller
                if lt_count > 0:
                    categories_count['unsafe'] += 1

                # Max safe: at least one >= base
                if (eq_count + gt_count) >= 1:
                    categories_count['max_safe'] += 1
                
                if (eq_count + gt_count) == 0:
                    categories_count['max_unsafe'] += 1

            result_list.append((fname, categories_count, total_time/(3*row_num)))
    return result_list

def do_categorize(processed_dir):
    counts = categorize_rows(processed_dir)
    print("Category counts:")
    for item in counts:
        print(item[0] + ": ")
        print(item[1])
        print(item[2])


if __name__ == "__main__":
    do_process(NESTED_PHASE_JUDGE_Exp_Result_folder, NESTED_PHASE_JUDGE_Exp_Process_folder)
    do_process(NESTED_PHASE_JUDGE_Exp_Rem_folder, NESTED_PHASE_JUDGE_Exp_Rem_Process_folder)
    do_process(MULTI_PHASE_JUDGE_Exp_Result_folder, MULTI_PHASE_JUDGE_Exp_Process_folder)
    
    do_categorize(NESTED_PHASE_JUDGE_Exp_Process_folder)
    do_categorize(NESTED_PHASE_JUDGE_Exp_Rem_Process_folder)
    do_categorize(MULTI_PHASE_JUDGE_Exp_Process_folder)
