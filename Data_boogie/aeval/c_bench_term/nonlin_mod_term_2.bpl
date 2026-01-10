function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if ((x <= y))
  {
  }

  if ((y <= 1))
  {
  }

  while ((x > y))
  {
  if ((0 == __VERIFIER_nondet_int()))
  {
    x := (x mod y);  } else {
    x := (x - y);  }
  }

}