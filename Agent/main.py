"""
Agent Collaboration Framework Main Entry File
Provides command-line interface and batch processing functionality
"""

import sys
import os
import argparse
import logging
from pathlib import Path

sys.path.append(os.path.dirname(os.path.abspath(__file__)))

from agent_framework import AgentCoordinator, AnalysisResult
from utils import (
    ResultExporter, 
    StatisticsAnalyzer, 
    FileManager, 
    ReportGenerator,
    ProgramAnalyzer
)
from config import CONFIG, LOGGING_CONFIG


def setup_logging():
    """set log file settings"""
    logging.basicConfig(
        level=getattr(logging, CONFIG['log_level']),
        format='%(asctime)s - %(levelname)s - %(message)s'
    )


def analyze_single_file(file_path: str, output_dir: str = None):
    """analyze a single C program file"""
    print(f"Start to analyze : {file_path}")
    
    if not os.path.exists(file_path):
        print(f"Error: Can not find file - {file_path}")
        return
    if not FileManager.validate_c_file(file_path):
        print(f"Error: Invalid C program file - {file_path}")
        return
    
    coordinator = AgentCoordinator()
    try:
        analysis = coordinator.analyze_program(file_path)
        coordinator.print_analysis_summary(analysis)
        
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
            
            results = {os.path.basename(file_path): analysis}
            json_path = os.path.join(output_dir, f"{Path(file_path).stem}_result.json")
            ResultExporter.export_to_json(results, json_path)
            
            html_path = os.path.join(output_dir, f"{Path(file_path).stem}_report.html")
            ReportGenerator.generate_html_report(results, html_path)
            
            print(f"Results have been saved to: {output_dir}")
        
    except Exception as e:
        print(f"Error occurred while analysing: {e}")


def analyze_directory(directory: str, output_dir: str = None, recursive: bool = True):
    """Analyze all C program files in directory"""
    print(f"Start batch analysis for directory: {directory}")
    
    if not os.path.exists(directory):
        print(f"Error: Directory does not exist - {directory}")
        return
    
    # Find C files
    c_files = FileManager.find_c_files(directory, recursive)
    if not c_files:
        print("No C program files found")
        return
    
    print(f"Found {len(c_files)} C program files")
    
    coordinator = AgentCoordinator()
    
    try:
        results = coordinator.batch_analyze(directory)
        
        # Print statistics
        stats = StatisticsAnalyzer.calculate_statistics(results)
        StatisticsAnalyzer.print_statistics(stats)
        
        # Save results
        if output_dir:
            os.makedirs(output_dir, exist_ok=True)
            
            # Save as JSON and CSV
            json_path = os.path.join(output_dir, "batch_results.json")
            csv_path = os.path.join(output_dir, "batch_results.csv")
            html_path = os.path.join(output_dir, "batch_report.html")
            
            ResultExporter.export_to_json(results, json_path)
            ResultExporter.export_to_csv(results, csv_path)
            ReportGenerator.generate_html_report(results, html_path)
            
            print(f"Batch analysis results saved to: {output_dir}")
        
    except Exception as e:
        print(f"Error occurred during batch analysis: {e}")


def analyze_program_structure(file_path: str):
    """Analyze program structure (without Agent analysis)"""
    print(f"Analyzing program structure: {file_path}")
    
    if not os.path.exists(file_path):
        print(f"Error: File does not exist - {file_path}")
        return
    
    try:
        with open(file_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        print(f"File size: {len(content)} characters")
        print(f"Lines: {len(content.split('\\n'))}")
        
        # Analyze loop structures
        loops = ProgramAnalyzer.extract_loops(content)
        print(f"\\nLoop structures ({len(loops)} found):")
        for i, loop in enumerate(loops, 1):
            print(f"  {i}. {loop['type']}: {loop['text'][:50]}...")
        
        # Analyze function structures
        functions = ProgramAnalyzer.extract_functions(content)
        print(f"\\nFunction structures ({len(functions)} found):")
        for i, func in enumerate(functions, 1):
            recursive_text = " (recursive)" if func['is_recursive'] else ""
            print(f"  {i}. {func['name']}{recursive_text}")
        
        # Complexity estimation
        complexity = ProgramAnalyzer.estimate_complexity(content)
        print(f"\\nComplexity estimation: {complexity}")
        
    except Exception as e:
        print(f"Error occurred while analyzing program structure: {e}")


def interactive_mode():
    """Interactive mode"""
    print("Welcome to Agent Collaboration Framework Interactive Mode")
    print("Type 'help' to view available commands")
    
    coordinator = AgentCoordinator()
    
    while True:
        try:
            command = input("\\n> ").strip().split()
            
            if not command:
                continue
            
            cmd = command[0].lower()
            
            if cmd == 'help':
                print("Available commands:")
                print("  analyze <file_path>     - Analyze single file")
                print("  batch <directory>       - Batch analyze directory")
                print("  structure <file_path>   - Analyze program structure")
                print("  exit                    - Exit program")
                
            elif cmd == 'analyze' and len(command) > 1:
                analyze_single_file(command[1])
                
            elif cmd == 'batch' and len(command) > 1:
                analyze_directory(command[1])
                
            elif cmd == 'structure' and len(command) > 1:
                analyze_program_structure(command[1])
                
            elif cmd == 'exit':
                print("Exiting interactive mode")
                break
                
            else:
                print("Invalid command, type 'help' for assistance")
                
        except KeyboardInterrupt:
            print("\\nExiting interactive mode")
            break
        except Exception as e:
            print(f"Error occurred while executing command: {e}")


def main():
    """Main function"""
    parser = argparse.ArgumentParser(
        description="Agent Collaboration Framework - C Program Termination Analysis Tool"
    )
    
    subparsers = parser.add_subparsers(dest='command', help='Available commands')
    
    # Single file analysis command
    parser_single = subparsers.add_parser('analyze', help='Analyze single C program file')
    parser_single.add_argument('file', help='C program file path')
    parser_single.add_argument('-o', '--output', help='Output directory')
    
    # Batch analysis command
    parser_batch = subparsers.add_parser('batch', help='Batch analyze C program files')
    parser_batch.add_argument('directory', help='Directory containing C programs')
    parser_batch.add_argument('-o', '--output', help='Output directory')
    parser_batch.add_argument('--no-recursive', action='store_true', 
                             help='Do not recursively search subdirectories')
    
    # Structure analysis command
    parser_structure = subparsers.add_parser('structure', help='Analyze program structure')
    parser_structure.add_argument('file', help='C program file path')
    
    # Interactive mode command
    subparsers.add_parser('interactive', help='Enter interactive mode')
    
    # Parse arguments
    args = parser.parse_args()
    
    # Setup logging
    setup_logging()
    
    # Execute corresponding operation based on command
    if args.command == 'analyze':
        analyze_single_file(args.file, args.output)
        
    elif args.command == 'batch':
        analyze_directory(args.directory, args.output, not args.no_recursive)
        
    elif args.command == 'structure':
        analyze_program_structure(args.file)
        
    elif args.command == 'interactive':
        interactive_mode()
        
    else:
        parser.print_help()


if __name__ == "__main__":
    main()
