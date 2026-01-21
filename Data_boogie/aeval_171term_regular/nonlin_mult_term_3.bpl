function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  while (((((x < 1000000) && (x > 1)) && (y > 1)) && (z > 1)))
  {
  x := ((x * y) * z);  }

}