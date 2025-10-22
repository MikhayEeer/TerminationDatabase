extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci01-2_aug1.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: variable renaming
// Original variables: x, n, result
// Renamed to: user_input, fib_n, fib_result

extern int __VERIFIER_nondet_int(void);


int fibonacci(int fib_n) {
    if (fib_n < 1) {
        return 0;
    } else if (fib_n == 1) {
        return 1;
    } else {
        return fibonacci(fib_n-1) + fibonacci(fib_n-2);
    }
}


int main() {
    int user_input = __VERIFIER_nondet_int();
    if (user_input > 46) {
        return 0;
    }
	if(user_input < 1)
		return 0;
    int fib_result = fibonacci(user_input);
    if (fib_result >= 1) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
