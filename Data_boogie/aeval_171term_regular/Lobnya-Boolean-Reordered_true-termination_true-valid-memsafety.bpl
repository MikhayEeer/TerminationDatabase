function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var b: int;
  x := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  if ((x >= -(2147483647)))
  {
    while ((b != 0))
    {
    b := __VERIFIER_nondet_int();
    x := (x - 1);
    if ((x >= 0))
    {
      b := 1;    } else {
      b := 0;    }
    }
  }

}