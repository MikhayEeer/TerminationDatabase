function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var a: int;
  var b: int;
  var am: int;
  var bm: int;
  a := __VERIFIER_nondet_int();
  b := __VERIFIER_nondet_int();
  am := a;
  bm := b;
  while ((am != bm))
  {
  if ((am > bm))
  {
    bm := (bm + b);  } else {
    am := (am + a);  }
  }

}