function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var c: int;
  var i: int;
  var j: int;
  var k: int;
  var tmp: int;
  i := __VERIFIER_nondet_int();
  j := __VERIFIER_nondet_int();
  k := __VERIFIER_nondet_int();
  tmp := __VERIFIER_nondet_int();
  while ((i <= 100))
  {
  tmp := i;
  i := j;
  j := (tmp + 1);  }

}