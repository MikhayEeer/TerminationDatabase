function __VERIFIER_nondet_int() returns (int);
procedure reach_error()
{
  __assert_fail("0","Fibonacci01-2.c",3,"reach_error");
}procedure fibonacci(n: int)
{
  if ((n < 1))
  {
  } else {
    if ((n == 1))
    {
    } else {
    }
  }

}procedure main()
{
  var x: int;
  var result: int;
  x := __VERIFIER_nondet_int();
  if ((x > 46))
  {
  }

  if ((x < 1))
  {
  }

  result := fibonacci(x);
  if ((result >= 1))
  {
  } else {
    ERROR:     reach_error();
    abort();  }

}