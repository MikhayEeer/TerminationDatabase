extern int __VERIFIER_nondet_int(void);

int main()
{
  int x, y, z;
  x = 0;
  y = 0;
  z = 0;
  
  while (x <= 97) {
    x = y%50 + z%50;
    y = y +1;
    z = z +1;
  }
  return 0;
}
