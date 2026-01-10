function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  i := __VERIFIER_nondet_int();
  while (((i * i) > 9))
  {
  if ((i < 0))
  {
    i := (i - 1);  } else {
    i := (i + 1);  }
  }

}