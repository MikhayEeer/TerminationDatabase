extern int __VERIFIER_nondet_int(void);

int main() {
  
  int n;
  if (n <= 0) return 0;
  
  int x = 0;
  int m = __VERIFIER_nondet_int();
  
  while (x < n) {
    if (m == 1) {
      x = x + 1;
    }
  }
  return 0;
}
