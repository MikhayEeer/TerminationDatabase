extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = 0;
  int y = 0;
  while (x >= y)
  {
    int z = __VERIFIER_nondet_int();
    y = y + z + 1;
    x = x + 2*z + 2;
  }
}
