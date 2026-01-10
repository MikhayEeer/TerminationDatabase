function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x > 0) && (y > 0)))
  {
  y := (y - x);
  if ((y < 0))
  {
    x := (x - 1);
    y := __VERIFIER_nondet_int();  }
  }

}