function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  x := (x * y);
  while ((((x != 0) && (x > 0)) && (y > 0)))
  {
  x := (x - y);  }

}