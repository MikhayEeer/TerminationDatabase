function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var n: int;
  var b: int;
  var t: int;
  x := __VERIFIER_nondet_int();
  n := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  if ((b >= 1))
  {
    t := 1;  } else {
    t := -(1);  }

  while ((x <= n))
  {
  if ((b >= 1))
  {
    x := (x + t);  } else {
    x := (x - t);  }
  }

}