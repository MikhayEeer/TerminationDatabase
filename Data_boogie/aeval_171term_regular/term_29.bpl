function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  var N: int;
  x := 0;
  y := 0;
  z := 1;
  N := __VERIFIER_nondet_int();
  while ((x < N))
  {
  if (((__VERIFIER_nondet_int() == 0) && (z == 1)))
  {
    y := 5;
    z := 0;  } else {
    if (((__VERIFIER_nondet_int() == 0) && (z == 0)))
    {
      y := -(3);
      z := 1;    } else {
      if (((__VERIFIER_nondet_int() == 0) && (z == 1)))
      {
        y := 7;
        z := 0;      } else {
        if (((__VERIFIER_nondet_int() == 0) && (z == 0)))
        {
          y := -(2);
          z := 1;        } else {
          y := 1;        }
      }
    }
  }

  x := (x + y);  }

}