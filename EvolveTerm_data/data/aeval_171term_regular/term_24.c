extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();
  
  while ((x <= z && y <= z)&& x != y)
  {
    x = x +1; y = y +1;
    if (x > z) x = z;
    if (y > z) y = y - 1;
  }
}
