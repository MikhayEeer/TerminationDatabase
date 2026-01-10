function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while ((((x > 0) && (y > 0)) && (z > 0)))
  {
  a := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    x := x - 1;
    y := y + 1;
    z := z + 1;  } else {
    if ((a == 1))
    {
      y := y - 1;
      x := x + 1;
      z := z + 1;    } else {
      y := y + 1;
      x := x + 1;
      z := z - 1;    }
  }
  }

}