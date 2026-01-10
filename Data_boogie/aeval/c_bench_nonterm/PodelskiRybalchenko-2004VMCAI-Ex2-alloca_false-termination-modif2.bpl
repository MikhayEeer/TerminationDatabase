function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var d: int;
  x := __VERIFIER_nondet_int();
  d := __VERIFIER_nondet_int();
  while (((x >= 0) || (d < 0)))
  {
  d := __VERIFIER_nondet_int();
  x := ((2 * x) + d);  }

}