// Template: Binary Search Loop
// Description: Binary search pattern with configurable variables
//
// Parameters:
//   {LEFT_VAR}      - Left boundary variable (e.g., left, low, start)
//   {RIGHT_VAR}     - Right boundary variable (e.g., right, high, end)
//   {MID_VAR}       - Middle point variable (e.g., mid, middle, center)
//   {TARGET_VAR}    - Target value variable (e.g., target, key, value)
//   {ARRAY_SIZE}    - Maximum array size (e.g., 100, 1000)
//
// Example instantiation:
//   {LEFT_VAR} = left, {RIGHT_VAR} = right, {MID_VAR} = mid, {TARGET_VAR} = target

extern int __VERIFIER_nondet_int(void);

int main() {
    int {LEFT_VAR} = 0;
    int {RIGHT_VAR} = __VERIFIER_nondet_int();
    int {TARGET_VAR} = __VERIFIER_nondet_int();
    int {MID_VAR};
    
    if ({RIGHT_VAR} < 0 || {RIGHT_VAR} > {ARRAY_SIZE}) {
        return 0;
    }
    
    while ({LEFT_VAR} <= {RIGHT_VAR}) {
        {MID_VAR} = {LEFT_VAR} + ({RIGHT_VAR} - {LEFT_VAR}) / 2;
        
        // Simulate comparison with array element
        int comparison = __VERIFIER_nondet_int();
        
        if (comparison == 0) {
            // Found
            return 0;
        } else if (comparison < 0) {
            {RIGHT_VAR} = {MID_VAR} - 1;
        } else {
            {LEFT_VAR} = {MID_VAR} + 1;
        }
    }
    
    // Not found
    return 0;
}
