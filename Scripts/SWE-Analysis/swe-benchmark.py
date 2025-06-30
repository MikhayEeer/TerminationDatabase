import os
import sys
import csv
import json
from typing import List, Dict, Any
from datasets import load_dataset

# 添加父目录到路径以便导入 chat_interface
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


# Login using e.g. `huggingface-cli login` to access this dataset
dataset = load_dataset("princeton-nlp/SWE-bench")

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
keywords = ["infinite loop", "endless loop", 
            " hangs", "never return", "never terminates", 
            "stuck in a loop", "freezes", 
            "loop condition", "does not exit", 
            "iteration indefinitely"]

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

from llm_exp_run_dir import chat_interface

class SWEBenchmarkAnalyzer:
    def __init__(self):
        self.interface = chat_interface()
        self.interface.set_up_open_router_configs()
        
        # 关键词列表，用于初步过滤
        self.termination_keywords = [
            "infinite loop", "endless loop", "hangs", "never return", 
            "never terminates", "stuck in a loop", "freezes", 
            "loop condition", "does not exit", "iteration indefinitely",
            "timeout", "blocks forever", "deadlock", "recursive call",
            "stack overflow", "memory leak", "busy wait"
        ]
    
    def analyze_termination_issue(self, problem_statement: str) -> Dict[str, Any]:
        """
        使用 LLM 分析问题陈述是否与程序非终止相关
        """
        role_prompt = """你是一位专业的软件工程师和程序分析专家。
你的任务是分析给定的软件问题描述，判断该问题是否与程序的非终止行为（如无限循环、死锁、递归爆栈等）相关。

请分析问题描述并给出判断，输出格式严格如下：
[TERMINATION_RELATED]
YES 或 NO

[CONFIDENCE]
HIGH 或 MEDIUM 或 LOW

[REASON]
简要说明你的判断理由（1-2句话）

[CATEGORY]
如果相关，请分类：INFINITE_LOOP, DEADLOCK, RECURSION, TIMEOUT, OTHER
如果不相关，输出：NOT_APPLICABLE

注意：
- 重点关注程序执行行为，而非编译错误或语法错误
- 考虑程序可能卡住、永不返回、消耗过多资源等情况
- 如果问题描述模糊，请根据最可能的情况判断"""

        try:
            answer = self.interface.ask_question_with_role_no_history_and_record(
                role_prompt, 
                f"请分析以下软件问题描述：\n\n{problem_statement}"
            )
            return self._parse_termination_analysis(answer.content)
        except Exception as e:
            return {
                "is_termination_related": False,
                "confidence": "LOW",
                "reason": f"LLM分析失败: {str(e)}",
                "category": "ERROR",
                "raw_response": str(e)
            }

    def _parse_termination_analysis(self, response: str) -> Dict[str, Any]:
        """
        解析 LLM 的分析结果
        """
        result = {
            "is_termination_related": False,
            "confidence": "LOW",
            "reason": "",
            "category": "NOT_APPLICABLE",
            "raw_response": response
        }
        
        lines = response.strip().split('\n')
        current_section = None
        
        for line in lines:
            line = line.strip()
            if '[TERMINATION_RELATED]' in line:
                current_section = 'related'
                continue
            elif '[CONFIDENCE]' in line:
                current_section = 'confidence'
                continue
            elif '[REASON]' in line:
                current_section = 'reason'
                continue
            elif '[CATEGORY]' in line:
                current_section = 'category'
                continue
            
            if current_section == 'related' and line:
                result["is_termination_related"] = line.upper() == 'YES'
            elif current_section == 'confidence' and line:
                result["confidence"] = line.upper()
            elif current_section == 'reason' and line:
                result["reason"] = line
            elif current_section == 'category' and line:
                result["category"] = line.upper()
        
        return result

    def keyword_filter(self, problem_statement: str) -> bool:
        """
        使用关键词进行初步过滤
        """
        statement_lower = problem_statement.lower()
        return any(keyword in statement_lower for keyword in self.termination_keywords)

    def analyze_dataset(self, output_dir: str = "SWE_Analysis_Results"):
        """
        分析整个 SWE-bench 数据集
        """
        print("开始加载 SWE-bench 数据集...")
        try:
            dataset = load_dataset("princeton-nlp/SWE-bench")
            print(f"数据集加载成功: {dataset}")
        except Exception as e:
            print(f"数据集加载失败: {e}")
            return

        # 创建输出目录
        os.makedirs(output_dir, exist_ok=True)
        
        # 分析测试集
        test_instances = dataset['test']
        print(f"测试集包含 {len(test_instances)} 个实例")

        # 第一步：关键词过滤
        print("正在进行关键词过滤...")
        keyword_filtered = []
        for instance in test_instances:
            if self.keyword_filter(instance["problem_statement"]):
                keyword_filtered.append(instance)
        
        print(f"关键词过滤后得到 {len(keyword_filtered)} 个疑似终止相关的实例")

        # 第二步：LLM 深度分析
        print("开始 LLM 深度分析...")
        results = []
        
        for i, instance in enumerate(keyword_filtered):
            print(f"正在分析实例 {i+1}/{len(keyword_filtered)}: {instance['instance_id']}")
            
            llm_result = self.analyze_termination_issue(instance["problem_statement"])
            result_record = {
                "instance_id": instance["instance_id"],
                "repo": instance["repo"],
                "base_commit": instance["base_commit"],
                "problem_statement": instance["problem_statement"],
                "keyword_filtered": True,
                **llm_result
            }
            results.append(result_record)
            
            # 每10个实例保存一次中间结果
            if (i + 1) % 10 == 0:
                self._save_intermediate_results(results, output_dir, i + 1)

        # 保存最终结果
        self._save_final_results(results, output_dir)
        self._generate_statistics(results, output_dir)

    def _save_intermediate_results(self, results: List[Dict], output_dir: str, count: int):
        """保存中间结果"""
        temp_file = os.path.join(output_dir, f"intermediate_results_{count}.json")
        with open(temp_file, 'w', encoding='utf-8') as f:
            json.dump(results, f, indent=2, ensure_ascii=False)

    def _save_final_results(self, results: List[Dict], output_dir: str):
        """保存最终结果"""
        # 保存为 JSON
        json_file = os.path.join(output_dir, "termination_analysis_results.json")
        with open(json_file, 'w', encoding='utf-8') as f:
            json.dump(results, f, indent=2, ensure_ascii=False)
        
        # 保存为 CSV
        csv_file = os.path.join(output_dir, "termination_analysis_results.csv")
        if results:
            fieldnames = results[0].keys()
            with open(csv_file, 'w', newline='', encoding='utf-8') as f:
                writer = csv.DictWriter(f, fieldnames=fieldnames)
                writer.writeheader()
                writer.writerows(results)
        
        print(f"结果已保存到: {json_file} 和 {csv_file}")

    def _generate_statistics(self, results: List[Dict], output_dir: str):
        """生成统计信息"""
        total_analyzed = len(results)
        termination_related = sum(1 for r in results if r["is_termination_related"])
        
        confidence_stats = {}
        category_stats = {}
        
        for result in results:
            conf = result["confidence"]
            cat = result["category"]
            
            confidence_stats[conf] = confidence_stats.get(conf, 0) + 1
            category_stats[cat] = category_stats.get(cat, 0) + 1
        
        stats = {
            "total_analyzed": total_analyzed,
            "termination_related": termination_related,
            "termination_percentage": round(termination_related / total_analyzed * 100, 2) if total_analyzed > 0 else 0,
            "confidence_distribution": confidence_stats,
            "category_distribution": category_stats
        }
        
        stats_file = os.path.join(output_dir, "analysis_statistics.json")
        with open(stats_file, 'w', encoding='utf-8') as f:
            json.dump(stats, f, indent=2, ensure_ascii=False)
        
        # 打印统计信息
        print("\n=== 分析统计 ===")
        print(f"总分析实例数: {total_analyzed}")
        print(f"终止相关实例数: {termination_related}")
        print(f"终止相关比例: {stats['termination_percentage']}%")
        print(f"置信度分布: {confidence_stats}")
        print(f"类别分布: {category_stats}")
        print(f"详细统计已保存到: {stats_file}")

def main():
    analyzer = SWEBenchmarkAnalyzer()
    analyzer.analyze_dataset()

if __name__ == "__main__":
    main()