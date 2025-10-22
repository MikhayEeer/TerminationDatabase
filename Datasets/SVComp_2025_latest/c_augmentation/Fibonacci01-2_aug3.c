extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci01-2_aug3.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: control flow transformation (combined if conditions) + variable renaming
// Original: separate if statements for bounds checking
// Transformed: combined conditions with descriptive names

extern int __VERIFIER_nondet_int(void);


int compute_fibonacci(int n_value) {
    if (n_value < 1) {
        return 0;
    } else if (n_value == 1) {
        return 1;
    } else {
        return compute_fibonacci(n_value-1) + compute_fibonacci(n_value-2);
    }
}


int main() {
    int input_value = __VERIFIER_nondet_int();
    // Combined bounds check
    if (input_value > 46 || input_value < 1) {
        return 0;
    }
    int fibonacci_result = compute_fibonacci(input_value);
    if (fibonacci_result >= 1) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
