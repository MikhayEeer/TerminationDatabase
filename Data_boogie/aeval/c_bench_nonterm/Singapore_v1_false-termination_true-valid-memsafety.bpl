function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if (!(((-(65535) <= x) && (x <= 65535))))
  {
  }

  if (!(((-(65535) <= y) && (y <= 65535))))
  {
  }

  if (((x + y) > 0))
  {
    while ((x > 0))
    {
    x := ((x + x) + y);
    y := (y - 1);    }
  }

}