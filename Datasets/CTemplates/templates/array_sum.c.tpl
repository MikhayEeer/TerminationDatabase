// Template: Array Sum Accumulation
// Description: Sum elements in an array with loop
//
// Parameters:
//   {ARRAY_VAR}     - Array variable name (e.g., arr, values, data)
//   {SIZE_VAR}      - Size variable (e.g., n, size, length)
//   {INDEX_VAR}     - Loop index variable (e.g., i, idx, index)
//   {SUM_VAR}       - Sum accumulator (e.g., sum, total, accumulator)
//   {ELEM_VAR}      - Element variable (e.g., elem, value, v)
//   {MAX_SIZE}      - Maximum array size (e.g., 100, 1000)
//
// Example instantiation:
//   {ARRAY_VAR} = arr, {SIZE_VAR} = n, {INDEX_VAR} = i, {SUM_VAR} = sum

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "array_sum.c", 2, "reach_error"); }
extern unsigned short __VERIFIER_nondet_ushort(void);

int main() {
    unsigned short {SIZE_VAR} = __VERIFIER_nondet_ushort();
    
    if ({SIZE_VAR} == 0 || {SIZE_VAR} > {MAX_SIZE}) {
        return 0;
    }
    
    unsigned short {ELEM_VAR} = 0;
    unsigned int {SUM_VAR} = 0;
    unsigned int {INDEX_VAR} = 0;
    
    while ({INDEX_VAR} < {SIZE_VAR}) {
        {ELEM_VAR} = __VERIFIER_nondet_ushort();
        {SUM_VAR} += {ELEM_VAR};
        ++{INDEX_VAR};
    }
    
    // Verify sum properties
    if ({SUM_VAR} < {ELEM_VAR}) {
        reach_error();
        return 1;
    }
    
    return 0;
}
