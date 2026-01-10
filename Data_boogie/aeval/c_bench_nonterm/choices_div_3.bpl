function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var j: int;
  j := __VERIFIER_nondet_int();
  if ((j < 10))
  {
  }

  while ((j >= 0))
  {
  a := __VERIFIER_nondet_int();
  if ((a == 0))
  {
    j := (j div 2);  } else {
    if ((a == 1))
    {
      j := ((j div 3) + 1);    } else {
      j := -(90);    }
  }
  }

}