function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var loop_counter: int;
  loop_counter := __VERIFIER_nondet_int();
  while ((loop_counter > 0))
  {
  if ((loop_counter != 5))
  {
    loop_counter := (loop_counter - 1);  }
  }

}