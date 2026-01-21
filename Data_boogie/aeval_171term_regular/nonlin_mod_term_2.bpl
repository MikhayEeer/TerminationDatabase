function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x > y) && (y > 1)))
  {
  if ((0 == __VERIFIER_nondet_int()))
  {
    x := (x mod y);  } else {
    x := (x - y);  }
  }

}