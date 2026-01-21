extern int __VERIFIER_nondet_int(void);

int main() {
	int x;
    x = __VERIFIER_nondet_int();
    while (x <= 10) {
        if (x > 6) {
            x = x + 2;
        }
    }
    return 0;
}
