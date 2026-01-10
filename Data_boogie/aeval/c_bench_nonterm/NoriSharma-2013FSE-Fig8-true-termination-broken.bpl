function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while ((x >= y))
  {
  if ((0 == __VERIFIER_nondet_int()))
  {
    z := (z + 1);
    x := (x + z);  } else {
    y := (y + 1);  }
  }

}