function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  if (((x > z) || (y > z)))
  {
  }

  while ((x != y))
  {
  x := x + 1;
  y := y + 1;
  if ((x > z))
  {
    x := z;  }

  if ((y > z))
  {
    y := (y - 1);  }
  }

}