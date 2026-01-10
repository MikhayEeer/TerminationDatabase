function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var r: int;
  var da: int;
  var db: int;
  var temp: int;
  r := __VERIFIER_nondet_int();
  if ((r >= 0))
  {
    da := (2 * r);
    db := (2 * r);
    while ((da >= r))
    {
    if ((__VERIFIER_nondet_int() != 0))
    {
      da := (da - 1);    } else {
      da := (db - 1);
      db := da;    }
    }
  }

}