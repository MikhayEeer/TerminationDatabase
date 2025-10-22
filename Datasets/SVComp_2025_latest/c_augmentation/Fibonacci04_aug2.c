extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci04_aug2.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: inline function + variable renaming
// Original: separate fibonacci function
// Inlined: fibonacci computation directly in main with renamed variables

extern int __VERIFIER_nondet_int(void);

int fibonacci_inline(int n) {
    if (n < 1) {
        return 0;
    } else if (n == 1) {
        return 1;
    } else {
        return fibonacci_inline(n-1) + fibonacci_inline(n-2);
    }
}

int main() {
    int x_val = __VERIFIER_nondet_int();
    if (x_val > 46) {
        return 0;
    }
    // Inlined fibonacci call with renamed function
    int res = fibonacci_inline(x_val);
    if (x_val != 5 || res == 3) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
