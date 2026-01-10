function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := ((7 * x) + 19);
  while ((y > 0))
  {
  if ((__VERIFIER_nondet_int() == 0))
  {
    y := ((y + (24 * x)) + 7);  } else {
    x := x - 1;  }
  }

}