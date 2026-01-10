function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  x := __VERIFIER_nondet_int();
  while ((x < 0))
  {
  c := __VERIFIER_nondet_int();
  if ((c == 0))
  {
    x := x + 1;  } else {
    x := x - 1;  }
  }

}