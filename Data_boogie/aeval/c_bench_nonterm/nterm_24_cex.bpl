function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := 0;
  y := 0;
  z := __VERIFIER_nondet_int();
  while ((x < z))
  {
  if ((x == y))
  {
    x := 0;
    y := y + 1;
    z := (y + 1);  } else {
    x := x + 1;  }
  }

}