function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  i := __VERIFIER_nondet_int();
  j := __VERIFIER_nondet_int();
  while (((i * j) > 0))
  {
  i := (i - 1);
  j := (j - 1);  }

}