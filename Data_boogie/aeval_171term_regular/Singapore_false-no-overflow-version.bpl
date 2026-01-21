function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x > 0) && ((x + y) <= 0)))
  {
  x := ((x + y) + 2);
  y := (y - 1);  }

}