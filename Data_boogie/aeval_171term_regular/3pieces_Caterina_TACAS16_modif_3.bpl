function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var N: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  N := __VERIFIER_nondet_int();
  while (((x != 0) && ((y <= 0) && (N > 0))))
  {
  if ((x < N))
  {
    x := (x + 1);  } else {
    x := y;  }
  }

}