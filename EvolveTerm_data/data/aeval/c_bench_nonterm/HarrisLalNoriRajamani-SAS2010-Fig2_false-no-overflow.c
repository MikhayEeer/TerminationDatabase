extern int __VERIFIER_nondet_int(void);

// GF: dead code removed

int main() {
	int d = 1;
	int x = __VERIFIER_nondet_int();

	if (__VERIFIER_nondet_int()) {
		d = d - 1;
	}

	if (__VERIFIER_nondet_int()) {
		d = d - 1;
	}

	while (x > 0) {
		x = x - d;
	}
	return 0;
}
