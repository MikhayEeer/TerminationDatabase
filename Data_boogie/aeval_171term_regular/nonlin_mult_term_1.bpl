function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := 1;
  y := __VERIFIER_nondet_int();
  while (((x < 10000) && (y > 1)))
  {
  x := (x * y);  }

}