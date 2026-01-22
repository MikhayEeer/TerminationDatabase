#!/usr/bin/env python3
"""
Batch-run Ultimate.py termination checks for C files in one or more directories.

Example:
python3 benchmark_exp_src/ultimate_run_dir.py \
    -d Datasets/Loopy_dataset_InvarBenchmark/termination/tpdb/C/Ultimate \
    -o Results/Ultimate_Termination.csv \
    --spec ../svcomp_examples/sv-benchmarks/c/properties/termination.prp \
    --full-output
"""
import argparse
import csv
import os
import re
import shlex
import shutil
import signal
import subprocess
import sys
import time
from pathlib import Path
from typing import List, Optional, Tuple

SCRIPT_DIR = Path(__file__).resolve().parent
REPO_ROOT = SCRIPT_DIR.parent
DEFAULT_ULTIMATE_ROOT = (SCRIPT_DIR.parent.parent / "UAutomizer-linux").resolve()
DEFAULT_TIMEOUT = 300
DEFAULT_LOG_DIR = "Results/Ultimate_Logs"

RESULT_RE = re.compile(r"^\s*RESULT:\s*(TRUE|FALSE|UNKNOWN)\b", re.IGNORECASE | re.MULTILINE)
ALT_RESULT_RE = re.compile(r"^\s*Result:\s*(TRUE|FALSE|UNKNOWN)\b", re.IGNORECASE | re.MULTILINE)


def normalize_path(path: Path) -> str:
    try:
        return str(path.resolve().relative_to(REPO_ROOT.resolve()))
    except Exception:
        return str(path.resolve())


def collect_c_files(directories: List[str]) -> List[Path]:
    c_files = []
    for directory in directories:
        for root, _, files in os.walk(directory):
            for name in files:
                if name.endswith(".c"):
                    c_files.append(Path(root) / name)
    return sorted(c_files)


def parse_result(text: str) -> Optional[str]:
    for regex in (RESULT_RE, ALT_RESULT_RE):
        match = regex.search(text)
        if match:
            token = match.group(1).upper()
            if token == "TRUE":
                return "YES"
            if token == "FALSE":
                return "NO"
            if token == "UNKNOWN":
                return "MAYBE"
    return None


def select_base_dir(file_path: Path, directories: List[str]) -> Optional[Path]:
    file_path = file_path.resolve()
    best = None
    for directory in directories:
        base = Path(directory).expanduser().resolve()
        try:
            file_path.relative_to(base)
        except ValueError:
            continue
        if best is None or len(str(base)) > len(str(best)):
            best = base
    return best


def get_log_dir_for_file(file_path: Path, log_dir: Path, directories: List[str]) -> Path:
    file_path = file_path.resolve()
    try:
        rel = file_path.relative_to(REPO_ROOT.resolve())
        return log_dir / rel.parent
    except ValueError:
        base = select_base_dir(file_path, directories)
        if base:
            rel = file_path.relative_to(base)
            return log_dir / rel.parent
    return log_dir


