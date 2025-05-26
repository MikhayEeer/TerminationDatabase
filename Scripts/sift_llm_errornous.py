import os
import sys

LLM_csv_result_file = os.path.join(os.getcwd(), "LLM_Results", "llm_results_Certain.csv")
if __name__ == "__main__":
    diff_file_names = []
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
        if is_stable != "True":
            unstable_num += 1
            unstable_file_names.append(os.path.join(os.getcwd(), "TPDB_" + base_result, file_name))
            continue
        llm_is_terminating = line_infos[3]
        llm_is_unknown = line_infos[4]
        ref_is_terminating = line_infos[5]
        ref_is_unknown = line_infos[6]
        if llm_is_unknown != ref_is_unknown or llm_is_terminating != ref_is_terminating:
            diff_file_names.append(os.path.join(os.getcwd(), "TPDB_" + base_result, file_name))
            if base_result == "YES":
                diff_yes_num += 1
            elif base_result == "NO":
                diff_no_num += 1
            else:
                diff_unknown_num += 1
    print("------- UNSTABLE FILE -------")
    for f in unstable_file_names:
        print(f)
    print("------- DIFF FILES -------")
    for f in diff_file_names:
        print(f)
    
    print("Summary: unstable num: " + str(unstable_num))
    print("Summary: diff yes num: " + str(diff_yes_num) + " diff no num: " + str(diff_no_num) + " diff unknown num: " + str(diff_unknown_num))
    