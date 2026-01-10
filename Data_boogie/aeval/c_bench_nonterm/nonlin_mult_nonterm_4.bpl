function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  var b: int;
  j := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  if ((b <= 1))
  {
  }

  while ((j < 100))
  {
  if ((j < 0))
  {
    j := 1;  } else {
    j := (j * b);  }
  }

}