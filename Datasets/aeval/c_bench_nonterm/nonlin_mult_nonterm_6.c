extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();

  while (x * y * z == 0)
  {
    if (__VERIFIER_nondet_int() == 0)
      x = 0;
    else if (__VERIFIER_nondet_int() == 0)
      y = 0;
    else
      z = 0;
  }
}
