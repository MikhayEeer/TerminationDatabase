extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x != 0)
  {
    y--;
    if (x < 10) x = x +1; else x = y;
  }
}
