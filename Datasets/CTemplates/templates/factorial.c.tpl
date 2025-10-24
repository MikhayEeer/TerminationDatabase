// Template: Factorial Calculation
// Description: Compute factorial iteratively or recursively
//
// Parameters:
//   {INPUT_VAR}     - Input variable (e.g., n, num, value)
//   {RESULT_VAR}    - Result variable (e.g., result, factorial, product)
//   {COUNTER_VAR}   - Counter variable (e.g., i, counter, idx)
//   {MAX_INPUT}     - Maximum input value (e.g., 12, 20)
//   {FUNC_NAME}     - Function name if recursive (e.g., factorial, fact, calc_factorial)
//
// Example instantiation:
//   {INPUT_VAR} = n, {RESULT_VAR} = result, {COUNTER_VAR} = i, {MAX_INPUT} = 12

extern int __VERIFIER_nondet_int(void);

int main() {
    int {INPUT_VAR} = __VERIFIER_nondet_int();
    
    if ({INPUT_VAR} < 0 || {INPUT_VAR} > {MAX_INPUT}) {
        return 0;
    }
    
    // Iterative factorial calculation
    unsigned long long {RESULT_VAR} = 1;
    int {COUNTER_VAR} = 1;
    
    while ({COUNTER_VAR} <= {INPUT_VAR}) {
        {RESULT_VAR} = {RESULT_VAR} * {COUNTER_VAR};
        {COUNTER_VAR}++;
    }
    
    return 0;
}
