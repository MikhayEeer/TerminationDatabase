extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();

  while (x > 0 && y > 0 && z > 0)
  {
    int a = __VERIFIER_nondet_int();
    if (a == 0) {x--; y++; z++;}
    else if (a == 1) {y--; x++; z++;}
    else {y++; x++; z--;}
  }
  return 0;
}
