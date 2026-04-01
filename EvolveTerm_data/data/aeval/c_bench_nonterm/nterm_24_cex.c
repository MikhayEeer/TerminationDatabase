extern int __VERIFIER_nondet_int(void);

int main()
{
  int x = 0;
  int y = 0;
  int z = __VERIFIER_nondet_int();
  
  while (x < z)
  {
    if (x == y) { x = 0; y++; z = y+1; } else x++;
  }
}
