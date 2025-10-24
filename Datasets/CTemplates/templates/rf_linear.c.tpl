// Template: Linear Ranking Function
// Description: Simple loop with linear ranking function f(x) = {COEFF} * {VAR} + {CONST}
// Termination: YES (guaranteed)
// Ranking Function Type: Linear
//
// Theory: The ranking function f(x) = c*x + k strictly decreases on each iteration
//         and is bounded below by 0, guaranteeing termination.
//
// Parameters:
//   {VAR_NAME}      - Loop variable (e.g., x, n, counter)
//   {INIT_VALUE}    - Initial value (e.g., 100, 1000)
//   {COEFF}         - Coefficient in ranking function (e.g., 1, 2)
//   {DECREMENT}     - Decrement per iteration (e.g., 1, 2, 3)
//   {LOWER_BOUND}   - Lower bound (usually 0 or 1)
//
// Ranking Function: f({VAR_NAME}) = {COEFF} * {VAR_NAME}
// Variant: f decreases by {COEFF} * {DECREMENT} each iteration
//
// Example instantiation:
//   f(x) = x, decreases by 1 each iteration

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR_NAME} = __VERIFIER_nondet_int();
    
    if ({VAR_NAME} < {LOWER_BOUND} || {VAR_NAME} > {INIT_VALUE}) {
        return 0;
    }
    
    // Linear ranking function: f({VAR_NAME}) = {COEFF} * {VAR_NAME}
    while ({VAR_NAME} > {LOWER_BOUND}) {
        {VAR_NAME} = {VAR_NAME} - {DECREMENT};
    }
    
    // Terminates when {VAR_NAME} <= {LOWER_BOUND}
    return 0;
}
