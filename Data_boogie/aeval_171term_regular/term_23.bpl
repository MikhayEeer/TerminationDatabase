function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x != y) && (x >= y)))
  {
  x := x - 1;
  y := (y + 1);
  if ((x < y))
  {
    x := (x + 15);  }
  }

}