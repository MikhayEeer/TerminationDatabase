// Template: Non-Terminating - Infinite Decrement
// Description: Loop variable decreases indefinitely (for signed integers)
// Termination: NO (non-terminating)
// Non-Termination Type: Infinite Decrement
//
// Theory: Variable decreases without lower bound check, can underflow.
//         For signed integers, continues into negative values indefinitely.
//         No ranking function exists as the variable is unbounded below.
//
// Parameters:
//   {VAR_NAME}      - Loop variable (e.g., x, counter)
//   {INIT_VALUE}    - Initial value (e.g., 100, 1000)
//   {DECREMENT}     - Decrement amount (e.g., 1, 2)
//   {CONDITION}     - Loop condition (e.g., {VAR_NAME} != 0, never becomes false)
//
// Anti-Ranking: Variable decreases indefinitely into negative values
//
// Example instantiation:
//   x starts at 100, decreases by 1, condition x != 0 (but passes through 0)

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR_NAME} = {INIT_VALUE};
    
    // Infinite loop: decreases indefinitely
    // Condition never becomes false (passes through 0)
    while ({VAR_NAME} != 0) {
        {VAR_NAME} = {VAR_NAME} - {DECREMENT};
        // If DECREMENT > 1, may skip 0 and continue negative
        // Values: 100, 99, 98, ..., 1, -1, -2, -3, ... (if DECREMENT=2)
    }
    
    return 0;  // Never reached if DECREMENT > 1
}
