function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x1: int;
  var x2: int;
  var x3: int;
  var d1: int;
  var d2: int;
  var d3: int;
  x1 := __VERIFIER_nondet_int();
  x2 := __VERIFIER_nondet_int();
  x3 := __VERIFIER_nondet_int();
  d1 := 1;
  d2 := 1;
  d3 := 1;
  while ((((x1 > 0) && (x2 > 0)) && (x3 > 0)))
  {
  if ((__VERIFIER_nondet_int() == 0))
  {
    x1 := (x1 - d1);  } else {
    if ((__VERIFIER_nondet_int() == 0))
    {
      x2 := (x2 - d2);    } else {
      x3 := (x3 - d3);    }
  }
  }

}