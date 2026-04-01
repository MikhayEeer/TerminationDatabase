extern int __VERIFIER_nondet_int(void);

int main()
{
    int c, x;
	x = __VERIFIER_nondet_int();
	c = __VERIFIER_nondet_int();
	while (x + c >= 0 && (c >= 2)) {

		    x = x - c;
		    c = c + 1;
	}
	return 0;
}
