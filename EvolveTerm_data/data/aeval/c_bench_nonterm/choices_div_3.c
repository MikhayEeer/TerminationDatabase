extern int __VERIFIER_nondet_int(void);

int main()
{
  int j = __VERIFIER_nondet_int();
  if (j < 10) return 0;
  
  while (j >= 0)
  {
    int a = __VERIFIER_nondet_int();
    if (a == 0) { j = j / 2; }
    else if (a == 1) { j = j / 3 + 1; }
    else j = -90;
  }
  return 0;
}
