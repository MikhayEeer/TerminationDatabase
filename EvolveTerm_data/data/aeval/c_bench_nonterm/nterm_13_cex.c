extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  if (x < 0) return 0;
  if (y <= 1) return 0;
  
  while (x > 0)
  {
    if (0 == __VERIFIER_nondet_int())
      x = x % 2;
    else
      x = x - y;
  }
}
