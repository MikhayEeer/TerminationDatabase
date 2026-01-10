function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if ((y > 0))
  {
  }

  while ((x != 0))
  {
  if ((x < 10))
  {
    x := x + 1;  } else {
    x := y;  }
  }

}