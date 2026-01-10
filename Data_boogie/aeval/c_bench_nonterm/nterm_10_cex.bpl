function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := 0;
  y := __VERIFIER_nondet_int();
  while ((x < 100))
  {
  x := (x + y);
  y := y - 1;  }

}