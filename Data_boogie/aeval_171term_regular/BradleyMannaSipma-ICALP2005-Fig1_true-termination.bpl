function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var N: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  N := __VERIFIER_nondet_int();
  while (((((((N < 536870912) && (x < 536870912)) && (y < 536870912)) && (x >= -(1073741824))) && ((x + y) >= 0)) && (x <= N)))
  {
  if ((__VERIFIER_nondet_int() != 0))
  {
    x := ((2 * x) + y);
    y := (y + 1);  } else {
    x := (x + 1);  }
  }

}