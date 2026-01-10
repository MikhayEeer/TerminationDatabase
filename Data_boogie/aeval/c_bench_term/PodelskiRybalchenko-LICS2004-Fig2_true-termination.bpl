function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x > 0) && (y > 0)))
  {
  old_x := x;
  old_y := y;
  if ((0 == __VERIFIER_nondet_int()))
  {
    x := (old_x - 1);
    y := old_x;  } else {
    x := (old_y - 2);
    y := (old_x + 1);  }
  }

}