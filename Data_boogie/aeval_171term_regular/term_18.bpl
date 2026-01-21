function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := 0;
  y := 0;
  z := 0;
  while ((x <= 97))
  {
  x := ((y mod 50) + (z mod 50));
  y := (y + 1);
  z := (z + 1);  }

}