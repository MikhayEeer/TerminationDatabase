extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x == y)
  {
    x = -x;
    y = __VERIFIER_nondet_int();
  }
}
