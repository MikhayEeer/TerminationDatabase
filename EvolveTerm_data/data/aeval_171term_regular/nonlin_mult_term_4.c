extern int __VERIFIER_nondet_int(void);

int main()
{
  int i = 1;
  int j = 1;
  int d = __VERIFIER_nondet_int();
  int b = __VERIFIER_nondet_int();
  
  while (i >= j &&
    b > 1 && b > d)
  {
    i = i*d;
    j = j*b;
  }
}
