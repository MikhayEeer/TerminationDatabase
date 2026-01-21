extern int __VERIFIER_nondet_int(void);

int main()
{
  int y, z, w;
  y = __VERIFIER_nondet_int();
  z = __VERIFIER_nondet_int();
  w = __VERIFIER_nondet_int();

  while (y%34 + z%34 + w%34 < 100) {
    y = y + 1;
    z = z + 2;
    w = w + 3;
  }
  return 0;
}
