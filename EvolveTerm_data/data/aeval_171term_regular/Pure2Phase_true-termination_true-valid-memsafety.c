extern int __VERIFIER_nondet_int(void);

int main()
{
  int y, z;
	y = __VERIFIER_nondet_int();
	z = __VERIFIER_nondet_int();
  //prevent overflow

	while (z >= 0 &&
	(z<=1073741823)&&
	(-1073741823<=y && y<=1073741823)) {
		y = y - 1;
		if (y >= 0) {
			z = __VERIFIER_nondet_int();
      		//prevent overflow
      		if(!(z<=1073741823)) 
				return 0;
		} else {
			z = z - 1;
		}
	}
	return 0;
}
