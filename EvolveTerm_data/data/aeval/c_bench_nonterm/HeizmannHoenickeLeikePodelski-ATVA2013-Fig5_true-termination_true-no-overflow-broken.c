extern int __VERIFIER_nondet_int(void);

int main() {
  int x = __VERIFIER_nondet_int();
  int y = 1;
  while (x >= 0) {
    x = x - y + 1;
    y = (y + 1) / 2;
  }
  return 0;
}

