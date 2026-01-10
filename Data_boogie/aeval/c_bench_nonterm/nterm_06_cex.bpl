function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while ((z > 0))
  {
  x := x + 1;
  y := y - 1;
  if ((__VERIFIER_nondet_int() == 0))
  {
    z := (z + (4 * x));  } else {
    z := (z + (5 * y));  }
  }

}