function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((x != y))
  {
  if ((x > 0))
  {
    x := x - 1;  } else {
    x := x + 1;  }

  if ((x < y))
  {
    y := y + 1;  } else {
    if ((x > y))
    {
      y := y - 1;    }
  }
  }

}