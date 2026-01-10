function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var K: int;
  var N: int;
  x := __VERIFIER_nondet_int();
  K := __VERIFIER_nondet_int();
  N := 2;
  while ((x != K))
  {
  if ((x > K))
  {
    x := (x - N);  } else {
    x := (x + N);  }
  }

}