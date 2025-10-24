// Template: Nested Loop Pattern
// Description: Two-level nested loop with independent counters
//
// Parameters:
//   {OUTER_VAR}     - Outer loop variable (e.g., i, row, outer)
//   {INNER_VAR}     - Inner loop variable (e.g., j, col, inner)
//   {OUTER_INIT}    - Outer loop initial value (e.g., 0, 1)
//   {INNER_INIT}    - Inner loop initial value (e.g., 0, 1)
//   {OUTER_LIMIT}   - Outer loop limit (e.g., n, 10)
//   {INNER_LIMIT}   - Inner loop limit (e.g., m, {OUTER_VAR})
//   {OUTER_INC}     - Outer increment (e.g., 1, 2)
//   {INNER_INC}     - Inner increment (e.g., 1, 2)
//
// Example instantiation:
//   {OUTER_VAR} = i, {INNER_VAR} = j, {OUTER_LIMIT} = 10, {INNER_LIMIT} = i

extern int __VERIFIER_nondet_int(void);

int main() {
    int {OUTER_VAR} = {OUTER_INIT};
    int n = __VERIFIER_nondet_int();
    
    if (n > {OUTER_LIMIT} || n < 0) {
        return 0;
    }
    
    while ({OUTER_VAR} < n) {
        int {INNER_VAR} = {INNER_INIT};
        
        while ({INNER_VAR} < {INNER_LIMIT}) {
            {INNER_VAR} = {INNER_VAR} + {INNER_INC};
        }
        
        {OUTER_VAR} = {OUTER_VAR} + {OUTER_INC};
    }
    
    return 0;
}
