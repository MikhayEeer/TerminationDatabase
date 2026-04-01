extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = 7*x + 19;
  
  while (y > 0)
  {
    if (__VERIFIER_nondet_int() == 0)
      y = y + 24*x + 7;
    else x--;
  }
}
