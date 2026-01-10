function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := 0;
  y := 0;
  while ((x >= y))
  {
  z := __VERIFIER_nondet_int();
  y := ((y + z) + 1);
  x := ((x + (2 * z)) + 2);  }

}