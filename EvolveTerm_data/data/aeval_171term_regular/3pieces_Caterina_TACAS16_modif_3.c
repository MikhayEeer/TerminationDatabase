extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int N = __VERIFIER_nondet_int();

  while (x != 0 && (y<=0 && N>0)) {

    if (x < N) x = x +1; else x = y;
  }

}
