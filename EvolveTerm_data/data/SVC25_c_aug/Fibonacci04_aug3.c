extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci04_aug3.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: control flow transformation (if-else to ternary) + variable renaming
// Original: if-else chain in fibonacci function
// Transformed: ternary operator with shorter variable names

extern int __VERIFIER_nondet_int(void);
int fib(int num);
int main();


int fib(int num) {
    return (num < 1) ? 0 : ((num == 1) ? 1 : (fib(num-1) + fib(num-2)));
}


int main() {
    int val = __VERIFIER_nondet_int();
    if (val > 46) {
        return 0;
    }
    int output = fib(val);
    if (val != 5 || output == 3) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
