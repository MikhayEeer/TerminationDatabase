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

  while ((j >= 0))
  {
  a := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    j := (j div 2);  } else {
    j := (j - d);  }
  }

}