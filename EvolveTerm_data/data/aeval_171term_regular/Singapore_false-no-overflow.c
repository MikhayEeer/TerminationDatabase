extern int __VERIFIER_nondet_int(void);

int main()
{
    int x;
    int y;
    x = __VERIFIER_nondet_int();
    y = __VERIFIER_nondet_int();
    while (x > 0 && (x + y <= 0)) {

            x = x + x + y;
            y = y - 1;
    }
    return 0;
}
