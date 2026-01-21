function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while (((x >= 0) && (((10 * y) > z) && (z < 10))))
  {
  x := ((x - (10 * y)) + z);  }

}