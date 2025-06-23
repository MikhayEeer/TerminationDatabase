import os
import sys

TOTAL_FOLDER = os.path.join(os.getcwd(), "Program_Boogie_Total")
LLM_TermType_Exp_folder = os.path.join(os.getcwd(), "LLM_Termtype_Exp")
Uncertain_folder = os.path.join(os.getcwd(), "LLM_Termtype_Exp", "Uncertain_files")


if __name__ == "__main__":
    certain_csv = os.path.join(LLM_TermType_Exp_folder, "certain_files_extracted.csv")
    f = open(certain_csv)
    certain_file_list = []
    for line in f.readlines():
        stripped_line = line.strip()
        certain_file_list.append(stripped_line)
    f.close()
    for file in os.listdir(TOTAL_FOLDER):
        if file in certain_file_list:
            pass
        else:
            os.system("cp " + os.path.join(TOTAL_FOLDER, file) + " " + Uncertain_folder)