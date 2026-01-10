function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  x := __VERIFIER_nondet_int();
  while ((x >= 0))
  {
  if ((__VERIFIER_nondet_int() != 0))
  {
    x := (x + 1);  } else {
    if ((__VERIFIER_nondet_int() != 0))
    {
      x := (x + 3);    } else {
      if ((__VERIFIER_nondet_int() != 0))
      {
        x := (x + 4);      } else {
        x := -(1);      }
    }
  }
  }

}