function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var K: int;
  var x: int;
  var y: int;
  K := __VERIFIER_nondet_int();
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x != K) || (y != K)))
  {
  if ((x > K))
  {
    x := (x - 1);  } else {
    x := (x + 1);  }

  if ((y > K))
  {
    y := (y - 1);  } else {
    y := (y + 1);  }
  }

}