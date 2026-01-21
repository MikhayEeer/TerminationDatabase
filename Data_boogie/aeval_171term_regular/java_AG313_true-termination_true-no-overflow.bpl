function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var x: int;
  var y: int;
  i := 0;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((((x > 0) && (y > 0)) && (x != 0)))
  {
  i := (i + 1);
  x := ((x - 1) - (y - 1));  }

}