function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  var k: int;
  var l: int;
  var tmp: int;
  i := __VERIFIER_nondet_int();
  j := __VERIFIER_nondet_int();
  k := __VERIFIER_nondet_int();
  l := __VERIFIER_nondet_int();
  while (((i <= l) && (j <= k)))
  {
  tmp := i;
  i := j;
  j := (tmp - 1);  }

}