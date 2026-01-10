function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var oldx: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((((4 * x) - (5 * y)) > 0))
  {
  oldx := x;
  x := ((2 * oldx) + (4 * y));
  y := (4 * oldx);  }

}