extern int __VERIFIER_nondet_int(void);

int main()
{
  int j = __VERIFIER_nondet_int();
  if (j < 2) return 0;
  while (j >= 0)
  {
    int a = __VERIFIER_nondet_int();
    if (a == 0) { j = j / 2; } else { j = j - 1; }
  }
  return 0;
}
