from datasets import load_dataset

# Login using e.g. `huggingface-cli login` to access this dataset
ds = load_dataset("princeton-nlp/SWE-bench")

# 查看数据集页面描述或加载后 dataset 的结构
print(dataset)  # 打印数据集结构信息

# 访问第一条测试实例（假设数据集加载出来只有一个'test'集）
first_instance = dataset["test"][0]  # 索引访问
# 或者
first_instance = next(iter(dataset["test"])) # 迭代器访问

# 查看第一个实例的关键信息
print("Instance ID:", first_instance["instance_id"])
print("Repo:", first_instance["repo"])
print("Base Commit:", first_instance["base_commit"])
print("Problem Statement (first 200 chars):", first_instance["problem_statement"][:200] + "...")



# 假设 dataset 是包含所有 split 的 DatasetDict，且 'test' split 是我们关心的主要评估集
fail_to_pass_instances = dataset['test'].filter(lambda example: example['FAIL_TO_PASS'] is not None)
# 或者更常用的是：所有属于 `FAIL_TO_PASS` 类型的实例其实在字段上有标识，但通常在加载后类型已明确。
# 根据之前加载的 dataset 结构，可能需要：
# fail_to_pass_instances = [ex for ex in dataset['test'] if ex['FAIL_TO_PASS']]  # 或者类似条件


suspected_infinite_loop_instances = []
keywords = ["infinite loop", "endless loop", " hangs", "never return", "never terminates", "stuck in a loop", "freezes", "loop condition", "does not exit", "iteration indefinitely"]

for instance in fail_to_pass_instances:
    statement = instance["problem_statement"].lower()  # 转为小写方便比较
    for kw in keywords:
        if kw in statement:
            suspected_infinite_loop_instances.append(instance)
            break  # 找到一个关键词就跳出内层循环，避免重复添加

# LLM分析
'''
​
'''