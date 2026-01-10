function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  x := __VERIFIER_nondet_int();
  while ((x != 0))
  {
  if ((x < 10))
  {
    x := x + 1;  } else {
    x := __VERIFIER_nondet_int();  }
  }

}