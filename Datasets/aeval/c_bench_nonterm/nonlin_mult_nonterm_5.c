extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  if (y <= 0) return 0;

  while (x == 10000000)
  {
    x = x * y;
  }
}
