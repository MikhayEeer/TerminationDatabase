# C Code Templates for Termination Analysis

This directory contains parameterized C code templates (`.c.tpl`) for generating test programs for termination analysis.

## 🆕 NEW: Ranking Function Theory-Based Templates

We now have **two categories** of templates:

1. **Basic Algorithm Templates** - Classic algorithms and patterns
2. **🎓 Ranking Function Theory Templates** - Based on termination analysis theory

See [`RANKING_FUNCTIONS.md`](RANKING_FUNCTIONS.md) for detailed theoretical documentation.

模板总计：18个
基础模板：8个
理论驱动模板：10个：
    终止：5个
    非终止：5个


## Directory Structure

```
CTemplates/
├── templates/                          # Template files (.c.tpl)
│   ├── RANKING_FUNCTIONS.md           # 📚 Theory documentation
│   │
│   ├── Basic Algorithm Templates:
│   ├── simple_loop.c.tpl
│   ├── nested_loop.c.tpl
│   ├── fibonacci_recursive.c.tpl
│   ├── gcd_algorithm.c.tpl
│   ├── array_sum.c.tpl
│   ├── conditional_loop.c.tpl
│   ├── binary_search.c.tpl
│   ├── factorial.c.tpl
│   │
│   └── Ranking Function Theory Templates:
│       ├── Terminating (5 types):
│       ├── rf_linear.c.tpl             # Linear ranking function
│       ├── rf_multiple_linear.c.tpl    # Multiple linear (lexicographic)
│       ├── rf_2nested.c.tpl            # 2-nested ranking function
│       ├── rf_n_nested.c.tpl           # N-nested ranking function
│       ├── rf_n_multiple.c.tpl         # N-multiple ranking function
│       │
│       └── Non-Terminating (5 types):
│           ├── nonterm_infinite_inc.c.tpl      # Infinite increment
│           ├── nonterm_infinite_dec.c.tpl      # Infinite decrement
│           ├── nonterm_periodic.c.tpl          # Periodic/cyclic loop
│           ├── nonterm_condition_unreach.c.tpl # Unreachable condition
│           └── nonterm_always_true.c.tpl       # Always-true condition
│
├── generates/          # Generated C files
└── README.md          # This file
```

## Template Syntax

Templates use simple placeholder substitution with `{PARAMETER_NAME}` syntax.

### Example Template

```c
// File: simple_loop.c.tpl
extern int __VERIFIER_nondet_int(void);

int main() {
    int {LOOP_VAR} = {INIT_VALUE};
    
    while ({LOOP_VAR} < {LIMIT_EXPR}) {
        {LOOP_VAR} = {LOOP_VAR} + {INCREMENT};
    }
    
    return 0;
}
```

### Example Instantiation

Replace placeholders:
- `{LOOP_VAR}` → `counter`
- `{INIT_VALUE}` → `0`
- `{LIMIT_EXPR}` → `100`
- `{INCREMENT}` → `2`

Result:
```c
int main() {
    int counter = 0;
    
    while (counter < 100) {
        counter = counter + 2;
    }
    
    return 0;
}
```

## Available Templates

### 1. **simple_loop.c.tpl**
Basic incrementing loop pattern

**Parameters:**
- `{LOOP_VAR}` - Loop variable name
- `{INIT_VALUE}` - Initial value
- `{LIMIT_EXPR}` - Loop limit
- `{INCREMENT}` - Increment value

**Use Case:** Testing basic loop termination with varying parameters

---

### 2. **nested_loop.c.tpl**
Two-level nested loops

**Parameters:**
- `{OUTER_VAR}` - Outer loop variable
- `{INNER_VAR}` - Inner loop variable
- `{OUTER_INIT}` - Outer initial value
- `{INNER_INIT}` - Inner initial value
- `{OUTER_LIMIT}` - Outer loop limit
- `{INNER_LIMIT}` - Inner loop limit (can reference outer var)
- `{OUTER_INC}` - Outer increment
- `{INNER_INC}` - Inner increment

**Use Case:** Testing nested loop termination analysis

---

### 3. **fibonacci_recursive.c.tpl**
Recursive Fibonacci computation

**Parameters:**
- `{FUNC_NAME}` - Function name
- `{PARAM_NAME}` - Function parameter name
- `{INPUT_VAR}` - Input variable in main
- `{RESULT_VAR}` - Result variable
- `{MAX_VALUE}` - Maximum input value
- `{BASE_CASE_1}` - First base case value
- `{BASE_CASE_2}` - Second base case value

