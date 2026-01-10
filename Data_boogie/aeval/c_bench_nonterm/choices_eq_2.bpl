function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((x != y))
  {
  a := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    x := x - 1;
    y := y + 1;  } else {
    y := y - 1;
    x := x + 1;  }
  }

}