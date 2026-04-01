extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x > y && y > 1)
  {
    if (0 == __VERIFIER_nondet_int())
      x = x % y;
    else
      x = x - y;
  }
}
