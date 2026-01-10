function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := 0;
  while ((x > 0))
  {
  x := (x - y);
  y := (y - z);
  if ((z == 2))
  {
    z := 0;  } else {
    z := z + 1;  }
  }

}