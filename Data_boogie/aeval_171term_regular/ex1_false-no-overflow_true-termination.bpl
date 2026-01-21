function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var r: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  r := 1;
  while ((y > 0))
  {
  r := (r * x);
  y := (y - 1);  }

}