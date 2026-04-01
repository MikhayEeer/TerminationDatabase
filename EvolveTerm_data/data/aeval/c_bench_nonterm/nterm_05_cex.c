extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();
  
  while (x != y && (x == z || y == z))
  {
    if (__VERIFIER_nondet_int() == 0) x++; else y++;
  }
}
