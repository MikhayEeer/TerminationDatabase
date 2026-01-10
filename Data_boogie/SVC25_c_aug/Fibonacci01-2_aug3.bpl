function __VERIFIER_nondet_int() returns (int);
procedure reach_error()
{
  __assert_fail("0","Fibonacci01-2_aug3.c",3,"reach_error");
}procedure compute_fibonacci(n_value: int)
{
  if ((n_value < 1))
  {
  } else {
    if ((n_value == 1))
    {
    } else {
    }
  }

}procedure main()
{
  var input_value: int;
  var fibonacci_result: int;
  input_value := __VERIFIER_nondet_int();
  if (((input_value > 46) || (input_value < 1)))
  {
  }

  fibonacci_result := compute_fibonacci(input_value);
  if ((fibonacci_result >= 1))
  {
  } else {
    ERROR:     reach_error();
    abort();  }

}