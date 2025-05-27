import os


LLM_Naive_Unsolve_YES_folder = os.path.join(os.getcwd(), "LLM_Naive_Unsolved", "YES")
LLM_Naive_Unsolve_NO_folder = os.path.join(os.getcwd(), "LLM_Naive_Unsolved", "NO")
LLM_Naive_Unsolve_Unstable_folder = os.path.join(os.getcwd(), "LLM_Naive_Unsolved", "Unstable")
if __name__ == "__main__":
    for f in os.listdir(LLM_Naive_Unsolve_NO_folder):
        os.system("rm " + LLM_Naive_Unsolve_NO_folder + "/" + f)
    for f in os.listdir(LLM_Naive_Unsolve_YES_folder):
        os.system("rm " + LLM_Naive_Unsolve_YES_folder + "/" + f)
    for f in os.listdir(LLM_Naive_Unsolve_Unstable_folder):
        os.system("rm " + LLM_Naive_Unsolve_Unstable_folder + "/" + f)