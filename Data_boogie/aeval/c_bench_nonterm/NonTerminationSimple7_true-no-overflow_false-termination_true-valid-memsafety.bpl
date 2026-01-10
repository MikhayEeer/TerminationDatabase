function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var c: int;
  var x: int;
  x := __VERIFIER_nondet_int();
  c := __VERIFIER_nondet_int();
  if ((c == 0))
  {
    while ((x >= 0))
    {
    x := (x + c);    }
  }

}