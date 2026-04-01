extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x != y && (x>=y)) {

    x--; y = y +1;
    if (x < y) x = x + 15;
  }
}
