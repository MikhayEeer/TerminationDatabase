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
  x := (old_y - 2);
  y := (old_x + 1);  }

}