'''
默认直接绘制 现有工具结果csv的脚本；
可以直接运行，注意修改路径
'''
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import os

def plot_statistics(csv_path, output_dir):
    """
    Reads the CSV file, generates statistics and plots, and saves them to the output directory.

    Args:
        csv_path (str): The path to the input CSV file.
        output_dir (str): The directory where the plots will be saved.
    """
    # Create output directory if it doesn't exist
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Read the CSV file
    try:
        df = pd.read_csv(csv_path)
    except FileNotFoundError:
        print(f"Error: The file {csv_path} was not found.")
        return

    # Identify the tools from the columns
    tools = []
    for col in df.columns:
        if col.endswith('_result'):
            tools.append(col.replace('_result', ''))

    # --- Plot 1: Result Distribution for each tool ---
    print("Generating result distribution plots...")
    for tool in tools:
        result_col = f'{tool}_result'
        plt.figure(figsize=(10, 6))
        sns.countplot(x=result_col, data=df, order=df[result_col].value_counts().index)
        plt.title(f'Result Distribution for {tool}')
        plt.xlabel('Result')
        plt.ylabel('Count')
        plt.xticks(rotation=45)
        plt.tight_layout()
        plt.savefig(os.path.join(output_dir, f'{tool}_result_distribution.png'))
        plt.close()

    # --- Plot 2: Time Distribution for each tool (Box Plot) ---
    print("Generating time distribution box plots...")
    time_cols = [f'{tool}_time' for tool in tools]
    # Replace non-numeric time values with NaN
    for col in time_cols:
        df[col] = pd.to_numeric(df[col], errors='coerce')
    
    df_times = df[time_cols].dropna()
    
    plt.figure(figsize=(12, 8))
    sns.boxplot(data=df_times)
    plt.title('Time Distribution for All Tools')
    plt.ylabel('Time (seconds)')
    plt.xlabel('Tool')
    plt.xticks(rotation=45)
    plt.tight_layout()
    plt.savefig(os.path.join(output_dir, 'time_distribution_boxplot.png'))
    plt.close()

    # --- Plot 3: Scatter plot of 2ls_time vs irank_time ---
    if '2ls_time' in df.columns and 'irank_time' in df.columns:
        print("Generating scatter plot for 2ls vs irank time...")
        plt.figure(figsize=(10, 10))
        # Filter out large outliers for better visualization if necessary
        filtered_df = df[(df['2ls_time'] < 300) & (df['irank_time'] < 300)]
        sns.scatterplot(data=filtered_df, x='2ls_time', y='irank_time', alpha=0.5)
        plt.title('Execution Time: 2ls vs. iRankFinder')
        plt.xlabel('2ls Time (s)')
        plt.ylabel('iRankFinder Time (s)')
        plt.plot([0, 300], [0, 300], 'r--') # Add a reference line
        plt.axis('equal')
        plt.grid(True)
        plt.tight_layout()
        plt.savefig(os.path.join(output_dir, '2ls_vs_irank_time_scatter.png'))
        plt.close()

    print(f"Plots have been saved to {output_dir}")

if __name__ == '__main__':
    # Assuming the script is in Src/ and the data is in Results/
    csv_file_path = os.path.join(os.path.dirname(__file__), '..', 'Results', 'TPDB_Certain_Benchmarks_Correct.csv')
    plots_output_dir = os.path.join(os.path.dirname(__file__), '..', 'Results', 'Plots')
    
    plot_statistics(csv_file_path, plots_output_dir)
