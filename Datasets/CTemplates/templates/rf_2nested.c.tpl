// Template: Nested Ranking Function (2-Nested)
// Description: Nested loops with outer and inner ranking functions
// Termination: YES (guaranteed)
// Ranking Function Type: 2-Nested
//
// Theory: Outer loop has ranking function f_outer, inner loop has f_inner.
//         Inner loop terminates for each outer iteration.
//         Total iterations bounded by f_outer * max(f_inner).
//
// Parameters:
//   {OUTER_VAR}     - Outer loop variable (e.g., i, row)
//   {INNER_VAR}     - Inner loop variable (e.g., j, col)
//   {OUTER_INIT}    - Outer initial value (e.g., 10)
//   {INNER_INIT}    - Inner initial value (e.g., 10)
//   {OUTER_DEC}     - Outer decrement (e.g., 1)
//   {INNER_DEC}     - Inner decrement (e.g., 1)
//   {NESTING_LEVEL} - Nesting level (2 for this template)
//
// Ranking Function: 
//   Outer: f_outer({OUTER_VAR}) = {OUTER_VAR}
//   Inner: f_inner({INNER_VAR}) = {INNER_VAR}
//   Combined: f_outer * MAX_INNER_ITERATIONS
//
// Example instantiation:
//   2-nested loop with i and j

extern int __VERIFIER_nondet_int(void);

int main() {
    int {OUTER_VAR} = __VERIFIER_nondet_int();
    
    if ({OUTER_VAR} < 0 || {OUTER_VAR} > {OUTER_INIT}) {
        return 0;
    }
    
    // Outer loop: ranking function f_outer = {OUTER_VAR}
    while ({OUTER_VAR} > 0) {
        int {INNER_VAR} = __VERIFIER_nondet_int();
        
        if ({INNER_VAR} < 0 || {INNER_VAR} > {INNER_INIT}) {
            {INNER_VAR} = {INNER_INIT};
        }
        
        // Inner loop: ranking function f_inner = {INNER_VAR}
        while ({INNER_VAR} > 0) {
            {INNER_VAR} = {INNER_VAR} - {INNER_DEC};
        }
        
        {OUTER_VAR} = {OUTER_VAR} - {OUTER_DEC};
    }
    
    return 0;
}
