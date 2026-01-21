extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  
  while (x == 3 * y)
  { 
    y = x + y;
    if (__VERIFIER_nondet_int() == 0)
    {
      x = 4 * x;
    } else {
      x = y + 1;
    }
  }
}
