function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  x := __VERIFIER_nondet_int();
  while ((x <= 100))
  {
  if ((__VERIFIER_nondet_int() != 0))
  {
    x := ((-(2) * x) + 2);  } else {
    x := ((-(3) * x) - 2);  }
  }

}