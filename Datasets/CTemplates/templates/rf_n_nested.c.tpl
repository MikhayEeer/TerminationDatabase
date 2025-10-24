// Template: N-Nested Ranking Function (Configurable Depth)
// Description: N-level nested loops with hierarchical ranking functions
// Termination: YES (guaranteed)
// Ranking Function Type: N-Nested (N = {NEST_DEPTH})
//
// Theory: Each level has its own ranking function. 
//         Level k terminates before level k-1 makes progress.
//         Total complexity: O(n^{NEST_DEPTH})
//
// Parameters:
//   {NEST_DEPTH}    - Nesting depth (e.g., 3, 4, 5)
//   {VAR_PREFIX}    - Variable name prefix (e.g., level, loop, idx)
//   {INIT_BASE}     - Base initial value (e.g., 10)
//   {DEC_AMOUNT}    - Decrement amount (e.g., 1)
//
// Ranking Function: Product of all level ranking functions
//   f_total = f_1 * f_2 * ... * f_n
//
// Example: 3-nested loop
//   f(level1, level2, level3) = level1 * MAX2 * MAX3 + level2 * MAX3 + level3

extern int __VERIFIER_nondet_int(void);

int main() {
    // Level 1 (outermost)
    int {VAR_PREFIX}1 = __VERIFIER_nondet_int();
    if ({VAR_PREFIX}1 < 0 || {VAR_PREFIX}1 > {INIT_BASE}) return 0;
    
    while ({VAR_PREFIX}1 > 0) {
        // Level 2
        int {VAR_PREFIX}2 = __VERIFIER_nondet_int();
        if ({VAR_PREFIX}2 < 0 || {VAR_PREFIX}2 > {INIT_BASE}) {
            {VAR_PREFIX}2 = {INIT_BASE};
        }
        
        while ({VAR_PREFIX}2 > 0) {
            // Level 3 (innermost for 3-nested)
            int {VAR_PREFIX}3 = __VERIFIER_nondet_int();
            if ({VAR_PREFIX}3 < 0 || {VAR_PREFIX}3 > {INIT_BASE}) {
                {VAR_PREFIX}3 = {INIT_BASE};
            }
            
            while ({VAR_PREFIX}3 > 0) {
                {VAR_PREFIX}3 = {VAR_PREFIX}3 - {DEC_AMOUNT};
            }
            
            {VAR_PREFIX}2 = {VAR_PREFIX}2 - {DEC_AMOUNT};
        }
        
        {VAR_PREFIX}1 = {VAR_PREFIX}1 - {DEC_AMOUNT};
    }
    
    return 0;
}
