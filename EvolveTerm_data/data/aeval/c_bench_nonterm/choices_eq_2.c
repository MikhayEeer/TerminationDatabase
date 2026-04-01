extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();

  while (x != y)
  {
    int a = __VERIFIER_nondet_int();
    if (a == 0) {x--; y++;} else {y--; x++;}
  }
  return 0;
}
