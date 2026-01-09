import os

def load_api_key():
    """从本地文件读取API密钥"""
    key_file_paths = [
        os.path.join(os.getcwd(), '.secrete_api_key'),  # 工作目录下
        os.path.join(os.path.dirname(__file__), '.secrete_api_key'),  # 脚本同目录下
        os.path.join(os.path.expanduser('~'), '.llm_api_key'),   # 用户主目录
    ]
    
    for key_file in key_file_paths:
        if os.path.exists(key_file):
            try:
                with open(key_file, 'r', encoding='utf-8') as f:
                    return f.read().strip()
            except Exception as e:
                print(f"Warning: 无法读取密钥文件 {key_file}: {e}")
                continue
    
    api_key = os.getenv('LLM_API_KEY')
    if api_key:
        return api_key
    
    raise FileNotFoundError(
        "未找到API密钥。请创建以下任一文件：\n"
        f"1. {key_file_paths[0]}\n"
        f"2. {key_file_paths[1]}\n"
        f"3. {key_file_paths[2]}\n"
        "或设置环境变量 LLM_API_KEY"
    )

def remove_comments(code: str) -> str:
    """
    Remove all C-style comments (single-line // and multi-line /* */) from the given C code string,
    preserving string and character literals.
    """
    result = []
    i = 0
    n = len(code)
    in_single = False
    in_multi = False
    in_string = False
    in_char = False
    while i < n:
        ch = code[i]
        # Check for end of single-line comment
        if in_single:
            if ch == '\n':
                in_single = False
                result.append(ch)
            i += 1
            continue
        # Check for end of multi-line comment
        if in_multi:
            if ch == '*' and i + 1 < n and code[i + 1] == '/':
                in_multi = False
                i += 2
            else:
                i += 1
            continue
        # Check for string literal
        if in_string:
            result.append(ch)
            if ch == '"':
                # Count backslashes before quote
                j = i - 1
                backslashes = 0
                while j >= 0 and code[j] == '\\':
                    backslashes += 1
                    j -= 1
                # Only end string if odd number of backslashes
                if backslashes % 2 == 0:
                    in_string = False
            i += 1
            continue
        # Check for char literal
        if in_char:
            result.append(ch)
            if ch == "'":
                # Similar escape check
                j = i - 1
                backslashes = 0
                while j >= 0 and code[j] == '\\':
                    backslashes += 1
                    j -= 1
                if backslashes % 2 == 0:
                    in_char = False
            i += 1
            continue
        # Detect start of single-line comment
        if ch == '/' and i + 1 < n and code[i + 1] == '/':
            in_single = True
            i += 2
            continue
        # Detect start of multi-line comment
        if ch == '/' and i + 1 < n and code[i + 1] == '*':
            in_multi = True
            i += 2
            continue
        
        result.append(ch)
        i += 1
        
    return "".join(result)
