import os
import time
import subprocess
from typing import TypedDict, Literal

# Configuration for SVMRanker root path
# You might want to change this or use environment variable
SVMRanker_root_path = os.getenv("SVMRANKER_ROOT_PATH", "/home/clexma/Desktop/fox3/TermDB/SVMRanker")
Exp_result_folder = os.path.join(os.getcwd(), "LLM_Pipeline_Exp_Output")

if not os.path.exists(Exp_result_folder):
    os.makedirs(Exp_result_folder)

def run_with_timeout(orig_base_name, mode,  cmd_list, output_file):
    if not os.path.exists(os.path.dirname(output_file)):
        os.makedirs(os.path.dirname(output_file))        

    with open(output_file, 'a') as f:
        start = time.time()
        try:
            # Note: subprocess.run argument list order matters
            subprocess.run(cmd_list, stdout=f, stderr=subprocess.STDOUT, timeout=300)
        except subprocess.TimeoutExpired:
            f.write("\nERROR: Command timed out after 300 seconds\n")
        except FileNotFoundError:
            f.write("\nERROR: SVMRanker executable or python interpretor not found.\n")
            print(f"Error: Command not found: {cmd_list}")
        
        end = time.time()
        f.write("\nFilename: " + os.path.basename(orig_base_name) + "\n")
        f.write("Mode: " + mode + "\n")
        f.write(f"Running time: {end - start:.6f} s\n")

def SVMRanker(orig_filename, program, type, phase_number, is_terminating, mode, llm_time):
    """
    SVMRanker 工具调用 Adapter
    
    Args:
        orig_filename: 原始文件名 (.bpl)
        program: 程序内容 (unused in CLI call, but maybe useful for debugging)
        type: "Nested" or "Multi" etc.
        phase_number: Integer
        is_terminating: Boolean (not directly used in CLI arg construction but contextually relevant)
        mode: "4-multi", "4-nested", "1-nested" etc.
        llm_time: Time taken by LLM
    """
    print(f"\n--- Calling SVMRanker [Mode: {mode}, Phase: {phase_number}] ---")
    orig_base_name = os.path.basename(orig_filename)
    output_path = os.path.join(Exp_result_folder, f"output_{orig_base_name}.txt")
    
    # Path to CLIMain.py in SVMRanker
    cli_main_path = os.path.join(SVMRanker_root_path, "src", "CLIMain.py")
    
    args = ["python3", cli_main_path]
    
    phase_mode = "lnested" # default
    # Parse mode string to determine valid arguments for SVMRanker
    if "multi" in mode.lower():
        phase_mode = "lmulti"
    elif "nested" in mode.lower():
        phase_mode = "lnested"
    
    # Arguments structure for SVMRanker CLI
    args.append(phase_mode)
    args.append("--depth_bound")
    args.append(str(phase_number))
    args.append(orig_filename)

    print(f"Executing: {' '.join(args)}")
    run_with_timeout(orig_base_name, mode, args, output_path)
    print("--- SVMRanker Call Finished ---")
