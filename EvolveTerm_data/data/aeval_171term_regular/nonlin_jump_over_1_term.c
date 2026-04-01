extern int __VERIFIER_nondet_int(void);

int main() {
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();

  while (x >= y && y>1) {
    if (x % y == 1) x = x +1;
      else x = x - 2;
  }
  return 0;
}

