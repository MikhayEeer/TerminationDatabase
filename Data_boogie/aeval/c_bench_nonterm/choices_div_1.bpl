function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  j := __VERIFIER_nondet_int();
  if ((j < 2))
  {
  }

  while ((j >= 0))
  {
  a := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    j := (j div 2);  } else {
    j := (j - 1);  }
  }

}