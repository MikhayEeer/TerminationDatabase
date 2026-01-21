extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();

  while (x != y)
  {
    int a = __VERIFIER_nondet_int();
    int b = __VERIFIER_nondet_int();
    if (a == 0) {x = x + b; y = y - b;} else {x = x - b; y = y + b;}
  }
  return 0;
}
