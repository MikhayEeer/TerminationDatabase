function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var n: int;
  var x: int;
  var m: int;
  if ((n <= 0))
  {
  }

  x := 0;
  m := __VERIFIER_nondet_int();
  while ((x < n))
  {
  if ((m == 1))
  {
    x := (x + 1);  }

  if ((m == 0))
  {
    n := (n - 1);  }
  }

}