"""
Agent框架实用工具
包含文件处理、结果导出、统计分析等辅助功能
"""

import os
import json
import csv
import logging
from datetime import datetime
from typing import Dict, List, Any, Optional
from dataclasses import asdict
import re

from agent_framework import ProgramAnalysis, AnalysisResult


class ResultExporter:
    """结果导出器"""
    
    @staticmethod
    def export_to_json(results: Dict[str, ProgramAnalysis], output_path: str):
        """导出结果到JSON文件"""
        export_data = {}
        for filename, analysis in results.items():
            export_data[filename] = {
                "program_path": analysis.program_path,
                "ranking_function": analysis.ranking_function,
                "is_ranking_valid": analysis.is_ranking_valid,
                "termination_result": analysis.termination_result.value,
                "analysis_log": analysis.analysis_log,
                "timestamp": datetime.now().isoformat()
            }
        
        with open(output_path, 'w', encoding='utf-8') as f:
            json.dump(export_data, f, indent=2, ensure_ascii=False)
        
        logging.info(f"结果已导出到JSON文件: {output_path}")
    
    @staticmethod
    def export_to_csv(results: Dict[str, ProgramAnalysis], output_path: str):
        """导出结果到CSV文件"""
        with open(output_path, 'w', newline='', encoding='utf-8') as f:
            writer = csv.writer(f)
            
            # 写入表头
            writer.writerow([
                'Filename', 'Program Path', 'Ranking Function', 
                'Is Ranking Valid', 'Termination Result', 'Analysis Status'
            ])
            
            # 写入数据
            for filename, analysis in results.items():
                writer.writerow([
                    filename,
                    analysis.program_path,
                    analysis.ranking_function or 'N/A',
                    'Yes' if analysis.is_ranking_valid else 'No',
                    analysis.termination_result.value,
                    'Success' if analysis.termination_result != AnalysisResult.ERROR else 'Error'
                ])
        
        logging.info(f"结果已导出到CSV文件: {output_path}")


class StatisticsAnalyzer:
    """统计分析器"""
    
    @staticmethod
    def calculate_statistics(results: Dict[str, ProgramAnalysis]) -> Dict[str, Any]:
        """计算分析结果的统计信息"""
        stats = {
            "total_programs": len(results),
            "termination_counts": {
                AnalysisResult.TERMINATE.value: 0,
                AnalysisResult.NON_TERMINATE.value: 0,
                AnalysisResult.UNKNOWN.value: 0,
                AnalysisResult.ERROR.value: 0
            },
            "ranking_function_stats": {
                "generated": 0,
                "valid": 0,
                "invalid": 0
            },
            "success_rate": 0.0,
            "accuracy_metrics": {}
        }
        
        for analysis in results.values():
            # 统计终止性结果
            stats["termination_counts"][analysis.termination_result.value] += 1
            
            # 统计秩函数生成情况
            if analysis.ranking_function:
                stats["ranking_function_stats"]["generated"] += 1
                if analysis.is_ranking_valid:
                    stats["ranking_function_stats"]["valid"] += 1
                else:
                    stats["ranking_function_stats"]["invalid"] += 1
        
        # 计算成功率（非ERROR的比例）
        non_error_count = (stats["total_programs"] - 
                          stats["termination_counts"][AnalysisResult.ERROR.value])
        stats["success_rate"] = (non_error_count / stats["total_programs"] 
                                if stats["total_programs"] > 0 else 0.0)
        
        return stats
    
    @staticmethod
    def print_statistics(stats: Dict[str, Any]):
        """打印统计信息"""
        print("\n" + "="*50)
        print("分析结果统计")
        print("="*50)
        
        print(f"总程序数: {stats['total_programs']}")
        print(f"分析成功率: {stats['success_rate']:.2%}")
        
        print(f"\n终止性分析结果:")
        for result, count in stats["termination_counts"].items():
            percentage = (count / stats["total_programs"] * 100 
                         if stats["total_programs"] > 0 else 0)
            print(f"  {result}: {count} ({percentage:.1f}%)")
        
        print(f"\n秩函数生成统计:")
        rf_stats = stats["ranking_function_stats"]
        print(f"  生成成功: {rf_stats['generated']}")
        print(f"  验证通过: {rf_stats['valid']}")
        print(f"  验证失败: {rf_stats['invalid']}")
        
        if rf_stats['generated'] > 0:
            valid_rate = rf_stats['valid'] / rf_stats['generated']
            print(f"  验证通过率: {valid_rate:.2%}")


