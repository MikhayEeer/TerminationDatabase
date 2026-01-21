function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var newx: int;
  var newy: int;
  var done: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  done := 0;
  while ((((x > 0) && (y > 0)) && (done == 0)))
  {
  if ((__VERIFIER_nondet_int() != 0))
  {
    newx := __VERIFIER_nondet_int();
    if ((newx >= x))
    {
      done := 1;    } else {
      x := newx;    }

    newy := __VERIFIER_nondet_int();
    if ((newy <= y))
    {
      done := 1;    } else {
      y := newy;    }
  } else {
    newy := __VERIFIER_nondet_int();
    if ((newy >= y))
    {
      done := 1;    } else {
      y := newy;    }
  }
  }

}