function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((x == (3 * y)))
  {
  y := (x + y);
  if ((__VERIFIER_nondet_int() == 0))
  {
    x := (4 * x);  } else {
    x := (y + 1);  }
  }

}