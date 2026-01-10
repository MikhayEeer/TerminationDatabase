function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  x := 0;
  while ((x < 52352))
  {
  x := (37 * (__VERIFIER_nondet_int() mod 1415));  }

}