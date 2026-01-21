function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  a := __VERIFIER_nondet_int();
  while ((a > 1))
  {
  if (((a mod 2) == 0))
  {
    a := (a div 2);  } else {
    if (((a mod 3) == 0))
    {
      a := (a div 3);    } else {
      a := (a + 1);    }
  }
  }

}