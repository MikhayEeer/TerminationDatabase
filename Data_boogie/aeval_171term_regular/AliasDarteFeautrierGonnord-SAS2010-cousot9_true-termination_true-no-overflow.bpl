function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  var N: int;
  j := __VERIFIER_nondet_int();
  N := __VERIFIER_nondet_int();
  i := N;
  while ((i > 0))
  {
  if ((j > 0))
  {
    j := (j - 1);  } else {
    j := N;
    i := (i - 1);  }
  }

}