extern int __VERIFIER_nondet_int(void);

int main() {
  int x, y, N;
  x = __VERIFIER_nondet_int();
  y = __VERIFIER_nondet_int();
  N = __VERIFIER_nondet_int();

    while (x <= N) {
      if (__VERIFIER_nondet_int() != 0) {
			    	x = 2*x + y;
				    y = y + 1;
      } else {
	    			x = x + 1;
      }
    }
  
  return 0;
}
