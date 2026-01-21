extern int __VERIFIER_nondet_int(void);

int main() {
    int a = __VERIFIER_nondet_int();
    while (a > 1) {
      if (a % 2 == 0) a = a / 2;
    }
    return 0;
}
