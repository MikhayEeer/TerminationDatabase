function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var n: int;
  var b: int;
  n := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((((x >= 0) && (0 <= y)) && (y <= n)))
  {
  if ((b == 0))
  {
    y := (y + 1);
    if ((__VERIFIER_nondet_int() != 0))
    {
      b := 1;    }
  } else {
    y := (y - 1);
    if ((__VERIFIER_nondet_int() != 0))
    {
      x := (x - 1);
      b := 0;    }
  }
  }

}