def run_ultimate(
    file_path: Path,
    ultimate_root: Path,
    ultimate_py: Path,
    spec_path: Path,
    timeout: int,
    full_output: bool,
    architecture: Optional[str],
    enable_assertions: bool,
    config_dir: Optional[Path],
    data_dir: Optional[Path],
) -> Tuple[str, Optional[str], str, str, Optional[int], str, str]:
    cmd = [sys.executable, str(ultimate_py)]
    if config_dir:
        cmd += ["--config", str(config_dir)]
    if data_dir:
        cmd += ["--data", str(data_dir)]
    if enable_assertions:
        cmd.append("--enable-assertions")
    if full_output:
        cmd.append("--full-output")
    if architecture:
        cmd += ["--architecture", architecture]
    cmd += ["--spec", str(spec_path), "--file", str(file_path)]
    cmd_str = shlex.join(cmd)

    start = time.time()
    stdout = ""
    stderr = ""
    try:
        process = subprocess.Popen(
            cmd,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True,
            cwd=str(ultimate_root),
            preexec_fn=os.setsid,
        )
        stdout, stderr = process.communicate(timeout=timeout)
        returncode = process.returncode
    except subprocess.TimeoutExpired:
        try:
            os.killpg(os.getpgid(process.pid), signal.SIGKILL)
        except Exception:
            try:
                process.kill()
            except Exception:
                pass
        return "TIMEOUT", f"Analysis timed out after {timeout} seconds", "", "", None, "timeout", cmd_str
    except Exception as exc:
        return "ERROR", str(exc), "", "", None, "exception", cmd_str

    combined = (stdout or "") + "\n" + (stderr or "")
    result = parse_result(combined)
    result_source = "stdout_stderr"

    ultimate_log_path = ultimate_root / "ultimate.log"
    ultimate_log_text = ""
    if not result and ultimate_log_path.exists():
        try:
            if ultimate_log_path.stat().st_mtime >= start - 1:
                ultimate_log_text = ultimate_log_path.read_text(errors="ignore")
                result = parse_result(ultimate_log_text)
                if result:
                    result_source = "ultimate.log"
        except Exception:
            pass

    if not result:
        result = "ERROR"
        error = f"No result found (exit={returncode})"
        result_source = "none"
    else:
        error = None
        if returncode != 0:
            error = f"Non-zero exit code: {returncode}"

    return result, error, combined, ultimate_log_text, returncode, result_source, cmd_str


def load_processed_paths(csv_path: Path) -> set:
    processed = set()
    if not csv_path.exists():
        return processed
    try:
        with csv_path.open("r", newline="") as f:
            reader = csv.DictReader(f)
            if not reader.fieldnames:
                return processed
            if "path" in reader.fieldnames:
                for row in reader:
                    if row.get("path"):
                        processed.add(row["path"])
            else:
                for row in reader:
                    if row.get("file"):
                        processed.add(row["file"])
    except Exception:
        pass
    return processed


