function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := 1;
  y := __VERIFIER_nondet_int();
  if ((y <= 1))
  {
  }

  while ((x < 10000))
  {
  x := (x * y);  }

}