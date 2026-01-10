function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  a := __VERIFIER_nondet_int();
  while ((a >= 1))
  {
  if (((a mod 5) == 0))
  {
    a := ((a div 5) + 1);  } else {
    a := (a + 2);  }
  }

}