def main() -> None:
    parser = argparse.ArgumentParser(description="Run Ultimate termination checks on C files")
    parser.add_argument(
        "-d",
        "--directory",
        nargs="+",
        required=True,
        help="Directories containing C files to analyze (recursively)",
    )
    parser.add_argument(
        "-o",
        "--output",
        default="Results/Ultimate_Termination.csv",
        help="Output CSV file for results",
    )
    parser.add_argument(
        "--ultimate-root",
        default=None,
        help="Path to UAutomizer-linux (default: ../UAutomizer-linux relative to repo)",
    )
    parser.add_argument("--spec", required=True, help="Termination .prp file")
    parser.add_argument("--timeout", "-t", type=int, default=DEFAULT_TIMEOUT)
    parser.add_argument("--full-output", action="store_true", help="Enable Ultimate --full-output")
    parser.add_argument(
        "--log-dir",
        default=DEFAULT_LOG_DIR,
        help="Directory to save per-file logs (default: Results/Ultimate_Logs)",
    )
    parser.add_argument(
        "--architecture",
        choices=["32bit", "64bit"],
        default=None,
        help="Pass --architecture to Ultimate",
    )
    parser.add_argument(
        "--enable-assertions",
        action="store_true",
        help="Enable Java assertions in Ultimate",
    )
    parser.add_argument("--config-dir", default=None, help="Ultimate --config override directory")
    parser.add_argument("--data-dir", default=None, help="Ultimate --data override directory")
    parser.add_argument("--force", "-f", action="store_true", help="Re-run all files")
    args = parser.parse_args()

    ultimate_root = Path(args.ultimate_root).expanduser().resolve() if args.ultimate_root else DEFAULT_ULTIMATE_ROOT
    ultimate_py = ultimate_root / "Ultimate.py"

    if not ultimate_py.exists():
        print(f"Error: Ultimate.py not found at {ultimate_py}")
        sys.exit(1)

    spec_path = Path(args.spec).expanduser().resolve()
    if not spec_path.exists():
        print(f"Error: termination .prp file not found at {spec_path}")
        sys.exit(1)

    for directory in args.directory:
        if not os.path.isdir(directory):
            print(f"Error: {directory} is not a valid directory")
            sys.exit(1)

    c_files = collect_c_files(args.directory)
    if not c_files:
        print("No C files found in provided directories.")
        sys.exit(0)

    output_path = Path(args.output)
    output_path.parent.mkdir(parents=True, exist_ok=True)

    log_dir = Path(args.log_dir) if args.log_dir else None
    if log_dir:
        log_dir.mkdir(parents=True, exist_ok=True)

    processed = set()
    if output_path.exists() and not args.force:
        processed = load_processed_paths(output_path)
        if processed:
            print(f"Resume mode: skipping {len(processed)} already processed files")

    fieldnames = [
        "file",
        "result",
        "error",
        "exit_code",
        "result_source",
        "time_taken",
        "full_log",
        "ultimate_log",
        "processed_time",
        "path",
        "spec",
        "architecture",
        "timeout",
        "full_output",
        "ultimate_root",
        "command",
    ]
    write_header = not output_path.exists() or args.force

    mode = "w" if write_header else "a"
    config_dir = Path(args.config_dir).expanduser().resolve() if args.config_dir else None
    data_dir = Path(args.data_dir).expanduser().resolve() if args.data_dir else None

    with output_path.open(mode, newline="") as csvfile:
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        if write_header:
            writer.writeheader()

        total = len(c_files)
        for idx, file_path in enumerate(c_files, start=1):
            rel_path = normalize_path(file_path)
            if rel_path in processed:
                print(f"[{idx}/{total}] Skipping {file_path}")
                continue

            print(f"[{idx}/{total}] Analyzing {file_path}...")
            start = time.time()
            (
                result,
                error,
                combined_output,
                ultimate_log_text,
                returncode,
                result_source,
                cmd_str,
            ) = run_ultimate(
                file_path=file_path,
                ultimate_root=ultimate_root,
                ultimate_py=ultimate_py,
                spec_path=spec_path,
                timeout=args.timeout,
                full_output=args.full_output,
                architecture=args.architecture,
                enable_assertions=args.enable_assertions,
                config_dir=config_dir,
                data_dir=data_dir,
            )
            time_taken = time.time() - start

            full_log_path = ""
            ultimate_log_path = ""
            if log_dir:
                log_file_dir = get_log_dir_for_file(file_path, log_dir, args.directory)
                log_file_dir.mkdir(parents=True, exist_ok=True)
                if args.full_output and combined_output:
                    full_log_path = str(log_file_dir / f"{file_path.name}-ultimate-svtermprp.log")
                    Path(full_log_path).write_text(combined_output)
                if ultimate_log_text:
                    ultimate_log_path = str(log_file_dir / f"{file_path.name}-ultimate.log")
                    Path(ultimate_log_path).write_text(ultimate_log_text)
                else:
                    # Copy ultimate.log if present even when we didn't read it
                    ultimate_log_src = ultimate_root / "ultimate.log"
                    if ultimate_log_src.exists():
                        ultimate_log_path = str(log_file_dir / f"{file_path.name}-ultimate.log")
                        try:
                            shutil.copyfile(ultimate_log_src, ultimate_log_path)
                        except Exception:
                            ultimate_log_path = ""

            timestamp = time.strftime("%Y-%m-%d %H:%M:%S")
            writer.writerow(
                {
                    "file": file_path.name,
                    "result": result,
                    "error": error or "",
                    "exit_code": "" if returncode is None else str(returncode),
                    "result_source": result_source,
                    "time_taken": f"{time_taken:.2f}",
                    "full_log": full_log_path,
                    "ultimate_log": ultimate_log_path,
                    "processed_time": timestamp,
                    "path": rel_path,
                    "spec": str(spec_path),
                    "architecture": args.architecture or "",
                    "timeout": str(args.timeout),
                    "full_output": "1" if args.full_output else "0",
                    "ultimate_root": str(ultimate_root),
                    "command": cmd_str,
                }
            )
            csvfile.flush()

            print(f"  Result: {result} (took {time_taken:.2f}s)")
            if error:
                print(f"  Error: {error}")


if __name__ == "__main__":
    main()
