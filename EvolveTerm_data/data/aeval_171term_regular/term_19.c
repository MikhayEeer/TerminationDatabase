extern int __VERIFIER_nondet_int(void);

int main() {
  int x = __VERIFIER_nondet_int();
  int y = 5;
  
  while (x != 2*y && (x > 10)) {

    if (x % 5 == 1) x = x +1;
      else x = x - 2;
  }
  return 0;
}
