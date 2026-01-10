function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x != 10) && (y != 12)))
  {
  if (((x mod 5) == 1))
  {
    x := (x - 2);  } else {
    x := x - 1;  }

  if (((y mod 6) == 1))
  {
    y := (y - 2);  } else {
    y := y - 1;  }
  }

}