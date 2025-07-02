import os
import sys
import argparse
import csv

def process_csv(input_path: str) -> str:
    """
    Reads the given input CSV, extracts the part after the first underscore in `file_name`,
    writes to a new CSV file named `<original_basename>_extracted.csv`, and returns its path.
    Only the extracted filenames are written (single-column CSV).
    """
    base, ext = os.path.splitext(os.path.basename(input_path))
    output_filename = f"{base}_extracted{ext}"
    output_path = os.path.join(os.path.dirname(input_path), output_filename)

    with open(input_path, mode='r', newline='', encoding='utf-8') as infile, \
         open(output_path, mode='w', newline='', encoding='utf-8') as outfile:
        reader = csv.DictReader(infile)
        # Write only one column header 'filename'
        writer = csv.writer(outfile)
        writer.writerow(['filename'])

        for row in reader:
            parts = row['file_name'].split('_', 1)
            extracted = parts[1] if len(parts) > 1 else ''
            writer.writerow([extracted])

    return output_path

if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Extracts the substring after the first underscore in the 'file_name' column and outputs a one-column CSV of filenames."
    )
    parser.add_argument(
        'input_path',
        help='Path to the input CSV file'
    )
    args = parser.parse_args()

    input_csv = args.input_path
    if not os.path.isfile(input_csv):
        print(f"Error: File not found: {input_csv}")
        sys.exit(1)

    output_csv = process_csv(input_csv)
    print(f"Processed '{input_csv}' and wrote results to '{output_csv}'.")
