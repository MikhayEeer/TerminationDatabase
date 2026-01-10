function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var y: int;
  var z: int;
  var w: int;
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  w := __VERIFIER_nondet_int();
  while (((((y mod 34) + (z mod 34)) + (w mod 34)) < 100))
  {
  y := (y + 1);
  z := (z + 2);
  w := (w + 3);  }

}