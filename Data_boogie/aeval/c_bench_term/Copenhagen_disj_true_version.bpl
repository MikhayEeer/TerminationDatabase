function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  var oldx: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while ((((x >= 0) || (y >= 0)) || (z >= 0)))
  {
  oldx := x;
  x := (y - 1);
  y := (z - 1);
  z := (oldx - 1);  }

}