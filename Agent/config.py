"""
Agent Configuration File
Defines system prompts and configuration parameters for each Agent
"""

#TODO: 在该文件配置system提示词

# Agent1 - Ranking Function Synthesis System Prompt
AGENT1_SYSTEM_PROMPT = """
You are an expert specialized in analyzing C programs and synthesizing ranking functions. Your tasks are:

1. Carefully analyze the structure of the given C program
2. Identify loop structures (for, while, do-while) and recursive function calls in the program
3. Synthesize appropriate ranking functions for the program
4. The ranking function should be an expression over program variables that strictly decreases in each loop iteration or recursive call
5. Ensure the ranking function has a lower bound (usually 0 or positive integers)

Analysis points:
- Identify loop variables and their change patterns
- Analyze loop conditions and termination conditions
- Consider cases of multiple nested loops
- For recursive functions, find the decreasing pattern of recursive parameters

Please return results strictly in the following format:
RANKING_FUNCTION: <your synthesized ranking function expression>
EXPLANATION: <detailed explanation of the ranking function, including why it decreases>
CONFIDENCE: <confidence level 1-10>
"""

# Agent2 - Ranking Function Validation System Prompt
AGENT2_SYSTEM_PROMPT = """
You are an expert specialized in validating the correctness of ranking functions. Your tasks are:

1. Analyze the given C program and corresponding ranking function
2. Verify if the ranking function strictly decreases in each loop iteration or recursive call of the program
3. Check if the ranking function has a reasonable lower bound (usually non-negative integers)
4. Verify if the ranking function correctly models the termination behavior of the program
5. Consider all possible execution paths and boundary conditions

Validation points:
- Check changes of the ranking function within loop bodies
- Verify consistency between loop conditions and the ranking function
- Analyze whether there are paths that make the ranking function non-decreasing
- Confirm if the lower bound of the ranking function is reasonable

Please return results strictly in the following format:
VALIDATION_RESULT: VALID/INVALID
REASON: <detailed reason and analysis process for the validation result>
ISSUES: <if invalid, list specific problems>
SUGGESTIONS: <if invalid, provide improvement suggestions>
"""

# Agent3 - Termination Analysis System Prompt
AGENT3_SYSTEM_PROMPT = """
You are an expert specialized in program termination analysis. Your tasks are:

1. Based on the given C program and validated ranking function, perform termination analysis
2. Analyze all possible execution paths of the program
3. Consider exceptional cases and boundary conditions
4. Provide final termination judgment

Analysis points:
- Judge termination based on validated ranking functions
- Consider all branches and paths of the program
- Analyze possible infinite loops or infinite recursion
- Check for deadlocks or other blocking situations

Termination judgment criteria:
- TERMINATE: Program terminates under all inputs
- NON_TERMINATE: There exist inputs that make the program non-terminating
- UNKNOWN: Cannot determine the termination of the program

Please return results strictly in the following format:
TERMINATION_RESULT: TERMINATE/NON_TERMINATE/UNKNOWN
ANALYSIS: <detailed termination analysis process>
PROOF_SKETCH: <brief description of termination proof>
COUNTEREXAMPLE: <if non-terminating, provide counterexample>
"""

# Configuration parameters
CONFIG = {
    "max_retries": 3,           # Maximum retry count
    "timeout_seconds": 60,      # Timeout duration (seconds)
    "log_level": "INFO",        # Log level
    "output_format": "detailed", # Output format: detailed/summary
    
    # Agent-specific configurations
    "agent1": {
        "max_ranking_functions": 3,  # Maximum number of ranking functions to generate
        "prefer_simple": True,        # Prefer simple ranking functions
    },
    
    "agent2": {
        "strict_validation": True,    # Strict validation mode
        "check_all_paths": True,      # Check all execution paths
    },
    
    "agent3": {
        "consider_edge_cases": True,  # Consider edge cases
        "require_proof": False,       # Whether detailed proof is required
    }
}

# Error message templates
ERROR_MESSAGES = {
    "file_not_found": "Could not find specified C program file: {path}",
    "invalid_c_syntax": "C program syntax error: {error}",
    "ranking_function_not_found": "Agent1 failed to generate valid ranking function",
    "validation_failed": "Agent2 failed to validate ranking function: {reason}",
    "analysis_error": "Agent3 error during analysis: {error}",
    "timeout_error": "Analysis timeout, please check program complexity",
    "ai_interface_error": "AI interface call failed: {error}"
}

# Success message templates
SUCCESS_MESSAGES = {
    "program_loaded": "Successfully loaded C program file: {path}",
    "ranking_function_generated": "Agent1 successfully generated ranking function: {function}",
    "validation_passed": "Agent2 validation passed",
    "analysis_completed": "Agent3 analysis completed, result: {result}"
}

# Logging format configuration
LOGGING_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {
            "format": "%(asctime)s [%(levelname)s] %(name)s: %(message)s"
        },
        "detailed": {
            "format": "%(asctime)s [%(levelname)s] %(name)s:%(lineno)d: %(message)s"
        }
    },
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "level": "INFO",
            "formatter": "standard",
            "stream": "ext://sys.stdout"
        },
        "file": {
            "class": "logging.FileHandler",
            "level": "DEBUG",
            "formatter": "detailed",
            "filename": "agent_analysis.log",
            "mode": "a"
        }
    },
    "loggers": {
        "": {
            "handlers": ["console", "file"],
            "level": "DEBUG",
            "propagate": False
        }
    }
}

# Supported C language features
SUPPORTED_C_FEATURES = {
    "loops": ["for", "while", "do-while"],
    "recursion": ["direct", "indirect"],
    "control_flow": ["if", "else", "switch", "goto"],
    "data_types": ["int", "float", "double", "char", "pointer", "array"],
    "functions": ["standard_library", "user_defined"]
}

# Common ranking function patterns
RANKING_FUNCTION_PATTERNS = {
    "simple_counter": "i",              # Simple counter
    "linear_decrease": "n - i",         # Linear decrease
    "nested_loop": "i + j",             # Nested loops
    "recursive_arg": "n",               # Recursive argument
    "array_index": "size - index",      # Array index
    "complex": "f(x, y, z)"             # Complex expression
}
