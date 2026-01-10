function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  var tx: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  tx := __VERIFIER_nondet_int();
  if (!(((-(1073741823) <= tx) && (tx <= 1073741823))))
  {
  }

  if (!(((-(1073741823) <= z) && (z <= 1073741823))))
  {
  }

  if (!(((-(1073741823) <= x) && (x <= 1073741823))))
  {
  }

  if (!((y <= 1073741823)))
  {
  }

  while (((x >= y) && (x <= (tx + z))))
  {
  if ((__VERIFIER_nondet_int() != 0))
  {
    z := (z - 1);
    tx := x;
    x := __VERIFIER_nondet_int();
    if (!(((-(1073741823) <= x) && (x <= 1073741823))))
    {
    }
  } else {
    y := (y + 1);  }
  }

}