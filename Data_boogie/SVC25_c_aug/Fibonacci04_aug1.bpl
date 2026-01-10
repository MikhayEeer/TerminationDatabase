function __VERIFIER_nondet_int() returns (int);
function fibonacci(fib_n: int) returns (int);
function main() returns (int);
procedure reach_error()
{
  __assert_fail("0","Fibonacci04_aug1.c",3,"reach_error");
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
  var input_value: int;
  var fib_result: int;
  input_value := __VERIFIER_nondet_int();
  if ((input_value > 46))
  {
  }

  fib_result := fibonacci(input_value);
  if (((input_value != 5) || (fib_result == 3)))
  {
  } else {
    ERROR:     reach_error();
    abort();  }

}