function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  var w: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  w := __VERIFIER_nondet_int();
  while (((((x > 0) && (y > 0)) && (z > 0)) && (w > 0)))
  {
  a := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    x := x - 1;
    y := y + 1;
    z := z + 1;
    w := w + 1;  } else {
    if ((a == 1))
    {
      x := x + 1;
      y := y - 1;
      z := z + 1;
      w := w + 1;    } else {
      if ((a == 2))
      {
        x := x + 1;
        y := y + 1;
        z := z - 1;
        w := w + 1;      } else {
        x := x + 1;
        y := y + 1;
        z := z + 1;
        w := w - 1;      }
    }
  }
  }

}