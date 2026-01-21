function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((((x > y) && (y <= (2147483647 - x))) && (x > 0)))
  {
  y := (y + x);  }

}