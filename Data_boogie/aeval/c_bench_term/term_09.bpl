function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var K: int;
  var x: int;
  var y: int;
  K := __VERIFIER_nondet_int();
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if (!((x < y)))
  {
  }

  while ((y != K))
  {
  if ((x == y))
  {
    if ((x > K))
    {
      x := (x - 1);    } else {
      x := (x + 1);    }

    y := x;  } else {
    y := (y - 1);  }
  }

}