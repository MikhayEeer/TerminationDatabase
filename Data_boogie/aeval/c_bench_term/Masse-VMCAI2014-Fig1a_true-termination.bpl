function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  var b: int;
  a := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  while ((a >= 0))
  {
  a := (a + b);
  if ((b >= 0))
  {
    b := (-(b) - 1);  } else {
    b := -(b);  }
  }

}