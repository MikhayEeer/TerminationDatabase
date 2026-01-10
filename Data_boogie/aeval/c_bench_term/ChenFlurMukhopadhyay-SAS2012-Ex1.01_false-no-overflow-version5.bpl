function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if (((x <= 0) || (y <= 0)))
  {
  }

  while ((x > 0))
  {
  x := (((-(5) * x) - (6 * y)) + 18);  }

}