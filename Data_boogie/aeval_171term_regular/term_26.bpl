function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var c1: int;
  var c2: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  c1 := 0;
  c2 := 0;
  while ((x == y))
  {
  x := (x + (c1 mod 2));
  y := (y + (c2 mod 3));
  c1 := (c1 + 1);
  c2 := (c2 + 1);  }

}