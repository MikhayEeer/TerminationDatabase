function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  var b: int;
  j := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  if ((b <= 1))
  {
  }

  if ((j < 1))
  {
  }

  while ((j < 10))
  {
  j := ((-(2) * j) * b);  }

}