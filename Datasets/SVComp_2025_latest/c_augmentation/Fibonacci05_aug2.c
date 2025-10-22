extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci05_aug2.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: control flow transformation (if-else to ternary) + variable renaming
// Original: if-else chain in fibonacci
// Transformed: nested ternary operators with shorter names

extern int __VERIFIER_nondet_int(void);


int fib(int n) {
    return (n < 1) ? 0 : ((n == 1) ? 1 : (fib(n-1) + fib(n-2)));
}


int main() {
    int x_in = __VERIFIER_nondet_int();
    if (x_in > 46) {
        return 0;
    }
    int res = fib(x_in);
    if (x_in < 8 || res >= 34) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
