function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((((0 != (x mod y)) && (x > y)) && (y > 1)))
  {
  y := y - 1;  }

}