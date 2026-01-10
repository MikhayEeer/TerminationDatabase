function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var w: int;
  i := __VERIFIER_nondet_int();
  w := __VERIFIER_nondet_int();
  if ((w <= 0))
  {
  }

  while ((i != 0))
  {
  if ((i < -(w)))
  {
    i := (i - 1);
    i := (i * -(1));  } else {
    if ((i > w))
    {
      i := (i + 1);
      i := (i * -(1));    } else {
      i := 0;    }
  }

  w := (w + 1);  }

}