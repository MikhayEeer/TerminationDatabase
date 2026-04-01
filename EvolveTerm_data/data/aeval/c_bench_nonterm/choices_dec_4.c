extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();
  int w = __VERIFIER_nondet_int();

  while (x > 0 && y > 0 && z > 0 && w > 0)
  {
    int a = __VERIFIER_nondet_int();

    if (a == 0) {x--; y++; z++; w++;}
    else if (a == 1) {x++; y--; z++; w++;}
    else if (a == 2) {x++; y++; z--; w++;}
    else {x++; y++; z++; w--;}
  }
  return 0;
}
