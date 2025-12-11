#!/usr/bin/env bash
# Run CPAchecker job and, after it finishes, run git add/commit/pull --rebase/push once.

set -u -o pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

CMD='ulimit -Sv $((64*1024*1024)) && python3 Src/benchmarks_tools/cpa_run_dir.py -d Datasets/Loopy_dataset_InvarBenchmark -o Results/CPA_loopy_lasso+general_1211.csv -m 32'

eval "$CMD"
MAIN_STATUS=$?

echo "[auto-push] CPAchecker finished (exit $MAIN_STATUS). Running git add/commit/pull --rebase/push..."
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  if git status --porcelain | grep -q .; then
    if git add . \
      && git commit -m "[Auto] Run CPAChecker for Loopy Benchmark"; then
      git pull --rebase origin main || echo "[auto-push] pull --rebase failed; resolve manually."
      git push origin main || echo "[auto-push] push failed; check remote/upstream."
    else
      echo "[auto-push] git commit failed (possibly no staged changes)."
    fi
  else
    echo "[auto-push] No changes to commit."
  fi
else
  echo "[auto-push] Not a git repo; skipping commit/push."
fi

exit "$MAIN_STATUS"
