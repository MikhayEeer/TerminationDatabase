extern int __VERIFIER_nondet_int(void);

int main() {
  
  int x = __VERIFIER_nondet_int();
  int d = __VERIFIER_nondet_int();
  if (d <= 1) return 0;

  while (x > 0) {
    x = 2 *x + d;
  }
  return 0;
}
