extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = 0;
  int y = __VERIFIER_nondet_int();

  while (x < 100)
  {
    x = x + y;
    y--;
  }
}
