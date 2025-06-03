"""
Agent Collaboration Framework - For C Program Termination Analysis
Contains collaboration process of three agents:
1. Agent1: Program analysis and ranking function synthesis
2. Agent2: Ranking function validation
3. Agent3: Termination analysis
"""

import os
import logging
from typing import Dict, Any, Optional, Tuple
from dataclasses import dataclass
from enum import Enum

# Assume chat_interface is in the same directory or importable location
from ..Scripts.llm_naive_run_dir import chat_interface as ChatInterface
import config as CFG

class AnalysisResult(Enum):
    """Analysis result enumeration"""
    TERMINATE = "TERMINATE"
    NON_TERMINATE = "NON_TERMINATE" 
    UNKNOWN = "UNKNOWN"
    ERROR = "ERROR"


@dataclass
class ProgramAnalysis:
    """Program analysis result data structure"""
    program_path: str
    program_content: str
    ranking_function: Optional[str] = None
    is_ranking_valid: bool = False
    termination_result: AnalysisResult = AnalysisResult.UNKNOWN
    analysis_log: list = None
    
    def __post_init__(self):
        if self.analysis_log is None:
            self.analysis_log = []


class Agent1_RankingFunctionSynthesis:
    """Agent1: Program analysis and ranking function synthesis"""
    
    def __init__(self):
        #TODO: 类似这样的位置，是我们的chat_interface，是llm_naive_run_dir.py中的
        #TODO：需要设置system 和 输入program
        self.chat_interface = ChatInterface()
        self.system_prompt = CFG.AGENT1_SYSTEM_PROMPT
        self.chat_interface.setup_system(self.system_prompt)
    
    def analyze_program(self, program_content: str) -> str:
        """Analyze program and synthesize ranking function"""
        try:
            response = self.chat_interface.ask_question(program_content)
            return response
        except Exception as e:
            logging.error(f"Agent1 error while analyzing program: {e}")
            return f"ERROR: {str(e)}"
    
    def extract_ranking_function(self, response: str) -> Optional[str]:
        """Extract ranking function from response"""
        try:
            lines = response.split('\n')
            for line in lines:
                if line.strip().startswith('RANKING_FUNCTION:'):
                    return line.split(':', 1)[1].strip()
            return None
        except Exception as e:
            logging.error(f"Error extracting ranking function: {e}")
            return None


class Agent2_RankingFunctionValidation:
    """Agent2: Ranking function validation"""
    
    def __init__(self):
        self.chat_interface = ChatInterface()
        self.system_prompt = CFG.AGENT2_SYSTEM_PROMPT
        self.chat_interface.setup_system(self.system_prompt)
    
    def validate_ranking_function(self, program_content: str, ranking_function: str) -> str:
        """Validate if ranking function matches the program"""
        try:
            query = f"""
Program content:
{program_content}

Ranking function:
{ranking_function}

Please validate if this ranking function is correct.
"""
            response = self.chat_interface.ask_question(query)
            return response
        except Exception as e:
            logging.error(f"Agent2 error while validating ranking function: {e}")
            return f"ERROR: {str(e)}"
    
    def extract_validation_result(self, response: str) -> bool:
        """Extract validation result from response"""
        try:
            lines = response.split('\n')
            for line in lines:
                if line.strip().startswith('VALIDATION_RESULT:'):
                    result = line.split(':', 1)[1].strip().upper()
                    return result == "VALID"
            return False
        except Exception as e:
            logging.error(f"Error extracting validation result: {e}")
            return False


class Agent3_TerminationAnalysis:
    """Agent3: Termination analysis"""
    
    def __init__(self):
        self.chat_interface = ChatInterface()
        self.system_prompt = CFG.AGENT3_SYSTEM_PROMPT
        self.chat_interface.setup_system(self.system_prompt)
    
    def analyze_termination(self, program_content: str, ranking_function: str) -> str:
        """Analyze program termination based on ranking function"""
        try:
            query = f"""
Program content:
{program_content}

Validated ranking function:
{ranking_function}

Please analyze the termination of the program based on this ranking function.
"""
            response = self.chat_interface.ask_question(query)
            return response
        except Exception as e:
            logging.error(f"Agent3 error while analyzing termination: {e}")
            return f"ERROR: {str(e)}"
    
    def extract_termination_result(self, response: str) -> AnalysisResult:
        """Extract termination result from response"""
        try:
            lines = response.split('\n')
            for line in lines:
                if line.strip().startswith('TERMINATION_RESULT:'):
                    result = line.split(':', 1)[1].strip().upper()
                    if result == "TERMINATE":
                        return AnalysisResult.TERMINATE
                    elif result == "NON_TERMINATE":
                        return AnalysisResult.NON_TERMINATE
                    else:
                        return AnalysisResult.UNKNOWN
            return AnalysisResult.UNKNOWN
        except Exception as e:
            logging.error(f"Error extracting termination result: {e}")
            return AnalysisResult.ERROR


