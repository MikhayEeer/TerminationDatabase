function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := 0;
  while ((x > 0))
  {
  if ((y == 2))
  {
    x := (x - 3);  } else {
    x := (x + 1);  }

  if ((y == 2))
  {
    y := 0;  } else {
    y := (y + 1);  }
  }

}