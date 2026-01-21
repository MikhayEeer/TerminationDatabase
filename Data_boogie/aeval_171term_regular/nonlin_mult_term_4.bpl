function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  var d: int;
  var b: int;
  i := 1;
  j := 1;
  d := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  while ((((i >= j) && (b > 1)) && (b > d)))
  {
  i := (i * d);
  j := (j * b);  }

}