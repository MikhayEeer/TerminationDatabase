function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  i := __VERIFIER_nondet_int();
  while ((i != 0))
  {
  if ((i < 0))
  {
    i := (i + 2);
    if ((i < 0))
    {
      if ((i <= -(2147483648)))
      {
      }

      i := (i * -(1));    }
  } else {
    i := (i - 2);
    if ((i > 0))
    {
      i := (i * -(1));    }
  }
  }

}