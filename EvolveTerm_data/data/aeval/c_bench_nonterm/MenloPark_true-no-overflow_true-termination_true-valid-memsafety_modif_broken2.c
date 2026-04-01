extern int __VERIFIER_nondet_int(void);

int main()
{
  int x, y, z;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();

  z = 0;
  while (x > 0) {
    x = x - y;
    y = y - z;
    if (z == 2) z = 0; else z++;
  }
  return 0;
}
