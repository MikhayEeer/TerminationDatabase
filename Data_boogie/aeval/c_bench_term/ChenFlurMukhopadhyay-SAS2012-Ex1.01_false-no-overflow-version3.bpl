function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x < 0) && (y > 0)))
  {
  x := ((-(3) * x) - 17);
  y := ((-(4) * y) + 8);  }

}