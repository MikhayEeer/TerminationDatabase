function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  var oldx: int;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((((x >= 0) || (y >= 0)) && ((-(1073741823) <= x) && (x <= 1073741823))) && ((-(1073741823) <= y) && (y <= 1073741823))))
  {
  oldx := x;
  x := (y - 1);
  y := (oldx - 1);  }

}