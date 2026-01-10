function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var y: int;
  var x: int;
  y := __VERIFIER_nondet_int();
  x := (y + 42);
  while ((x >= 0))
  {
  y := ((2 * y) - x);
  x := ((y + x) div 2);  }

}