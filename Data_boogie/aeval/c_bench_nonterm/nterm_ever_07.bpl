function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  x := __VERIFIER_nondet_int();
  while ((x != 10))
  {
  if (((x mod 5) == 1))
  {
    x := (x - 2);  } else {
    x := x - 1;  }
  }

}