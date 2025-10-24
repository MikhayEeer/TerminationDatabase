// Template: GCD Algorithm (Euclidean)
// Description: Greatest Common Divisor using Euclidean algorithm
//
// Parameters:
//   {VAR_A}         - First number variable (e.g., a, num1, x)
//   {VAR_B}         - Second number variable (e.g., b, num2, y)
//   {TEMP_VAR}      - Temporary variable for swapping (e.g., temp, tmp, t)
//   {MAX_VALUE}     - Maximum value for inputs (e.g., 1000, 65535)
//   {ALGO_TYPE}     - Algorithm variant: subtraction, modulo
//
// Example instantiation:
//   {VAR_A} = a, {VAR_B} = b, {TEMP_VAR} = temp, {ALGO_TYPE} = modulo

extern unsigned int __VERIFIER_nondet_uint(void);

int main() {
    unsigned int {VAR_A}, {VAR_B};
    unsigned int {TEMP_VAR};
    
    {VAR_A} = __VERIFIER_nondet_uint();
    {VAR_B} = __VERIFIER_nondet_uint();
    
    if ({VAR_A} > {MAX_VALUE} || {VAR_B} > {MAX_VALUE}) {
        return 0;
    }
    
    if ({VAR_A} == 0 || {VAR_B} == 0) {
        return 0;
    }
    
    // Euclidean algorithm using modulo
    while ({VAR_B} != 0) {
        {TEMP_VAR} = {VAR_B};
        {VAR_B} = {VAR_A} % {VAR_B};
        {VAR_A} = {TEMP_VAR};
    }
    
    // {VAR_A} now contains GCD
    return 0;
}
