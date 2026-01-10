function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var z: int;
  z := __VERIFIER_nondet_int();
  while ((z >= 0))
  {
  if (((z mod 5) == 0))
  {
    z := (z - 5);  } else {
    z := z + 1;  }
  }

}