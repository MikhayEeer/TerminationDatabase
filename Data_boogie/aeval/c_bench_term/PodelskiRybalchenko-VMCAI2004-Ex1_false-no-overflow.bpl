function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  var nondetNat: int;
  var nondetPos: int;
  i := __VERIFIER_nondet_int();
  j := __VERIFIER_nondet_int();
  while (((i - j) >= 1))
  {
  nondetNat := __VERIFIER_nondet_int();
  if ((nondetNat < 0))
  {
    nondetNat := -(nondetNat);  }

  i := (i - nondetNat);
  nondetPos := __VERIFIER_nondet_int();
  if ((nondetPos < 0))
  {
    nondetPos := -(nondetPos);  }

  nondetPos := (nondetPos + 1);
  j := (j + nondetPos);  }

}