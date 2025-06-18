

procedure main() returns (a: int, b: int, c: int, d: int)
{
	while (a >= 0 || c >= 0) {
		a := a + b;
		b := b + c;
		c := c + d;
		d := d - 1;
	}
}
