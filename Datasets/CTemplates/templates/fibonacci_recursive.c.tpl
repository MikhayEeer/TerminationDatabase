// Template: Recursive Fibonacci
// Description: Fibonacci number computation using recursion
//
// Parameters:
//   {FUNC_NAME}     - Function name (e.g., fibonacci, fib, calc_fib)
//   {PARAM_NAME}    - Parameter name (e.g., n, num, value)
//   {INPUT_VAR}     - Input variable in main (e.g., x, input, n)
//   {RESULT_VAR}    - Result variable (e.g., result, output, fib_num)
//   {MAX_VALUE}     - Maximum input value (e.g., 46, 50, 100)
//   {BASE_CASE_1}   - First base case value (e.g., 0, 1)
//   {BASE_CASE_2}   - Second base case value (e.g., 1, 1)
//
// Example instantiation:
//   {FUNC_NAME} = fibonacci, {PARAM_NAME} = n, {MAX_VALUE} = 46

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "fibonacci.c", 3, "reach_error"); }
extern int __VERIFIER_nondet_int(void);

int {FUNC_NAME}(int {PARAM_NAME}) {
    if ({PARAM_NAME} < 1) {
        return {BASE_CASE_1};
    } else if ({PARAM_NAME} == 1) {
        return {BASE_CASE_2};
    } else {
        return {FUNC_NAME}({PARAM_NAME}-1) + {FUNC_NAME}({PARAM_NAME}-2);
    }
}

int main() {
    int {INPUT_VAR} = __VERIFIER_nondet_int();
    
    if ({INPUT_VAR} > {MAX_VALUE}) {
        return 0;
    }
    
    int {RESULT_VAR} = {FUNC_NAME}({INPUT_VAR});
    
    return 0;
}
