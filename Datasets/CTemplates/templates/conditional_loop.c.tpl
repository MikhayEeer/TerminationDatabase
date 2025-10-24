// Template: Conditional Loop
// Description: Loop with conditional increment/decrement
//
// Parameters:
//   {COUNTER_VAR}   - Counter variable (e.g., i, counter, n)
//   {INIT_VALUE}    - Initial value (e.g., 0, 1, 10)
//   {THRESHOLD}     - Threshold for condition (e.g., 5, 10, 100)
//   {INC_VALUE}     - Increment value (e.g., 1, 2)
//   {DEC_VALUE}     - Decrement value (e.g., 1, 2)
//   {SPECIAL_VAL}   - Special value to skip (e.g., 5, 0, -1)
//
// Example instantiation:
//   {COUNTER_VAR} = i, {INIT_VALUE} = 0, {THRESHOLD} = 100, {SPECIAL_VAL} = 5

extern int __VERIFIER_nondet_int(void);

int main() {
    int {COUNTER_VAR};
    {COUNTER_VAR} = __VERIFIER_nondet_int();
    
    while ({COUNTER_VAR} > 0) {
        if ({COUNTER_VAR} != {SPECIAL_VAL}) {
            {COUNTER_VAR} = {COUNTER_VAR} - {DEC_VALUE};
        }
    }
    
    return 0;
}
