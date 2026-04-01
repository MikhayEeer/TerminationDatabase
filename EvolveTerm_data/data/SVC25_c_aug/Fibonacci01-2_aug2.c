extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "Fibonacci01-2_aug2.c", 3, "reach_error"); }

/*
 * Recursive computation of fibonacci numbers.
 * 
 * Author: Matthias Heizmann
 * Date: 2013-07-13
 * 
 */

// Augmentation: control flow transformation (if-else to ternary) + variable renaming
// Original: if-else chain
// Transformed: ternary operators with compact variable names

extern int __VERIFIER_nondet_int(void);


int fib_calc(int num) {
    return (num < 1) ? 0 : ((num == 1) ? 1 : (fib_calc(num-1) + fib_calc(num-2)));
}


int main() {
    int inp = __VERIFIER_nondet_int();
    if (inp > 46) {
        return 0;
    }
	if(inp < 1)
		return 0;
    int out = fib_calc(inp);
    if (out >= 1) {
        return 0;
    } else {
        ERROR: {reach_error();abort();}
    }
}
