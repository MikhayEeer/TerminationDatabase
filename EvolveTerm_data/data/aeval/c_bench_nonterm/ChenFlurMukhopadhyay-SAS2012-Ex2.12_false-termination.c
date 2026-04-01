extern int __VERIFIER_nondet_int(void);

int main() {
    int x, y, oldx;
    x = __VERIFIER_nondet_int();
    y = __VERIFIER_nondet_int();
    while (x < 5) {
        oldx = x;
        x = oldx - y;
        y = oldx + y;
    }
    return 0;
}