class ProgramAnalyzer:
    """程序分析器 - 提供C程序的基本分析功能"""
    
    @staticmethod
    def extract_loops(program_content: str) -> List[Dict[str, Any]]:
        """提取程序中的循环结构"""
        loops = []
        
        # 匹配for循环
        for_pattern = r'for\s*\([^)]*\)\s*\{'
        for_matches = re.finditer(for_pattern, program_content, re.IGNORECASE)
        for match in for_matches:
            loops.append({
                "type": "for",
                "start": match.start(),
                "text": match.group()
            })
        
        # 匹配while循环
        while_pattern = r'while\s*\([^)]*\)\s*\{'
        while_matches = re.finditer(while_pattern, program_content, re.IGNORECASE)
        for match in while_matches:
            loops.append({
                "type": "while", 
                "start": match.start(),
                "text": match.group()
            })
        
        # 匹配do-while循环
        do_while_pattern = r'do\s*\{.*?\}\s*while\s*\([^)]*\)'
        do_while_matches = re.finditer(do_while_pattern, program_content, 
                                      re.IGNORECASE | re.DOTALL)
        for match in do_while_matches:
            loops.append({
                "type": "do-while",
                "start": match.start(), 
                "text": match.group()
            })
        
        return sorted(loops, key=lambda x: x["start"])
    
    @staticmethod
    def extract_functions(program_content: str) -> List[Dict[str, Any]]:
        """提取程序中的函数定义"""
        functions = []
        
        # 匹配函数定义
        func_pattern = r'(\w+\s+)+(\w+)\s*\([^)]*\)\s*\{'
        matches = re.finditer(func_pattern, program_content, re.MULTILINE)
        
        for match in matches:
            func_text = match.group()
            func_name = match.group(2)
            functions.append({
                "name": func_name,
                "start": match.start(),
                "text": func_text,
                "is_recursive": ProgramAnalyzer._is_recursive_function(
                    program_content, func_name, match.start()
                )
            })
        
        return functions
    
    @staticmethod
    def _is_recursive_function(program_content: str, func_name: str, 
                              func_start: int) -> bool:
        """检查函数是否是递归函数"""
        # 找到函数体的结束位置（简化实现）
        brace_count = 0
        func_end = func_start
        
        for i, char in enumerate(program_content[func_start:]):
            if char == '{':
                brace_count += 1
            elif char == '}':
                brace_count -= 1
                if brace_count == 0:
                    func_end = func_start + i
                    break
        
        func_body = program_content[func_start:func_end]
        
        # 检查函数体中是否包含对自身的调用
        call_pattern = rf'\b{func_name}\s*\('
        return bool(re.search(call_pattern, func_body))
    
    @staticmethod
    def estimate_complexity(program_content: str) -> str:
        """估算程序复杂度"""
        loops = ProgramAnalyzer.extract_loops(program_content)
        functions = ProgramAnalyzer.extract_functions(program_content)
        
        loop_count = len(loops)
        recursive_count = sum(1 for f in functions if f["is_recursive"])
        line_count = len(program_content.split('\n'))
        
        if recursive_count > 0:
            return "HIGH"  # 包含递归
        elif loop_count > 2:
            return "HIGH"  # 多个循环
        elif loop_count > 0:
            return "MEDIUM"  # 包含循环
        elif line_count > 50:
            return "MEDIUM"  # 较长程序
        else:
            return "LOW"   # 简单程序


