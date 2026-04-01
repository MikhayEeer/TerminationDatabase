extern int __VERIFIER_nondet_int(void);

int main() {
  int k, i;
	k = __VERIFIER_nondet_int();
	i = __VERIFIER_nondet_int();
	if (k >= 0) {
		// skip
	} else {
		i = -1;
	}
	while (i >= 0) {
		i = __VERIFIER_nondet_int();
	}
	i = 2;
	return 0;
}
