extern int __VERIFIER_nondet_int(void);

int main() {
  int x, y, z, n;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  z = __VERIFIER_nondet_int();
  n = __VERIFIER_nondet_int();
  while (x + y >= 0 && x <= n && (z != 0)) {

    x = 2*x - y;
    y = z;
    z = -2*z;
  }
  return 0;
}
