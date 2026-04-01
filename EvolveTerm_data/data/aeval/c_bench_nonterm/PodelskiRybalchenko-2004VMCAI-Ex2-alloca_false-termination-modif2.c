extern int __VERIFIER_nondet_int(void);

int main() {
  
  int x = __VERIFIER_nondet_int();
  int d = __VERIFIER_nondet_int();
  while (x >= 0 || d < 0) {
    d = __VERIFIER_nondet_int();
    x = 2 *x  + d;
  }
  return 0;
}
