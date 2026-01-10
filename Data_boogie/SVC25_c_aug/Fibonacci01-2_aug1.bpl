function __VERIFIER_nondet_int() returns (int);
procedure reach_error()
{
  __assert_fail("0","Fibonacci01-2_aug1.c",3,"reach_error");
}procedure fibonacci(fib_n: int)
{
  if ((fib_n < 1))
  {
  } else {
    if ((fib_n == 1))
    {
    } else {
    }
  }

}procedure main()
{
  var user_input: int;
  var fib_result: int;
  user_input := __VERIFIER_nondet_int();
  if ((user_input > 46))
  {
  }

  if ((user_input < 1))
  {
  }

  fib_result := fibonacci(user_input);
  if ((fib_result >= 1))
  {
  } else {
    ERROR:     reach_error();
    abort();  }

}