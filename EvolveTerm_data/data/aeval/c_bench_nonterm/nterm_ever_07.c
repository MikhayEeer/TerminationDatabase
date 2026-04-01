extern int __VERIFIER_nondet_int(void);

int main() {
  int x = __VERIFIER_nondet_int();
  
  while (x != 10) {
    if (x % 5 == 1) x = x - 2;
    else x--;
    
  }
  return 0;
}
