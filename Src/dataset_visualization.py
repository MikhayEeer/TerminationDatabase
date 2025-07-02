import os
import matplotlib.pyplot as plt
from pathlib import Path

# 获取SVComp_C目录结构
def get_svcomp_stats():
    svcomp_path = r"e:\Repo\TerminationDatabase\SVComp_C"
    categories = [d for d in os.listdir(svcomp_path) if os.path.isdir(os.path.join(svcomp_path, d))]
    file_counts = []
    for category in categories:
        category_path = os.path.join(svcomp_path, category)
        file_count = len([f for f in os.listdir(category_path) if os.path.isfile(os.path.join(category_path, f))])
        file_counts.append(file_count)
    return categories, file_counts

# 获取TPDB_Y2024目录结构
def get_tpdb_stats():
    tpdb_path = r"e:\Repo\TerminationDatabase\TPDB_Y2024_filtered_VBS"
    categories = [d for d in os.listdir(tpdb_path) if os.path.isdir(os.path.join(tpdb_path, d))]
    file_counts = []
    for category in categories:
        category_path = os.path.join(tpdb_path, category)
        file_count = len([f for f in os.listdir(category_path) if os.path.isfile(os.path.join(category_path, f))])
        file_counts.append(file_count)
    return categories, file_counts

# 绘制柱状图
def plot_stats(categories, file_counts, title):
    plt.figure(figsize=(12, 6))
    bars = plt.bar(categories, file_counts)
    plt.title(title)
    plt.xlabel('Categories')
    plt.ylabel('Number of Files')
    plt.xticks(rotation=90)
    plt.tight_layout()
    
    # 添加数值标签
    for bar in bars:
        height = bar.get_height()
        plt.text(bar.get_x() + bar.get_width()/2., height,
                 '%d' % int(height),
                 ha='center', va='bottom')
    
    plt.savefig(f"{title.replace(' ', '_')}.png", dpi=300)
    plt.close()

# 主函数
def main():
    # SVComp_C数据集统计
    svcomp_categories, svcomp_counts = get_svcomp_stats()
    plot_stats(svcomp_categories, svcomp_counts, 'SVComp_C Dataset Statistics')
    
    # TPDB_Y2024数据集统计
    tpdb_categories, tpdb_counts = get_tpdb_stats()
    plot_stats(tpdb_categories, tpdb_counts, 'TPDB_Y2024 Dataset Statistics')
    
    # 合并图表显示两个数据集的对比
    plt.figure(figsize=(12, 6))
    bar_width = 0.35
    index = range(len(svcomp_categories))
    
    # 只显示前10个类别的对比
    top_n = 10
    svcomp_top = svcomp_counts[:top_n]
    tpdb_top = tpdb_counts[:top_n]
    categories_top = svcomp_categories[:top_n]
    
    bars1 = plt.bar(index, svcomp_top, bar_width, label='SVComp_C')
    bars2 = plt.bar([i + bar_width for i in index], tpdb_top, bar_width, label='TPDB_Y2024')
    
    plt.title('Comparison of Top Categories between SVComp_C and TPDB_Y2024')
    plt.xlabel('Categories')
    plt.ylabel('Number of Files')
    plt.xticks([i + bar_width/2 for i in index], categories_top, rotation=90)
    plt.legend()
    plt.tight_layout()
    
    # 添加数值标签
    for bars in [bars1, bars2]:
        for bar in bars:
            height = bar.get_height()
            plt.text(bar.get_x() + bar.get_width()/2., height,
                     '%d' % int(height),
                     ha='center', va='bottom')
    
    plt.savefig('Dataset_Comparison.png', dpi=300)
    plt.close()

if __name__ == '__main__':
    main()