**Use Case:** Testing recursive function termination

---

### 4. **gcd_algorithm.c.tpl**
Greatest Common Divisor using Euclidean algorithm

**Parameters:**
- `{VAR_A}` - First number variable
- `{VAR_B}` - Second number variable
- `{TEMP_VAR}` - Temporary variable
- `{MAX_VALUE}` - Maximum input value

**Use Case:** Testing number-theoretic algorithms

---

### 5. **array_sum.c.tpl**
Array element summation with accumulator

**Parameters:**
- `{ARRAY_VAR}` - Array variable name
- `{SIZE_VAR}` - Array size variable
- `{INDEX_VAR}` - Loop index
- `{SUM_VAR}` - Sum accumulator
- `{ELEM_VAR}` - Element variable
- `{MAX_SIZE}` - Maximum array size

**Use Case:** Testing loops with array operations

---

### 6. **conditional_loop.c.tpl**
Loop with conditional increment/decrement

**Parameters:**
- `{COUNTER_VAR}` - Counter variable
- `{INIT_VALUE}` - Initial value
- `{THRESHOLD}` - Threshold value
- `{INC_VALUE}` - Increment value
- `{DEC_VALUE}` - Decrement value
- `{SPECIAL_VAL}` - Special value to skip

**Use Case:** Testing conditional loop termination

---

### 7. **binary_search.c.tpl**
Binary search loop pattern

**Parameters:**
- `{LEFT_VAR}` - Left boundary
- `{RIGHT_VAR}` - Right boundary
- `{MID_VAR}` - Middle point
- `{TARGET_VAR}` - Target value
- `{ARRAY_SIZE}` - Array size

**Use Case:** Testing divide-and-conquer loop patterns

---

### 8. **factorial.c.tpl**
Iterative factorial calculation

**Parameters:**
- `{INPUT_VAR}` - Input variable
- `{RESULT_VAR}` - Result variable
- `{COUNTER_VAR}` - Counter variable
- `{MAX_INPUT}` - Maximum input
- `{FUNC_NAME}` - Function name (for recursive version)

**Use Case:** Testing mathematical computation loops

---

## Usage

### Manual Instantiation

1. Copy a template file
2. Replace all `{PARAMETER_NAME}` placeholders with desired values
3. Save as `.c` file in `generates/` directory

### Automated Generation (TODO)

A Python script will be provided for batch generation:

```python
# Example usage (future)
python generate.py \
  --template simple_loop.c.tpl \
  --config configs/simple_loop_variants.json \
  --output generates/
```

### Configuration File Format (TODO)

```json
{
  "template": "simple_loop.c.tpl",
  "variations": [
    {
      "name": "simple_loop_v1",
      "params": {
        "LOOP_VAR": "i",
        "INIT_VALUE": "0",
        "LIMIT_EXPR": "100",
        "INCREMENT": "1"
      }
    },
    {
      "name": "simple_loop_v2",
      "params": {
        "LOOP_VAR": "counter",
        "INIT_VALUE": "1",
        "LIMIT_EXPR": "50",
        "INCREMENT": "2"
      }
    }
  ]
}
```

## Best Practices

1. **Naming Convention:**
   - Use descriptive parameter names
   - Keep generated file names consistent: `{template_name}_v{number}.c`

2. **Parameter Values:**
   - Use valid C identifiers for variable names
   - Ensure numeric values are within reasonable bounds
   - Test edge cases (0, 1, negative values)

3. **Termination Properties:**
   - All templates should generate programs with well-defined termination behavior
   - Document expected termination status (terminates/non-terminates) in configuration

4. **Comments:**
   - Keep parameter descriptions in template comments
   - Add instantiation examples in comments

## Future Enhancements

- [ ] Python generator script with JSON config support
- [ ] Batch generation from configuration files
- [ ] Template validation tool
- [ ] More complex templates (multi-level recursion, complex data structures)
- [ ] Integration with termination analysis tools

## Contributing

When adding new templates:
1. Use clear, descriptive parameter names
2. Document all parameters in header comments
3. Provide example instantiation
4. Test generated code compiles correctly
5. Update this README

---

**Last Updated:** 2025-10-24
