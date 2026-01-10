function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := 1;
  while ((x >= 0))
  {
  x := ((x - y) + 1);
  y := ((y + 1) div 2);  }

}