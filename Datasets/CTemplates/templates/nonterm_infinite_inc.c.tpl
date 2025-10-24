// Template: Non-Terminating - Infinite Increment
// Description: Loop variable increases indefinitely
// Termination: NO (non-terminating)
// Non-Termination Type: Infinite Increment
//
// Theory: No ranking function exists because the loop variable grows unboundedly.
//         The loop condition is always satisfied (or becomes satisfied again).
//
// Parameters:
//   {VAR_NAME}      - Loop variable (e.g., x, counter)
//   {INIT_VALUE}    - Initial value (e.g., 0, 1)
//   {INCREMENT}     - Increment amount (e.g., 1, 2)
//   {CONDITION}     - Loop condition (e.g., {VAR_NAME} >= 0, always true for increasing)
//
// Anti-Ranking: Variable increases indefinitely, no upper bound
//
// Example instantiation:
//   x starts at 0, increases by 1, condition x >= 0 always true

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR_NAME} = {INIT_VALUE};
    
    // Infinite loop: variable keeps increasing
    while ({VAR_NAME} >= 0) {
        {VAR_NAME} = {VAR_NAME} + {INCREMENT};
        // Variable grows unboundedly: 0, 1, 2, 3, ...
    }
    
    return 0;  // Never reached
}
