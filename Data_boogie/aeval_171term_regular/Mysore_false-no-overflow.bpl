function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var c: int;
  var x: int;
  x := __VERIFIER_nondet_int();
  c := __VERIFIER_nondet_int();
  while ((((x + c) >= 0) && (c >= 2)))
  {
  x := (x - c);
  c := (c + 1);  }

}