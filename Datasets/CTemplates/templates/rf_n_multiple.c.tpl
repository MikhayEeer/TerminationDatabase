// Template: N-Multiple Ranking Functions (N-Lexicographic)
// Description: Single loop with N-dimensional lexicographic ranking function
// Termination: YES (guaranteed)
// Ranking Function Type: N-Multiple (N = {NUM_COMPONENTS})
//
// Theory: Lexicographic ordering on N components (v1, v2, ..., vN).
//         At each iteration, some component vi decreases, and all v1...v(i-1) stay same.
//         This provides a well-founded ordering guaranteeing termination.
//
// Parameters:
//   {NUM_COMPONENTS} - Number of ranking function components (e.g., 3, 4)
//   {VAR_PREFIX}     - Variable name prefix (e.g., v, comp, dim)
//   {INIT_VALUE}     - Initial value for each component (e.g., 10)
//   {RESET_VALUE}    - Reset value when component exhausted (e.g., 10)
//
// Ranking Function: Lex((v1, v2, ..., vN))
//   Priority: v1 > v2 > ... > vN
//
// Example: 3-Multiple with (x, y, z)
//   Decreases z most frequently, then y, then x

extern int __VERIFIER_nondet_int(void);

int main() {
    // Initialize N components
    int {VAR_PREFIX}1 = __VERIFIER_nondet_int();
    int {VAR_PREFIX}2 = __VERIFIER_nondet_int();
    int {VAR_PREFIX}3 = __VERIFIER_nondet_int();
    
    if ({VAR_PREFIX}1 < 0 || {VAR_PREFIX}1 > {INIT_VALUE}) return 0;
    if ({VAR_PREFIX}2 < 0 || {VAR_PREFIX}2 > {INIT_VALUE}) return 0;
    if ({VAR_PREFIX}3 < 0 || {VAR_PREFIX}3 > {INIT_VALUE}) return 0;
    
    // Lexicographic ranking: ({VAR_PREFIX}1, {VAR_PREFIX}2, {VAR_PREFIX}3)
    while ({VAR_PREFIX}1 > 0 || {VAR_PREFIX}2 > 0 || {VAR_PREFIX}3 > 0) {
        if ({VAR_PREFIX}3 > 0) {
            // Decrease lowest priority component
            {VAR_PREFIX}3--;
        } else if ({VAR_PREFIX}2 > 0) {
            // Reset lower, decrease middle
            {VAR_PREFIX}3 = {RESET_VALUE};
            {VAR_PREFIX}2--;
        } else if ({VAR_PREFIX}1 > 0) {
            // Reset all lower, decrease highest
            {VAR_PREFIX}3 = {RESET_VALUE};
            {VAR_PREFIX}2 = {RESET_VALUE};
            {VAR_PREFIX}1--;
        }
    }
    
    return 0;
}
