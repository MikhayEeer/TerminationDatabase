extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci05_aug1.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: variable renaming
// Original variables: x, n, result
// Renamed to: input_num, fib_param, fib_output

extern int __VERIFIER_nondet_int(void);


int fibonacci(int fib_param) {
    if (fib_param < 1) {
        return 0;
    } else if (fib_param == 1) {
        return 1;
    } else {
        return fibonacci(fib_param-1) + fibonacci(fib_param-2);
    }
}


int main() {
    int input_num = __VERIFIER_nondet_int();
    if (input_num > 46) {
        return 0;
    }
    int fib_output = fibonacci(input_num);
    if (input_num < 8 || fib_output >= 34) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
