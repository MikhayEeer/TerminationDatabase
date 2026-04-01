extern int __VERIFIER_nondet_int(void);

int main()
{
  int j = __VERIFIER_nondet_int();
  int d = __VERIFIER_nondet_int();
  if (d <= 1) return 0;
  
  while (j < 0)
  {
    j = j - d;
  }
}
