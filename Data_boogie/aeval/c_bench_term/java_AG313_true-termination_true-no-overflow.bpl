function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var x: int;
  var y: int;
  i := 0;
  x := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  if ((x != 0))
  {
    while (((x > 0) && (y > 0)))
    {
    i := (i + 1);
    x := ((x - 1) - (y - 1));    }
  }

}