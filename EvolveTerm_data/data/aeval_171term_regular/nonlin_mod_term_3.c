extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x != 0 
    && x>0 && y>0 && x%y==0)
  {
    x = x - y;
  }
}
