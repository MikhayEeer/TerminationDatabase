// Template: Non-Terminating - Always True Condition
// Description: Loop condition is always satisfied, no progress toward termination
// Termination: NO (non-terminating)
// Non-Termination Type: Invariant True Condition
//
// Theory: Loop condition remains invariantly true regardless of variable updates.
//         No ranking function can be defined as the system state doesn't approach exit.
//         Common bug: forgetting to update loop control variable.
//
// Parameters:
//   {VAR_NAME}      - Loop variable (may not be updated)
//   {CONDITION}     - Always-true condition (e.g., 1 == 1, x >= 0 when x always positive)
//   {DUMMY_UPDATE}  - Update that doesn't affect condition (e.g., y = y + 1)
//
// Anti-Pattern: Condition doesn't depend on loop variable, or variable doesn't affect condition
//
// Example instantiation:
//   while (1) or while (x >= 0) where x only increases

extern int __VERIFIER_nondet_int(void);

int main() {
    int {VAR_NAME} = __VERIFIER_nondet_int();
    int dummy = 0;
    
    if ({VAR_NAME} < 0 || {VAR_NAME} > 100) {
        return 0;
    }
    
    // Infinite loop: condition always true
    // Either tautology (1 == 1) or variable update doesn't affect condition
    while ({CONDITION}) {
        // Update that doesn't make progress toward exit
        dummy = dummy + 1;
        // {VAR_NAME} is not updated, or updated in wrong direction
        
        // Safety break for testing
        if (dummy > 1000) {
            break;
        }
    }
    
    return 0;
}
