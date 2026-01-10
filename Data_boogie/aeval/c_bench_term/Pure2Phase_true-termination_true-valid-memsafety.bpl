function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var y: int;
  var z: int;
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  if (!(((-(1073741823) <= y) && (y <= 1073741823))))
  {
  }

  if (!((z <= 1073741823)))
  {
  }

  while ((z >= 0))
  {
  y := (y - 1);
  if ((y >= 0))
  {
    z := __VERIFIER_nondet_int();
    if (!((z <= 1073741823)))
    {
    }
  } else {
    z := (z - 1);  }
  }

}