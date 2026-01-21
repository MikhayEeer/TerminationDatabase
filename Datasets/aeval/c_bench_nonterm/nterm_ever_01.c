extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while ((x > 0 && y > 0) || (x < 0 && y < 0))
  {
    y = y * -7;
    x = x * -9;
  }
}
