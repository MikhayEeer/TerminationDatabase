function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var x: int;
  var y: int;
  x := 0;
  y := 0;
  while ((x < 49))
  {
  x := (y mod 50);
  y := y + 1;  }

}