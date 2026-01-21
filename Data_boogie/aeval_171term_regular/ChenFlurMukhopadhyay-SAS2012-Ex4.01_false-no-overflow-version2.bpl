function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  var n: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  n := __VERIFIER_nondet_int();
  while (((((x + y) >= 0) && (x <= n)) && (z != 0)))
  {
  x := ((2 * x) - y);
  y := z;
  z := (-(2) * z);  }

}