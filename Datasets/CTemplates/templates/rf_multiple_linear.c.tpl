// Template: Multiple Linear Ranking Functions (Lexicographic)
// Description: Loop with lexicographic ranking function (f1, f2, ...)
// Termination: YES (guaranteed)
// Ranking Function Type: Multiple Linear (Lexicographic)
//
// Theory: Uses lexicographic ordering of multiple linear functions.
//         At each iteration, either f1 decreases, or f1 stays the same and f2 decreases.
//         This is a (f1, f2)-lexicographic ranking function.
//
// Parameters:
//   {VAR1}          - First variable (e.g., x, outer)
//   {VAR2}          - Second variable (e.g., y, inner)
//   {INIT1}         - Initial value for VAR1 (e.g., 10, 100)
//   {INIT2}         - Initial value for VAR2 (e.g., 10, 100)
//   {DEC1}          - Decrement for VAR1 (e.g., 1)
//   {DEC2}          - Decrement for VAR2 (e.g., 1)
//   {BOUND1}        - Lower bound for VAR1 (e.g., 0)
//   {BOUND2}        - Lower bound for VAR2 (e.g., 0)
//
// Ranking Function: Lex((f1, f2)) where f1 = {VAR1}, f2 = {VAR2}
//
// Example instantiation:
//   Lex((x, y)): x decreases, or x stays same and y decreases

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR1} = __VERIFIER_nondet_int();
    int {VAR2} = __VERIFIER_nondet_int();
    
    if ({VAR1} < {BOUND1} || {VAR1} > {INIT1}) return 0;
    if ({VAR2} < {BOUND2} || {VAR2} > {INIT2}) return 0;
    
    // Lexicographic ranking: ({VAR1}, {VAR2})
    while ({VAR1} > {BOUND1} || {VAR2} > {BOUND2}) {
        if ({VAR2} > {BOUND2}) {
            // Decrease second component
            {VAR2} = {VAR2} - {DEC2};
        } else {
            // Reset second, decrease first
            {VAR2} = {INIT2};
            {VAR1} = {VAR1} - {DEC1};
        }
    }
    
    return 0;
}
