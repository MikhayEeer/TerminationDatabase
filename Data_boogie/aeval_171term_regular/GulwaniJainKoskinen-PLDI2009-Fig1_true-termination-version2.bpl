function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var id: int;
  var maxId: int;
  var tmp: int;
  id := __VERIFIER_nondet_int();
  maxId := __VERIFIER_nondet_int();
  if (((0 <= id) && (id < maxId)))
  {
    tmp := (id + 1);
    while ((tmp != id))
    {
    if ((tmp <= maxId))
    {
      tmp := (tmp + 1);    } else {
      tmp := -(tmp);    }
    }
  }

}