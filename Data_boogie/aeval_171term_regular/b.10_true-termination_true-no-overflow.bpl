function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((((x >= 0) && (y < (2147483647 - x))) || ((x < 0) && (y > (-(2147483648) - x)))) && ((x + y) > 0)))
  {
  if ((x > 0))
  {
    x := (x - 1);  } else {
    if ((y > 0))
    {
      y := (y - 1);    }
  }
  }

}