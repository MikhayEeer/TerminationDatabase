function __VERIFIER_nondet_int() returns (int);
procedure reach_error()
{
  __assert_fail("0","Fibonacci04_aug2.c",3,"reach_error");
}procedure fibonacci_inline(n: int)
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
  var x_val: int;
  var res: int;
  x_val := __VERIFIER_nondet_int();
  if ((x_val > 46))
  {
  }

  res := fibonacci_inline(x_val);
  if (((x_val != 5) || (res == 3)))
  {
  } else {
    ERROR:     reach_error();
    abort();  }

}