import os
import re
import json
import csv

# 配置
ROOT_DIR = r"d:\Workspace\repo\TerminationDatabase\Datasets\Loopy_dataset_InvarBenchmark\loop_invariants"
OUTPUT_FILE = r"d:\Workspace\repo\TerminationDatabase\Datasets\Loopy_dataset_InvarBenchmark\sft_training_data.jsonl"
CSV_OUTPUT_FILE = r"d:\Workspace\repo\TerminationDatabase\Datasets\Loopy_dataset_InvarBenchmark\loopy_invariant_benchmark.csv"
FAILURE_LOG = r"d:\Workspace\repo\TerminationDatabase\Datasets\Loopy_dataset_InvarBenchmark\extraction_failures.log"

# 正则表达式
# 匹配 assert 语句: //@ assert( ... );
ASSERT_PATTERN = re.compile(r"//\s*@\s*assert\s*\((.*)\)\s*;")

# 匹配循环头 (while 或 for)
LOOP_START_PATTERN = re.compile(r"\b(while|for)\s*\(", re.MULTILINE)

# 匹配函数定义头 (简单的返回类型+函数名+参数)
# 例如: int main() {Or void func(int x) {
FUNC_START_PATTERN = re.compile(r"\b\w+\s+\w+\s*\([^)]*\)\s*\{", re.MULTILINE)

def find_matching_brace(content, start_index):
    """
    从 start_index 开始寻找匹配的闭合大括号 '}'。
    假设 start_index 位于 '{' 之前或正好是 '{'。
    """
    # 先找到第一个 '{'
    open_brace_index = content.find('{', start_index)
    if open_brace_index == -1:
        return -1
    
    balance = 1
    i = open_brace_index + 1
    while i < len(content):
        if content[i] == '{':
            balance += 1
        elif content[i] == '}':
            balance -= 1
            if balance == 0:
                return i + 1 # 返回包含 '}' 的结束位置
        i += 1
    return -1

def extract_context(content, assert_match):
    """
    尝试提取 assert 之前的循环体或所在的函数体。
    """
    assert_start = assert_match.start()
    
    # 1. 尝试寻找最近的循环 (while/for)
    # 我们查找所有循环头，找到在 assert 之前且距离最近的一个
    loop_matches = list(LOOP_START_PATTERN.finditer(content))
    best_loop = None
    
    # 倒序遍历，找到第一个在 assert 之前的循环
    for match in reversed(loop_matches):
        if match.start() < assert_start:
            # 检查这个循环是否包含 assert 或者 assert 紧随其后
            # 简单的策略：提取这个循环体，看它是否看起来像主干
            # 找到循环体的结束位置
            loop_end = find_matching_brace(content, match.end())
            if loop_end != -1:
                # 如果 assert 在循环体内，或者在循环体结束后不远处
                # 这里我们主要假设 assert 是对该循环的验证
                best_loop = (match.start(), loop_end)
                break
    
    if best_loop:
        return content[best_loop[0]:best_loop[1]].strip(), "loop"

    # 2. 如果没有找到合适的循环，尝试寻找所在的函数 (递归情况)
    func_matches = list(FUNC_START_PATTERN.finditer(content))
    best_func = None
    
    for match in reversed(func_matches):
        if match.start() < assert_start:
            func_end = find_matching_brace(content, match.end())
            if func_end != -1 and func_end >= assert_start:
                # assert 在函数体内
                best_func = (match.start(), func_end)
                break
                
    if best_func:
        # 提取函数体，但我们要移除 assert 语句本身，以免泄露答案
        func_body = content[best_func[0]:best_func[1]]
        # 简单地将 assert 行替换为注释
        func_body_clean = func_body.replace(assert_match.group(0), "// Invariant to be found")
        return func_body_clean.strip(), "function"

    return None, "failed"

def main():
    data_entries = []
    csv_rows = []
    failures = []
    
    print(f"开始处理目录: {ROOT_DIR}")
    
    for root, dirs, files in os.walk(ROOT_DIR):
        for file in files:
            if file.endswith(".c"):
                filepath = os.path.join(root, file)
                try:
                    with open(filepath, 'r', encoding='utf-8') as f:
                        content = f.read()

                    # 寻找 invariant
                    match = ASSERT_PATTERN.search(content)
                    if not match:
                        # 没有 assert 的文件跳过，不算失败
                        continue

                    invariant = match.group(1).strip()
                    
                    # 提取上下文 (循环体 或 函数体)
                    context_code, context_type = extract_context(content, match)
                    
                    if context_code:
                        # 构建 Chat 格式
                        entry = {
                            "messages": [
                                {
                                    "role": "system", 
                                    "content": "Provide the loop invariant for the following code."
                                },
                                {
                                    "role": "user", 
                                    "content": f"```c\n{context_code}\n```"
                                },
                                {
                                    "role": "assistant", 
                                    "content": invariant
                                }
                            ],
                            "metadata": {
                                "source": file,
                                "type": context_type
                            }
                        }
                        data_entries.append(entry)

                        # 收集 CSV 数据
                        # 相对路径的目录
                        rel_dir = os.path.relpath(root, ROOT_DIR)
                        csv_rows.append({
                            "directory": rel_dir,
                            "filename": file,
                            "code_snippet": context_code,
                            "invariant": invariant
                        })
                    else:
                        failures.append(filepath)
                        
                except Exception as e:
                    print(f"处理文件出错 {filepath}: {e}")
                    failures.append(f"{filepath} (Error: {str(e)})")

    # 写入 JSONL
    with open(OUTPUT_FILE, 'w', encoding='utf-8') as f:
        for entry in data_entries:
            f.write(json.dumps(entry, ensure_ascii=False) + "\n")

    # 写入 CSV
    with open(CSV_OUTPUT_FILE, 'w', encoding='utf-8', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=["directory", "filename", "code_snippet", "invariant"])
        writer.writeheader()
        writer.writerows(csv_rows)
            
    # 写入失败日志
    with open(FAILURE_LOG, 'w', encoding='utf-8') as f:
        f.write(f"Total Failures: {len(failures)}\n")
        for fail in failures:
            f.write(f"{fail}\n")

    print(f"处理完成。")
    print(f"生成了 {len(data_entries)} 条 JSONL 数据，保存至 {OUTPUT_FILE}")
    print(f"生成了 {len(csv_rows)} 条 CSV 数据，保存至 {CSV_OUTPUT_FILE}")
    print(f"共有 {len(failures)} 个文件提取失败，详情见 {FAILURE_LOG}")

if __name__ == "__main__":
    main()
