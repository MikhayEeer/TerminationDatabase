function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := 5;
  if ((x <= 10))
  {
  }

  while ((x != (2 * y)))
  {
  if (((x mod 5) == 1))
  {
    x := x + 1;  } else {
    x := (x - 2);  }
  }

}