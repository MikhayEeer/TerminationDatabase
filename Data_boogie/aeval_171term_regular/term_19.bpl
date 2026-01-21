function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := 5;
  while (((x != (2 * y)) && (x > 10)))
  {
  if (((x mod 5) == 1))
  {
    x := (x + 1);  } else {
    x := (x - 2);  }
  }

}