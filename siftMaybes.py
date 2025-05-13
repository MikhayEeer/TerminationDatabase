import os
import subprocess


data_base_root = os.getcwd()
maybe_target_folder = os.path.join(data_base_root, "TPDB_MAYBEs")
if __name__ == "__main__":
    maybe_paths = []
    TPDB_base_file_path = os.path.join(data_base_root, "TPDB_Y2024_filtered_VBS.csv")
    base_file = open(TPDB_base_file_path)
    for line in base_file.readlines():
        case_path = line.split(",")[0]
        case_result = line.split(",")[1]
        if "MAYBE" in case_result:
            maybe_paths.append(case_path)
    
    path_prefix = os.path.join(data_base_root, "TPDB_Y2024_filtered_VBS")
    print("path prefix: " + path_prefix)
    #  collect
    for item in maybe_paths:
        file_abs_path = path_prefix + "/" + item
        cp_commands = ["cp", file_abs_path, maybe_target_folder]
        subprocess.run(cp_commands)
        
        

            
    
