function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  var d: int;
  j := __VERIFIER_nondet_int();
  d := __VERIFIER_nondet_int();
  while (((j > 0) && (d > 0)))
  {
  if ((0 == __VERIFIER_nondet_int()))
  {
    j := j - 1;  } else {
    d := d - 1;  }
  }

}