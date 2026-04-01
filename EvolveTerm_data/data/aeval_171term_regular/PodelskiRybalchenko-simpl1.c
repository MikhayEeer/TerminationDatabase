extern int __VERIFIER_nondet_int(void);

int main() {
  int x, y;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  int newx, newy;
  int done = 0;
  while (x > 0 && y > 0 && done==0) {
    if (__VERIFIER_nondet_int() != 0) {
      
      newx = __VERIFIER_nondet_int();
      if (newx >= x) done=1;
      else x = newx;
      
      newy = __VERIFIER_nondet_int();
      if (newy <= y) done=1;
      else y = newy;
      
    } else {
      
      newy = __VERIFIER_nondet_int();
      if (newy >= y) done=1;
      else y = newy;
      
    }
  }
  return 0;
}
