extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = 1;
  int y = __VERIFIER_nondet_int();
  
  while (x < 10000 && y>1)
  {
    x = x * y;
  }
}
