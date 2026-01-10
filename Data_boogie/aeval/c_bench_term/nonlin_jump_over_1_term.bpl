function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if ((y <= 1))
  {
  }

  while ((x >= y))
  {
  if (((x mod y) == 1))
  {
    x := x + 1;  } else {
    x := (x - 2);  }
  }

}