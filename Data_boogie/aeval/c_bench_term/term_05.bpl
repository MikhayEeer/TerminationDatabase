function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  var d: int;
  j := __VERIFIER_nondet_int();
  d := __VERIFIER_nondet_int();
  if ((j <= d))
  {
  }

  if ((d <= 1))
  {
  }

  while ((j > d))
  {
  j := (j mod 2);  }

}