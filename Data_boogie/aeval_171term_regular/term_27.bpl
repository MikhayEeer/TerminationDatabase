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
  while ((x > y))
  {
  x := (x + (c1 div 3));
  y := (y + (c2 div 2));
  c1 := (c1 + 2);
  c2 := (c2 + 3);  }

}