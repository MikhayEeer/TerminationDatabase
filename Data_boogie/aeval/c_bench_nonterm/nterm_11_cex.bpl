function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  if ((y <= 0))
  {
  }

  if ((z > 0))
  {
  }

  while ((x > 0))
  {
  if ((0 == __VERIFIER_nondet_int()))
  {
    x := (x - y);  } else {
    x := (x + z);  }
  }

}