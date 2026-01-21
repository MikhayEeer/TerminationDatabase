function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var x: int;
  var y: int;
  var n: int;
  i := 0;
  x := 0;
  y := 0;
  n := __VERIFIER_nondet_int();
  i := 0;
  while ((i < n))
  {
    x := (x - y);
    y := __VERIFIER_nondet_int();
    x := (x + y);
    i := (i + 1);
  }
}