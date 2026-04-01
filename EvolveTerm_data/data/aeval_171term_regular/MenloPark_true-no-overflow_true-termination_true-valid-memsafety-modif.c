extern int __VERIFIER_nondet_int(void);

int main()
{
  int x, y, z;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  
  z = 1;
  while (x > 0 && y>1) {
    x = x - y;
    y = y - z;
    z = -z;
  }
  return 0;
}