class AgentCoordinator:
    """Agent Coordinator - Manages collaboration process of three agents"""
    
    def __init__(self):
        self.agent1 = Agent1_RankingFunctionSynthesis()
        self.agent2 = Agent2_RankingFunctionValidation()
        self.agent3 = Agent3_TerminationAnalysis()
        
        # Setup logging
        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s'
        )
        self.logger = logging.getLogger(__name__)
    
    def read_c_program(self, file_path: str) -> str:
        """Read C program file"""
        try:
            with open(file_path, 'r', encoding='utf-8') as f:
                content = f.read()
            self.logger.info(f"Successfully read program file: {file_path}")
            return content
        except Exception as e:
            self.logger.error(f"Failed to read program file: {e}")
            raise
    
    def analyze_program(self, program_path: str) -> ProgramAnalysis:
        """Complete program analysis workflow"""
        self.logger.info(f"Starting to analyze program: {program_path}")
        
        # Initialize analysis result
        analysis = ProgramAnalysis(
            program_path=program_path,
            program_content=""
        )
        
        try:
            # Step 1: Read C program file
            analysis.program_content = self.read_c_program(program_path)
            analysis.analysis_log.append("✓ Successfully read program file")
            
            # Step 2: Agent1 analyzes program and synthesizes ranking function
            self.logger.info("Agent1 starting program analysis...")
            agent1_response = self.agent1.analyze_program(analysis.program_content)
            analysis.ranking_function = self.agent1.extract_ranking_function(agent1_response)
            
            if analysis.ranking_function is None:
                analysis.analysis_log.append("✗ Agent1 failed to synthesize valid ranking function")
                analysis.termination_result = AnalysisResult.ERROR
                return analysis
            
            analysis.analysis_log.append(f"✓ Agent1 synthesized ranking function: {analysis.ranking_function}")
            
            # Step 3: Agent2 validates ranking function
            self.logger.info("Agent2 starting ranking function validation...")
            agent2_response = self.agent2.validate_ranking_function(
                analysis.program_content, 
                analysis.ranking_function
            )
            analysis.is_ranking_valid = self.agent2.extract_validation_result(agent2_response)
            
            if not analysis.is_ranking_valid:
                analysis.analysis_log.append("✗ Agent2 validated ranking function as invalid")
                analysis.termination_result = AnalysisResult.UNKNOWN
                return analysis
            
            analysis.analysis_log.append("✓ Agent2 validated ranking function as valid")
            
            # Step 4: Agent3 analyzes termination based on ranking function
            self.logger.info("Agent3 starting termination analysis...")
            agent3_response = self.agent3.analyze_termination(
                analysis.program_content,
                analysis.ranking_function
            )
            analysis.termination_result = self.agent3.extract_termination_result(agent3_response)
            analysis.analysis_log.append(f"✓ Agent3 completed termination analysis: {analysis.termination_result.value}")
            
            self.logger.info(f"Program analysis completed, result: {analysis.termination_result.value}")
            
        except Exception as e:
            self.logger.error(f"Error during program analysis: {e}")
            analysis.termination_result = AnalysisResult.ERROR
            analysis.analysis_log.append(f"✗ Analysis error: {str(e)}")
        
        return analysis
    
    def batch_analyze(self, program_directory: str) -> Dict[str, ProgramAnalysis]:
        """Batch analyze all C programs in directory"""
        results = {}
        
        try:
            c_files = [f for f in os.listdir(program_directory) if f.endswith('.c')]
            self.logger.info(f"Found {len(c_files)} C program files")
            
            for filename in c_files:
                file_path = os.path.join(program_directory, filename)
                self.logger.info(f"Analyzing file: {filename}")
                
                try:
                    analysis = self.analyze_program(file_path)
                    results[filename] = analysis
                except Exception as e:
                    self.logger.error(f"Error analyzing file {filename}: {e}")
                    results[filename] = ProgramAnalysis(
                        program_path=file_path,
                        program_content="",
                        termination_result=AnalysisResult.ERROR
                    )
        
        except Exception as e:
            self.logger.error(f"Error during batch analysis: {e}")
        
        return results
    
    def print_analysis_summary(self, analysis: ProgramAnalysis):
        """Print analysis result summary"""
        print(f"\n{'='*60}")
        print(f"Program Analysis Result: {os.path.basename(analysis.program_path)}")
        print(f"{'='*60}")
        print(f"Ranking Function: {analysis.ranking_function or 'Not generated'}")
        print(f"Ranking Function Validity: {'Valid' if analysis.is_ranking_valid else 'Invalid'}")
        print(f"Termination Result: {analysis.termination_result.value}")
        print(f"\nAnalysis Log:")
        for log_entry in analysis.analysis_log:
            print(f"  {log_entry}")
        print(f"{'='*60}\n")


def main():
    """Main function - Demonstrates usage of Agent collaboration framework"""
    coordinator = AgentCoordinator()
    
    # Example: Analyze single program
    # program_path = "path/to/your/program.c"
    # analysis = coordinator.analyze_program(program_path)
    # coordinator.print_analysis_summary(analysis)
    
    # Example: Batch analysis
    # results = coordinator.batch_analyze("path/to/programs/directory")
    # for filename, analysis in results.items():
    #     coordinator.print_analysis_summary(analysis)
    
    print("Agent collaboration framework initialized successfully")
    print("Usage:")
    print("1. coordinator = AgentCoordinator()")
    print("2. analysis = coordinator.analyze_program('program.c')")
    print("3. coordinator.print_analysis_summary(analysis)")


if __name__ == "__main__":
    main()
