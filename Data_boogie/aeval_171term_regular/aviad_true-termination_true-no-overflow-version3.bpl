function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  a := __VERIFIER_nondet_int();
  while ((a > 1))
  {
  if (((a mod 10) == 0))
  {
    a := (a div 10);  } else {
    a := (a - 1);  }
  }

}