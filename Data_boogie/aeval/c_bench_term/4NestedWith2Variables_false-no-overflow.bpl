function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  var b: int;
  var olda: int;
  a := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  while ((a > 0))
  {
  olda := a;
  a := ((3 * olda) - (4 * b));
  b := ((4 * olda) + (3 * b));  }

}