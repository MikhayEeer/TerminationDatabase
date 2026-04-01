extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x < 10000 && x>0 && y>1)
  {
    x = x * y;
  }
}
