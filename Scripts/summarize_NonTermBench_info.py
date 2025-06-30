#!/usr/bin/env python3
import csv
import sys
from collections import Counter

def count_categories(csv_path):
    counts = Counter()
    with open(csv_path, newline='', encoding='utf-8') as f:
        reader = csv.DictReader(f, fieldnames=['filename', 'category'])
        for row in reader:
            # 如果有表头行且与示例相同，可跳过 header
            if row['filename'] == 'filename' and row['category'] == 'category':
                continue
            counts[row['category']] += 1
    return counts

def main():
    if len(sys.argv) != 2:
        print(f"用法: {sys.argv[0]} <输入 CSV 文件路径>")
        sys.exit(1)
    csv_path = sys.argv[1]
    counts = count_categories(csv_path)
    for category, cnt in counts.most_common():
        print(f"{category}: {cnt}")

if __name__ == '__main__':
    main()
