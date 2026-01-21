extern int __VERIFIER_nondet_int(void);

int main() {
  int x, y, z;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  z = __VERIFIER_nondet_int();
  while (x < 0) {
    x = x + z;
    z = -2*y;
    y = y + 1;
  }
  return 0;
}
