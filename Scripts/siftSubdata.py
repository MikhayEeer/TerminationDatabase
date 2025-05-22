'''
You should run this script 
in the directory containing TPDB_Y2024_filtered_VBS.csv 
and TPDB_Y2024_filtered_VBS folder.

Usage: 
    python3 Scripts/siftSubdata.py [--target SUBSET_FOLDER] 
    [--prefix SOURCE_PREFIX] 
    [--keyword FILTER_KEYWORD]
'''

import os
import shutil
import csv
import argparse

class SubsetFileSifter:
    def __init__(self, base_root, target_folder, path_prefix):
        self.base_root = base_root
        self.target_folder = os.path.join(base_root, target_folder)
        self.path_prefix = os.path.join(base_root, path_prefix)
        self.target_paths = []

        os.makedirs(self.target_folder, exist_ok=True)

    def read_csv(self, csv_filename, filter_keywords):
        csv_path = os.path.join(self.base_root, csv_filename)
        with open(csv_path, 'r', newline='') as f:
            reader = csv.reader(f, quotechar='"')
            for row in reader:
                if len(row) >= 2 and any(kw.upper() in row[1].upper() for kw in filter_keywords):  # 多关键词检查
                    self.target_paths.append(row[0])

    def copy_files(self):
        print(f"Copying {len(self.target_paths)} files...")
        for idx, relative_path in enumerate(self.target_paths, 1):
            src = os.path.join(self.path_prefix, relative_path)
            dest = os.path.join(self.target_folder, os.path.basename(relative_path))
            shutil.copy2(src, dest)
            if idx % 100 == 0:
                print(f"[{idx}/{len(self.target_paths)}] Copying {os.path.basename(src)}")
        print(f"Completed copying {len(self.target_paths)} files")

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('--target', 
                        help='Target folder name', default="TPDB_SUBSET")
    parser.add_argument('--prefix', 
                        help='Source files prefix path', default="TPDB_Y2024_filtered_VBS")
    parser.add_argument('--prefix_csv', default="TPDB_Y2024_filtered_VBS.csv")
    parser.add_argument('--keyword', 
                        help='过滤关键词列表(如 MAYBE YES NO)', 
                        nargs='+', default=["MAYBE"])
    args = parser.parse_args()
    print(f"Current working directory: {os.getcwd()}")
    print(f"Command line arguments: {vars(args)}")

    sifter = SubsetFileSifter(
        base_root=os.getcwd(),
        target_folder=args.target,
        path_prefix=args.prefix
    )
    sifter.read_csv(csv_filename=args.prefix_csv, filter_keywords=args.keyword)
    sifter.copy_files()