class FileManager:
    """文件管理器"""
    
    @staticmethod
    def find_c_files(directory: str, recursive: bool = True) -> List[str]:
        """查找目录下的所有C文件"""
        c_files = []
        
        if recursive:
            for root, dirs, files in os.walk(directory):
                for file in files:
                    if file.endswith(('.c', '.C')):
                        c_files.append(os.path.join(root, file))
        else:
            for file in os.listdir(directory):
                if file.endswith(('.c', '.C')):
                    c_files.append(os.path.join(directory, file))
        
        return sorted(c_files)
    
    @staticmethod
    def validate_c_file(file_path: str) -> bool:
        """验证C文件是否有效"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            
            # 基本语法检查
            if not content.strip():
                return False
            
            # 检查是否包含基本的C语言结构
            c_keywords = ['int', 'char', 'float', 'double', 'void', 
                         'if', 'else', 'for', 'while', 'return']
            has_c_syntax = any(keyword in content for keyword in c_keywords)
            
            return has_c_syntax
            
        except Exception:
            return False
    
    @staticmethod
    def create_backup(file_path: str) -> str:
        """创建文件备份"""
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        backup_path = f"{file_path}.backup_{timestamp}"
        
        try:
            with open(file_path, 'r', encoding='utf-8') as source:
                with open(backup_path, 'w', encoding='utf-8') as backup:
                    backup.write(source.read())
            return backup_path
        except Exception as e:
            logging.error(f"创建备份失败: {e}")
            return ""


class ReportGenerator:
    """报告生成器"""
    
    @staticmethod
    def generate_html_report(results: Dict[str, ProgramAnalysis], 
                           output_path: str):
        """生成HTML格式的分析报告"""
        html_template = """
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent协作框架分析报告</title>
    <style>
        body {{ font-family: Arial, sans-serif; margin: 20px; }}
        .header {{ background-color: #f4f4f4; padding: 20px; border-radius: 5px; }}
        .stats {{ margin: 20px 0; }}
        .result {{ border: 1px solid #ddd; margin: 10px 0; padding: 15px; border-radius: 5px; }}
        .terminate {{ background-color: #d4edda; }}
        .non-terminate {{ background-color: #f8d7da; }}
        .unknown {{ background-color: #fff3cd; }}
        .error {{ background-color: #f5f5f5; }}
        .ranking-function {{ font-family: monospace; background-color: #f8f9fa; padding: 5px; }}
    </style>
</head>
<body>
    <div class="header">
        <h1>Agent协作框架分析报告</h1>
        <p>生成时间: {timestamp}</p>
        <p>分析程序数: {total_count}</p>
    </div>
    
    <div class="stats">
        <h2>统计摘要</h2>
        {stats_html}
    </div>
    
    <div class="results">
        <h2>详细结果</h2>
        {results_html}
    </div>
</body>
</html>
"""
        
        # 生成统计信息HTML
        stats = StatisticsAnalyzer.calculate_statistics(results)
        stats_html = f"""
        <p>终止程序: {stats['termination_counts']['TERMINATE']}</p>
        <p>非终止程序: {stats['termination_counts']['NON_TERMINATE']}</p>
        <p>未知程序: {stats['termination_counts']['UNKNOWN']}</p>
        <p>错误程序: {stats['termination_counts']['ERROR']}</p>
        <p>成功率: {stats['success_rate']:.2%}</p>
        """
        
        # 生成结果详情HTML
        results_html = ""
        for filename, analysis in results.items():
            css_class = analysis.termination_result.value.lower().replace('_', '-')
            results_html += f"""
            <div class="result {css_class}">
                <h3>{filename}</h3>
                <p><strong>路径:</strong> {analysis.program_path}</p>
                <p><strong>秩函数:</strong> 
                   <span class="ranking-function">{analysis.ranking_function or 'N/A'}</span></p>
                <p><strong>验证结果:</strong> {'通过' if analysis.is_ranking_valid else '失败'}</p>
                <p><strong>终止性:</strong> {analysis.termination_result.value}</p>
                <p><strong>分析日志:</strong></p>
                <ul>
                {''.join(f'<li>{log}</li>' for log in analysis.analysis_log)}
                </ul>
            </div>
            """
        
        # 填充模板
        html_content = html_template.format(
            timestamp=datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            total_count=len(results),
            stats_html=stats_html,
            results_html=results_html
        )
        
        # 写入文件
        with open(output_path, 'w', encoding='utf-8') as f:
            f.write(html_content)
        
        logging.info(f"HTML报告已生成: {output_path}")


def main():
    """演示工具功能"""
    print("Agent框架实用工具演示")
    
    # 示例：分析程序结构
    sample_program = """
int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n - 1);
}

int main() {
    int i = 10;
    while (i > 0) {
        printf("%d\\n", i);
        i--;
    }
    return 0;
}
"""
    
    print("示例程序:")
    print(sample_program)
    
    print("\n循环结构:")
    loops = ProgramAnalyzer.extract_loops(sample_program)
    for loop in loops:
        print(f"  {loop['type']}: {loop['text']}")
    
    print("\n函数结构:")
    functions = ProgramAnalyzer.extract_functions(sample_program)
    for func in functions:
        print(f"  {func['name']}: 递归={func['is_recursive']}")
    
    print(f"\n复杂度估算: {ProgramAnalyzer.estimate_complexity(sample_program)}")


if __name__ == "__main__":
    main()
