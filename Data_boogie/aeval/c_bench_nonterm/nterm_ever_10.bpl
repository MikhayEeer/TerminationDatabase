function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x div 50) == y))
  {
  z := __VERIFIER_nondet_int();
  x := (x + (50 * z));
  y := (y + z);  }

}