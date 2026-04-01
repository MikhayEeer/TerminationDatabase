extern int __VERIFIER_nondet_int(void);

int main()
{
  int j = __VERIFIER_nondet_int();
  int b = __VERIFIER_nondet_int();
  
  while (j < 100 && b>1)
  {
    if (j <= 0) j = 1;
    else j = j*b;
  }
}
