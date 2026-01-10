function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while ((((x * y) * z) == 0))
  {
  if ((__VERIFIER_nondet_int() == 0))
  {
    x := 0;  } else {
    if ((__VERIFIER_nondet_int() == 0))
    {
      y := 0;    } else {
      z := 0;    }
  }
  }

}