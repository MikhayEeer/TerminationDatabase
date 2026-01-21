function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  if ((0 == __VERIFIER_nondet_int()))
  {
    x := 1;  } else {
    x := -(1);  }

  while (((y < 100) && (z < 100)))
  {
  y := (y + x);
  z := (z - x);  }

}