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
    if (z == 0) z = 12; else if (z == 12) z = -1; else z = 0;
  }
  return 0;
}
