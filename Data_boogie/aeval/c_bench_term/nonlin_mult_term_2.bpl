function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if ((x <= 0))
  {
  }

  if ((y <= 1))
  {
  }

  while ((x < 10000))
  {
  x := (x * y);  }

}