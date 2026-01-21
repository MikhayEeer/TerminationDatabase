function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := 1;
  while (((x > 0) && (y > 1)))
  {
  x := (x - y);
  y := (y - z);
  z := -(z);  }

}