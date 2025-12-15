import csv
import re

csv_path = r'd:\Workspace\repo\TerminationDatabase\Results\CPA_Outputs\Loopy_summary_sample_updated.csv'

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
    stats = {
        'general': {'total': 0, 'results': {}, 'effective_invariants': 0},
        'lasso': {'total': 0, 'results': {}, 'effective_invariants': 0}
    }

    try:
        with open(csv_path, 'r', encoding='utf-8') as f:
            reader = csv.DictReader(f)
            for row in reader:
                config = row['config']
                result = row['verification_result']
                invariants = row['invariants']

                if config not in stats:
                    continue # Should be general or lasso

                stats[config]['total'] += 1
                
                # Count results
                if result not in stats[config]['results']:
                    stats[config]['results'][result] = 0
                stats[config]['results'][result] += 1

                # Count effective invariants
                if has_effective_invariants(invariants):
                    stats[config]['effective_invariants'] += 1

    except Exception as e:
        print(f"Error reading CSV: {e}")
        return

    print("Analysis of Loopy_summary_sample_updated.csv")
    print("============================================")

    for config in ['general', 'lasso']:
        s = stats[config]
        print(f"\nConfiguration: {config}")
        print(f"  Total Files: {s['total']}")
        print("  Termination Results Distribution:")
        for res, count in sorted(s['results'].items()):
            print(f"    {res if res else 'EMPTY'}: {count}")
        
        print(f"  Files with Effective Invariants: {s['effective_invariants']} ({s['effective_invariants']/s['total']*100:.2f}%)")

if __name__ == "__main__":
    main()
