function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if (((x div y) <= 1))
  {
  }

  if ((y <= 0))
  {
  }

  while ((x != y))
  {
  x := x - 1;  }

}