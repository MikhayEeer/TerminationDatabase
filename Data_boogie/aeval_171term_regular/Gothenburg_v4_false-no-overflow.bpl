function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  var b: int;
  var x: int;
  var y: int;
  a := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (((x >= 0) || ((y >= 0) && (a == b))))
  {
  tmp := (((x + a) - b) - 1);
  x := (((y + b) - a) - 1);
  y := tmp;
  tmp2 := a;
  a := b;
  b := tmp2;  }

}