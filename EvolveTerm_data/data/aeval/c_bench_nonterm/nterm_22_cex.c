extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  while (x != y)
  {
    if (x > 0) x--; else x++;
    if (x < y) y++; else if (x > y) y--;
  }
}
