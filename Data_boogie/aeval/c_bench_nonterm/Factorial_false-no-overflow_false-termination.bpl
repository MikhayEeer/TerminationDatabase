function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  var i: int;
  var fac: int;
  j := __VERIFIER_nondet_int();
  i := 1;
  fac := 1;
  while ((fac != j))
  {
  fac := (fac * i);
  i := (i + 1);  }

}