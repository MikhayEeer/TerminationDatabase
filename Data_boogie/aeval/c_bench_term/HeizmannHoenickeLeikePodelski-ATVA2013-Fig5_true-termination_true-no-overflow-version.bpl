function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := 3;
  while ((x >= 0))
  {
  x := (x - y);
  y := ((y + 2) div 3);  }

}