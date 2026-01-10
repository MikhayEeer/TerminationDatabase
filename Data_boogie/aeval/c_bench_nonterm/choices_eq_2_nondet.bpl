function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while ((x != y))
  {
  a := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    x := (x + b);
    y := (y - b);  } else {
    x := (x - b);
    y := (y + b);  }
  }

}