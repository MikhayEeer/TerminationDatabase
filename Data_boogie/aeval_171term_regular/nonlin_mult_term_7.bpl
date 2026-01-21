function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  var b: int;
  j := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  while (((j < 100) && (b > 1)))
  {
  if ((j <= 0))
  {
    j := 1;  } else {
    j := (j * b);  }
  }

}