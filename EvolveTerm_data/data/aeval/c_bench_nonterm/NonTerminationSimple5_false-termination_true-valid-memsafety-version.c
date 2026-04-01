extern int __VERIFIER_nondet_int(void);

int main() {
  int x=__VERIFIER_nondet_int();
  while (x < 0) {
    int c = __VERIFIER_nondet_int();
    if (c == 0) x++;
    else x--;
  }
}
