function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  var b: int;
  a := -(__VERIFIER_nondet_int());
  b := -(__VERIFIER_nondet_int());
  while ((a > b))
  {
  b := (b + a);
  a := (a + 1);  }

}