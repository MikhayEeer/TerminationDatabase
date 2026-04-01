extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();
  while (z > 0)
  {
    x ++;
    y --;
    if (__VERIFIER_nondet_int() == 0)
      z = z + 4 * x;
    else
      z = z + 5 * y;
  }
}
