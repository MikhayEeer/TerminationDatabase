'''
This script provides a CSV merger class that can merge two CSV files based on a common column.
It supports flexible configuration of files, join columns, target columns, and column renaming.
'''
import pandas as pd
import os
from typing import Dict, List, Optional

class CSVMerger:
    """
    CSV文件合并器类
    支持灵活的左连接操作
    """
    
    def __init__(self, workspace: str = None):
        """
        初始化CSV合并器
        
        Args:
            workspace: 工作目录路径，默认为当前脚本所在目录
        """
        self.workspace = workspace or os.path.dirname(os.path.abspath(__file__))
        
    def merge_files(self, 
                   left_file: str,
                   right_file: str,
                   output_file: str,
                   join_column: str = 'file',
                   target_columns: List[str] = None,
                   column_rename: Dict[str, str] = None,
                   join_type: str = 'left') -> pd.DataFrame:
        """
        合并两个CSV文件
        
        Args:
            left_file: 左侧文件名（基准文件）
            right_file: 右侧文件名（数据源文件）
            output_file: 输出文件名
            join_column: 连接列名
            target_columns: 需要从右侧文件获取的列名列表，None表示获取所有列
            column_rename: 列重命名字典 {原列名: 新列名}
            join_type: 连接类型 ('left', 'right', 'inner', 'outer')
            
        Returns:
            合并后的DataFrame
        """
        left_path = os.path.join(self.workspace, left_file)
        right_path = os.path.join(self.workspace, right_file)
        output_path = os.path.join(self.workspace, output_file)
        
        print(f"Reading {left_path}")
        left_df = pd.read_csv(left_path)
        print(f"Reading {right_path}")
        right_df = pd.read_csv(right_path)
        
        processed_right_df = self._process_right_dataframe(
            right_df, join_column, target_columns, column_rename
        )
        
        print(f"Performing {join_type} join operation...")
        merged_df = pd.merge(left_df, processed_right_df, on=join_column, how=join_type)
        
        print(f"Saving results to {output_path}")
        merged_df.to_csv(output_path, index=False)
        
        print("Done.")
        return merged_df
    
    def _process_right_dataframe(self, 
                                right_df: pd.DataFrame,
                                join_column: str,
                                target_columns: List[str] = None,
                                column_rename: Dict[str, str] = None) -> pd.DataFrame:
        """
        处理右侧DataFrame：选择列和重命名
        
        Args:
            right_df: 右侧DataFrame
            join_column: 连接列名
            target_columns: 目标列名列表
            column_rename: 列重命名字典
            
        Returns:
            处理后的DataFrame
        """
        if target_columns is None:
            columns_to_keep = right_df.columns.tolist()
        else:
            columns_to_keep = [join_column] + [col for col in target_columns if col != join_column]
            missing_columns = [col for col in columns_to_keep if col not in right_df.columns]
            if missing_columns:
                raise ValueError(f"Columns not found in right dataframe: {missing_columns}")

        processed_df = right_df[columns_to_keep].copy()

        if column_rename:
            processed_df.rename(columns=column_rename, inplace=True)
        
        return processed_df
def main():
    """主函数，提供原有功能的向后兼容"""
    merger = CSVMerger("d:\\Users\\Danzel\\Desktop\\TempCSV")
    
    '''Eg
    merger.merge_files(
        left_file='benchmark.csv',
        right_file='irank.csv',
        output_file='benchmark_updated.csv',
        join_column='file',
        target_columns=['result', 'execution_time'],
        column_rename={'result': 'irank_result', 'execution_time': 'irank_time'}
    )
    '''
    merger.merge_files(
        left_file='benchmark.csv',
        right_file='CPA_TPDB_Certain_lasso+general_cp2.csv',
        output_file='benchmark_updated.csv',
        join_column='file',
        target_columns=['result_lasso', 'cost_time_lasso', 'result_general', 'cost_time_general'],
        column_rename={'result_lasso': 'CPA-lasso_result',
                       'cost_time_lasso': 'CPA-lasso_time',
                        'result_general': 'CPA-general_result',
                        'cost_time_general': 'CPA-general_time'
    })

if __name__ == "__main__":
    main()
