// Template: Non-Terminating - Condition Never Satisfied
// Description: Loop variable changes but never meets exit condition
// Termination: NO (non-terminating)
// Non-Termination Type: Unreachable Exit Condition
//
// Theory: Loop variable is modified but update does not converge to exit condition.
//         The condition is satisfiable in theory but unreachable due to update logic.
//         Common in loops with wrong step size (e.g., += 2 when target is odd).
//
// Parameters:
//   {VAR_NAME}      - Loop variable (e.g., x, counter)
//   {INIT_VALUE}    - Initial value (e.g., 0, 1)
//   {TARGET}        - Target value for exit (e.g., 10, 100)
//   {STEP}          - Step size (e.g., 2, 3)
//   {CONDITION}     - Exit condition (e.g., {VAR_NAME} == {TARGET})
//
// Anti-Pattern: Step size causes variable to skip over target
//
// Example instantiation:
//   x = 0, target = 10, step = 3
//   Sequence: 0, 3, 6, 9, 12, 15, ... (skips 10)

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR_NAME} = {INIT_VALUE};
    int target = {TARGET};
    
    // Infinite loop: condition never becomes true
    // Variable skips over target value
    while ({VAR_NAME} != target) {
        {VAR_NAME} = {VAR_NAME} + {STEP};
        // If STEP doesn't divide (TARGET - INIT_VALUE), 
        // variable will skip target and continue indefinitely
        
        // Safety: bound check to prevent actual infinite loop
        if ({VAR_NAME} > target + {STEP}) {
            break;  // Would be infinite without this
        }
    }
    
    return 0;
}
