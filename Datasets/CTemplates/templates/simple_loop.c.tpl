// Template: Simple Loop Pattern
// Description: Basic incrementing loop with configurable parameters
// 
// Parameters:
//   {LOOP_VAR}      - Loop variable name (e.g., i, counter, idx)
//   {INIT_VALUE}    - Initial value (e.g., 0, 1, 10)
//   {LIMIT_EXPR}    - Loop limit expression (e.g., n, 100, 2*n)
//   {INCREMENT}     - Increment value (e.g., 1, 2, -1)
//   {LOOP_TYPE}     - Loop type: while, for
//
// Example instantiation:
//   {LOOP_VAR} = i, {INIT_VALUE} = 0, {LIMIT_EXPR} = 10, {INCREMENT} = 1, {LOOP_TYPE} = while

extern int __VERIFIER_nondet_int(void);

int main() {
    int {LOOP_VAR} = {INIT_VALUE};
    int limit = __VERIFIER_nondet_int();
    
    if (limit > {LIMIT_EXPR}) {
        return 0;
    }
    
    while ({LOOP_VAR} < limit) {
        {LOOP_VAR} = {LOOP_VAR} + {INCREMENT};
    }
    
    return 0;
}
