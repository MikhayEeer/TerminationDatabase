function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var oldx: int;
  x := __VERIFIER_nondet_int();
  while ((((x > 0) && (x < 100)) && (x >= ((2 * oldx) + 10))))
  {
  oldx := x;
  x := __VERIFIER_nondet_int();  }

}