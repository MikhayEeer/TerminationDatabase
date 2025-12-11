#!/usr/bin/env bash
# Run CPAchecker job and, once每小时,执行 git add/commit/pull --rebase/push。

set -u -o pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

CMD='ulimit -Sv $((64*1024*1024)) && python3 Src/benchmarks_tools/cpa_run_dir.py -d Datasets/Loopy_dataset_InvarBenchmark -o Results/CPA_loopy_lasso+general_1211.csv -m 32'

push_loop() {
  local target_pid="$1"
  local interval="${PUSH_INTERVAL:-3600}"
  while kill -0 "$target_pid" 2>/dev/null; do
    echo "[auto-push] $(date): checking status..."
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
      echo "[auto-push] Not in a git repository; exiting push loop."
      break
    fi

    if git status --porcelain | grep -q .; then
      echo "[auto-push] Changes detected; running add/commit/pull --rebase/push..."
      if git add . \
        && git commit -m "[Auto] Run CPAChecker for Loopy Benchmark"; then
        git pull --rebase origin main || echo "[auto-push] pull --rebase failed; resolve manually."
        git push origin main || echo "[auto-push] push failed; check remote/upstream."
      else
        echo "[auto-push] git commit failed (possibly no staged changes)."
      fi
    else
      echo "[auto-push] No changes; skipping commit/push."
    fi
    sleep "$interval"
  done
}

eval "$CMD" &
MAIN_PID=$!

push_loop "$MAIN_PID" &
PUSH_PID=$!

wait "$MAIN_PID"
MAIN_STATUS=$?

kill "$PUSH_PID" 2>/dev/null || true
wait "$PUSH_PID" 2>/dev/null || true

exit "$MAIN_STATUS"
