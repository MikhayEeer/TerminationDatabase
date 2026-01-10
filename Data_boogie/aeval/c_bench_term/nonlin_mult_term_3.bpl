function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  if ((x <= 1))
  {
  }

  if ((y <= 1))
  {
  }

  if ((z <= 1))
  {
  }

  while ((x < 1000000))
  {
  x := ((x * y) * z);  }

}