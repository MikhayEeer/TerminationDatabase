function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  var k: int;
  i := __VERIFIER_nondet_int();
  j := __VERIFIER_nondet_int();
  k := __VERIFIER_nondet_int();
  while ((((i + j) + k) >= 0))
  {
  if ((__VERIFIER_nondet_int() == 0))
  {
    i := i - 1;  } else {
    j := j + 1;  }

  k := (k - 2);  }

}