function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  j := __VERIFIER_nondet_int();
  i := __VERIFIER_nondet_int();
  while ((((j > 0) && (i > 0)) && (i != j)))
  {
  if ((j < i))
  {
    j := (j - 1);
    i := __VERIFIER_nondet_int();  } else {
    if ((i < j))
    {
      i := (i - 1);
      j := __VERIFIER_nondet_int();    }
  }
  }

}