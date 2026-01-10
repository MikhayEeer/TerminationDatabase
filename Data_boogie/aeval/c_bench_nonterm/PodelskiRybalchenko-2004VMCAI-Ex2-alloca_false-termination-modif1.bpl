function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var d: int;
  x := __VERIFIER_nondet_int();
  d := __VERIFIER_nondet_int();
  if ((d <= 1))
  {
  }

  while ((x > 0))
  {
  x := ((2 * x) + d);  }

}