function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var c: int;
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  c := 0;
  while (((((x >= 0) && (y < (2147483647 - x))) || ((x < 0) && (y > (-(2147483648) - x)))) && ((x + y) > 0)))
  {
  if ((x > y))
  {
    x := (x - 1);  } else {
    if ((x == y))
    {
      x := (x - 1);    } else {
      y := (y - 1);    }
  }
  }

}