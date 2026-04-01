extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();

  if (y <= 0) return 0;
  if (z > 0) return 0;

  while (x > 0)
  {
    if (0 == __VERIFIER_nondet_int())
      x = x - y;
    else
      x = x + z;
  }
}
