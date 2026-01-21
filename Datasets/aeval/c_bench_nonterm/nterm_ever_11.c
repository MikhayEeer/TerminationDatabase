extern int __VERIFIER_nondet_int(void);

int main()
{
  int x, y;
  x = __VERIFIER_nondet_int();
  y = 0;
  
  while (x <= 49) {
    x = y%50;
    y ++;
  }
  return 0;
}
