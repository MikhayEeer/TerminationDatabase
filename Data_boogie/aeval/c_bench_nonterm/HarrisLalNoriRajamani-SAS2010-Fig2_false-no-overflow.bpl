function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var d: int;
  var x: int;
  d := 1;
  x := __VERIFIER_nondet_int();
  if (__VERIFIER_nondet_int())
  {
    d := (d - 1);  }

  if (__VERIFIER_nondet_int())
  {
    d := (d - 1);  }

  while ((x > 0))
  {
  x := (x - d);  }

}