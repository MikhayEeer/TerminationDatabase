extern int __VERIFIER_nondet_int(void);

int main() {
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x != 10 && y != 12) {
    if (x % 5 == 1) x = x - 2;
      else x--;
    if (y % 6 == 1) y = y - 2;
      else y--;
  }
  return 0;
}
