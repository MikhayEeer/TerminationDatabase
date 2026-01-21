extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();

  while (x <= y)
  {
    x = x + z + 1;
    y = y + z + 2;
  }
}
