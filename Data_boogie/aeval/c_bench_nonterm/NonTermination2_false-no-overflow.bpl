function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var oldx: int;
  x := __VERIFIER_nondet_int();
  while (((x > 1) && (x >= (2 * oldx))))
  {
  oldx := x;
  x := __VERIFIER_nondet_int();  }

}