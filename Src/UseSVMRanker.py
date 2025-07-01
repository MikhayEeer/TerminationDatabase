import os
import time
import subprocess
SVMRanker_root_path = "/home/clexma/Desktop/fox3/TermDB/SVMRanker"
Exp_result_folder  = os.path.join(os.getcwd(), "LLM_Pipeline_Exp")

def run_with_timeout(orig_base_name, mode,  cmd_list, output_file):
    with open(output_file, 'a') as f:
        start = time.time()
        try:
            subprocess.run(cmd_list, stdout=f, stderr=subprocess.STDOUT, timeout=300)
        except subprocess.TimeoutExpired:
            f.write("\nERROR: Command timed out after 300 seconds\n")
        end = time.time()
        f.write("\nFilename: " + os.path.basename(orig_base_name) + "\n")
        f.write("Mode: " + mode + "\n")
        f.write(f"Running time: {end - start:.6f} s\n")

def SVMRanker(orig_filename, program, type, phase_number, is_terminating, mode, llm_time):
    """
    SVMRanker 工具调用
    """
    print("\n--- Calling SVMRanker ---")
    orig_base_name = os.path.basename(orig_filename)
    output_path = os.path.join(Exp_result_folder, f"output_{orig_base_name}.txt")
    args = ["python3", os.path.join(SVMRanker_root_path, "src", "CLIMain.py")]
    phase_mode = "lnested"
    depth_bound_num = "1"
    if mode == "4-multi":
        phase_mode = "lmulti"
        depth_bound_num = "4"
        pass
    elif mode == "4-nested":
        depth_bound_num = "4"
        pass 
    elif mode == "1-nested":
        depth_bound_num = "1"
        pass
    else:
        print("unknown mode: " + mode)
    print("Using mode " + mode)
    args.append(phase_mode)
    args.append("--depth_bound")
    args.append(depth_bound_num)
    args.append(orig_filename)

    run_with_timeout(orig_base_name, mode, args, output_path)
    print("--- SVMRanker Call Finished ---")
    # 在实际场景中，这里会包含子进程调用或其他集成。

