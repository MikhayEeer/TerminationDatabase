extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = 0;
  int y;

  while (x != 6)
  {
    if (__VERIFIER_nondet_int() == 0) y = 1;
    else if (__VERIFIER_nondet_int() == 0) y = 2;
    else if (__VERIFIER_nondet_int() == 0) y = 4;
    else y = 5;
    x = x + y;
  }
}
