function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if ((x != (y + 1)))
  {
  }

  while ((x != y))
  {
  x := (x - 3);
  y := (y - 1);  }

}