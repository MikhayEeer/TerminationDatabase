function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  if ((((10 * y) > z) && (z < 10)))
  {
    while ((x >= 0))
    {
    x := ((x - (10 * y)) + z);    }
  }

}