import os
import sys

LLM_csv_result_file = os.path.join(os.getcwd(), "LLM_Results", "llm_results_Certain.csv")
LLM_Naive_unsolve_unstable_folder = os.path.join(os.getcwd(), "LLM_Naive_Unsolved", "Unstable")
LLM_Naive_unsolve_YES_folder = os.path.join(os.getcwd(), "LLM_Naive_Unsolved", "YES")
LLM_Naive_unsolve_NO_folder = os.path.join(os.getcwd(), "LLM_Naive_Unsolved", "NO")

LLM_Results_Raw_folder = os.path.join(os.getcwd(), "Results", "LLM_results")
filename2resultname = dict()
unstable_bases = dict()

if __name__ == "__main__":
    diff_YES_file_names = []
    diff_NO_file_names = []
    unstable_file_names = []
    diff_no_num = 0
    diff_yes_num = 0
    diff_unknown_num = 0
    unstable_num = 0
    file = open(LLM_csv_result_file)
    for line in file:
        line_infos = str.split(line, ",")
        file_name = line_infos[0]
        base_result = line_infos[1]
        is_stable = line_infos[2]
        filename2resultname[file_name] = base_result + "_" + file_name + ".txt"
        if is_stable != "True":
            unstable_num += 1
            unstable_file_names.append(os.path.join(os.getcwd(), "TPDB_" + base_result, file_name))
            unstable_bases[os.path.join(os.getcwd(), "TPDB_" + base_result, file_name)] = base_result
            continue
        llm_is_terminating = line_infos[3]
        llm_is_unknown = line_infos[4]
        ref_is_terminating = line_infos[5]
        ref_is_unknown = line_infos[6]
        if llm_is_unknown != ref_is_unknown or llm_is_terminating != ref_is_terminating:
            diff_file_name = os.path.join(os.getcwd(), "TPDB_" + base_result, file_name)
            if base_result == "YES":
                diff_YES_file_names.append(diff_file_name)
                diff_yes_num += 1
            elif base_result == "NO":
                diff_NO_file_names.append(diff_file_name)
                diff_no_num += 1
            else:
                diff_unknown_num += 1
    print("------- UNSTABLE FILE -------")
    for f in unstable_file_names:
        os.system("cp " + f + " " + LLM_Naive_unsolve_unstable_folder + "/" + unstable_bases[f] + "_" + os.path.basename(f))
        result_file = filename2resultname[os.path.basename(f)]
        os.system("cp " + os.path.join(LLM_Results_Raw_folder, result_file) + " " + LLM_Naive_unsolve_unstable_folder)
    print("------- DIFF FILES -------")
    for f in diff_YES_file_names:
        os.system("cp " + f + " " + LLM_Naive_unsolve_YES_folder)
        result_file = filename2resultname[os.path.basename(f)]
        new_name = result_file.split("_", maxsplit=1)[1]
        os.system("cp " + os.path.join(LLM_Results_Raw_folder, result_file) + " " + os.path.join(LLM_Naive_unsolve_YES_folder, new_name))
    for f in diff_NO_file_names:
        os.system("cp " + f + " " + LLM_Naive_unsolve_NO_folder)
        result_file = filename2resultname[os.path.basename(f)]
        new_name = result_file.split("_", maxsplit=1)[1]
        os.system("cp " + os.path.join(LLM_Results_Raw_folder, result_file) + " " + os.path.join(LLM_Naive_unsolve_NO_folder, new_name))

    
    print("Summary: unstable num: " + str(unstable_num))
    print("Summary: diff yes num: " + str(diff_yes_num) + " diff no num: " + str(diff_no_num) + " diff unknown num: " + str(diff_unknown_num))


    