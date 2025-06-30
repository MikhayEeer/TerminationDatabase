import os
import csv

def categorize_c_files(target_folder):
    """
    Iterates through .c files in the specified directory, displays their content,
    prompts for a category, and logs the information to a CSV file in that directory.
    Supports resuming from where it left off.
    """
    csv_filename = 'TPDB_Nonterm_categorization.csv'
    csv_filepath = os.path.join(target_folder, csv_filename)
    categories = {
        '1': 'RECUR',
        '2': 'GEOMETRIC',
        '3': 'Divergent',
        '4': 'FunctionCall',
        '5': 'Memory',
        '6': 'Other'
    }

    # --- Read already categorized files ---
    processed_files = set()
    if os.path.exists(csv_filepath):
        with open(csv_filepath, 'r', newline='', encoding='utf-8') as csvfile:
            reader = csv.reader(csvfile)
            try:
                # Skip header
                next(reader)
                for row in reader:
                    if row: # Avoid errors on empty rows
                        processed_files.add(row[0])
            except StopIteration:
                # CSV is empty or just has a header
                pass


    # --- Get all .c files in the directory ---
    try:
        c_files = sorted([f for f in os.listdir(target_folder) if f.endswith('.c')])
    except FileNotFoundError:
        print(f"Error: The directory '{target_folder}' was not found.")
        return


    if not c_files:
        print(f"No .c files found in the directory: {target_folder}")
        return

    print(f"Found {len(c_files)} .c files in '{target_folder}'. {len(processed_files)} already categorized.")

    cnt = 0
    # --- Process each .c file ---
    for filename in c_files:
        if filename in processed_files:
            cnt+=1
            continue
        cnt += 1
        print(f"\n--- [{cnt}/{len(c_files)}] Processing file: {filename} ---\n")

        # Print file content
        try:
            file_path = os.path.join(target_folder, filename)
            print("#"*40)
            with open(file_path, 'r', encoding='utf-8', errors='ignore') as f:
                print(f.read())
            print("#"*40)
        except FileNotFoundError:
            print(f"Could not find file: {filename}. Skipping.")
            continue
        except Exception as e:
            print(f"An error occurred while reading {filename}: {e}. Skipping.")
            continue


        # Get user input
        while True:
            print("\n--- Please choose a category for this file: ---\n ")
            print("1: RECUR")
            print("2: GEOMETRIC")
            print("3: Divergent")
            print("4: FunctionCall")
            print("5: Memory")
            print("6: Other")
            choice = input("Enter your choice (1/2/3/4/5/6): ")

            if choice in categories:
                selected_category = categories[choice]
                break
            else:
                print("Invalid input. Please enter a number between 1 and 5.")

        # Write to CSV in real-time
        file_exists = os.path.exists(csv_filepath)
        try:
            with open(csv_filepath, 'a', newline='', encoding='utf-8') as csvfile:
                writer = csv.writer(csvfile)
                if not file_exists or os.path.getsize(csv_filepath) == 0:
                    writer.writerow(['filename', 'category'])  # Write header
                writer.writerow([filename, selected_category])
            print(f"Saved: {filename}, {selected_category}")
            processed_files.add(filename) # Add to processed set to avoid re-processing in the same run
        except IOError as e:
            print(f"Error writing to {csv_filepath}: {e}")
            # Decide if you want to stop or continue
            break
    print("\n--- All .c files have been categorized. ---")

if __name__ == "__main__":
    # Prompt user for the target directory
    target_dir = input("Please enter the path to the folder containing .c files (e.g., . for current dir): ")
    if not os.path.isdir(target_dir):
        print(f"Error: '{target_dir}' is not a valid directory.")
    else:
        categorize_c_files(target_dir)