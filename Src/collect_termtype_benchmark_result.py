import os
import sys
import argparse
import csv


def scan_phase_dirs(dirA: str, dirB: str):
    """
    Scan directories A and B for files named 'n_name.bpl'.
    Return two dicts mapping 'name.bpl' -> phase count (int).
    B (nested) has priority over A (multi).
    """
    multi_map = {}
    nested_map = {}

    # Scan dirB for Nested
    for fname in os.listdir(dirB):
        parts = fname.split('_', 1)
        if len(parts) == 2 and parts[0].isdigit():
            nested_map[parts[1]] = int(parts[0])

    # Scan dirA for Multi if not in nested
    for fname in os.listdir(dirA):
        parts = fname.split('_', 1)
        if len(parts) == 2 and parts[0].isdigit():
            name = parts[1]
            if name in nested_map:
                # Skip names already in Nested
                continue
            multi_map[name] = int(parts[0])

    return multi_map, nested_map


def generate_benchmark(csvC: str, dirA: str, dirB: str, output_csv: str):
    """
    Combine names from A/B and C.csv (C has lowest priority for name list),
    and write rows with columns: name, terminate, category, phase_count.
    """
    # Scan phase directories
    multi_map, nested_map = scan_phase_dirs(dirA, dirB)

    # Read C.csv into term_map
    term_map = {}
    with open(csvC, mode='r', newline='', encoding='utf-8') as cf:
        reader = csv.reader(cf)
        for row in reader:
            if not row:
                continue
            name = row[0].strip()
            if name.lower() in ('name', 'file_name'):
                continue
            term = row[1].strip() if len(row) > 1 else ''
            term_map[name] = term

    # Prepare output
    with open(output_csv, mode='w', newline='', encoding='utf-8') as outf:
        writer = csv.writer(outf)
        writer.writerow(['name', 'terminate', 'category', 'phase_count'])

        # 1) Names in nested_map
        for name, phase in nested_map.items():
            term = term_map.get(name, '')
            writer.writerow([name, term, 'Nested', phase])

        # 2) Names in multi_map not in nested_map
        for name, phase in multi_map.items():
            term = term_map.get(name, '')
            writer.writerow([name, term, 'Multi', phase])

        # 3) Names only in C.csv (not in A or B)
        for name, term in term_map.items():
            if name in nested_map or name in multi_map:
                continue
            writer.writerow([name, term, '', ''])


def main():
    parser = argparse.ArgumentParser(
        description='Generate benchmark CSV combining termination flags and phase counts.'
    )
    parser.add_argument('dirA', help='Directory A (multiphase files)')
    parser.add_argument('dirB', help='Directory B (nested files)')
    parser.add_argument('csvC', help='Path to C.csv (termination flags)')
    parser.add_argument('output', help='Output CSV path')
    args = parser.parse_args()

    if not os.path.isdir(args.dirA):
        print(f"Error: dirA not found: {args.dirA}")
        sys.exit(1)
    if not os.path.isdir(args.dirB):
        print(f"Error: dirB not found: {args.dirB}")
        sys.exit(1)
    if not os.path.isfile(args.csvC):
        print(f"Error: C.csv not found: {args.csvC}")
        sys.exit(1)

    generate_benchmark(args.csvC, args.dirA, args.dirB, args.output)
    print(f"Generated benchmark CSV: {args.output}")

if __name__ == '__main__':
    main()
