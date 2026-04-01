extern int __VERIFIER_nondet_int(void);

int main()
{
    int x, y, oldx;
    x = __VERIFIER_nondet_int();
    y = __VERIFIER_nondet_int();
    //prevent overflows
	while ((x >= 0 || y >= 0)&&
        (-1073741823<=x && x<=1073741823) &&
        (-1073741823<=y && y<=1073741823)
    ) {
		oldx = x;
		x = y - 1;
		y = oldx - 1;
	}
	return 0;
}
