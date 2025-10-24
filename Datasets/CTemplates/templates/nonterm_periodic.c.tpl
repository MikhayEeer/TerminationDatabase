// Template: Non-Terminating - Periodic/Cyclic Loop
// Description: Variables cycle through a fixed set of values indefinitely
// Termination: NO (non-terminating)
// Non-Termination Type: Periodic Cycle
//
// Theory: Variables follow a cycle: s0 -> s1 -> s2 -> ... -> sN -> s0
//         No ranking function exists as values repeat.
//         System returns to previous states, violating well-foundedness.
//
// Parameters:
//   {VAR1}          - First cycling variable (e.g., x, state1)
//   {VAR2}          - Second cycling variable (e.g., y, state2)
//   {CYCLE_LENGTH}  - Number of states in cycle (e.g., 2, 3, 4)
//   {SWAP_TEMP}     - Temporary variable for swapping
//
// Cycle Pattern: (v1, v2) -> (v2, v1) -> (v1, v2) -> ...
//
// Example instantiation:
//   (x, y) swaps values indefinitely: (a,b) -> (b,a) -> (a,b) -> ...

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR1} = __VERIFIER_nondet_int();
    int {VAR2} = __VERIFIER_nondet_int();
    int {SWAP_TEMP};
    
    // Infinite loop: values cycle
    // Pattern: (x, y) -> (y, x) -> (x, y) -> ...
    while ({VAR1} != {VAR2}) {
        {SWAP_TEMP} = {VAR1};
        {VAR1} = {VAR2};
        {VAR2} = {SWAP_TEMP};
        
        // Nondeterministic break prevents actual infinite loop in testing
        if (__VERIFIER_nondet_int()) {
            break;
        }
    }
    
    return 0;
}
