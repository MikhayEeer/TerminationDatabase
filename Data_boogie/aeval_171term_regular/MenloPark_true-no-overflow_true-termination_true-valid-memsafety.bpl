function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := 100;
  z := 1;
  while ((x >= 0))
  {
  x := (x - y);
  y := (y - z);
  z := -(z);  }

}