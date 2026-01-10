function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  i := __VERIFIER_nondet_int();
  while ((i != 0))
  {
  if (((i > -(5)) && (i < 5)))
  {
    if ((i < 0))
    {
      i := (i + 1);    }

    if ((i > 0))
    {
      i := (i - 1);    }
  }
  }

}