function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((((x < 10000) && (x > 0)) && (y > 1)))
  {
  x := (x * y);  }

}