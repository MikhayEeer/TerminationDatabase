function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  var w: int;
  var c: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  w := ((x + y) + z);
  c := 0;
  while ((w == ((x + y) + z)))
  {
  if ((c < 100))
  {
    y := y - 1;  }

  c := c + 1;
  x := ((x + y) + c);
  z := (z - y);  }

}