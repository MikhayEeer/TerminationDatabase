extern int __VERIFIER_nondet_int(void);

int main() {
    int x, y;
    x = __VERIFIER_nondet_int();
    y = __VERIFIER_nondet_int();
    while (x < y) {
        x = x + y;
        y = -2*y;
    }
    return 0;
}
