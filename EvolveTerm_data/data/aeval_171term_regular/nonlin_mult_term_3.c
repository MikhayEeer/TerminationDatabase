extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = __VERIFIER_nondet_int();
  int y = __VERIFIER_nondet_int();
  int z = __VERIFIER_nondet_int();
  
  while (x < 1000000 &&
    x>1 && y>1 && z>1)
  {
    x = x * y * z;
  }
}
