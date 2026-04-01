extern int __VERIFIER_nondet_int(void);

int main() {
    int x, y;
    x = __VERIFIER_nondet_int();
    y = __VERIFIER_nondet_int();
    while (x > y && y <= 2147483647 - x && (x > 0)) {

            y = y + x;
    }
    return 0;
}
