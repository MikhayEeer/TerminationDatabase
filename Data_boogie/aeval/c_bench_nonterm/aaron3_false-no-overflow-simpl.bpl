function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var z: int;
  var tx: int;
  x := __VERIFIER_nondet_int();
  z := __VERIFIER_nondet_int();
  tx := __VERIFIER_nondet_int();
  while ((x <= (tx + z)))
  {
  z := (z - 1);
  tx := x;
  x := __VERIFIER_nondet_int();  }

}