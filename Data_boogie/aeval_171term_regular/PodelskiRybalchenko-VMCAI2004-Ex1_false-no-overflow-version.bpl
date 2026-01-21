function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var i: int;
  var j: int;
  var nondetNat: int;
  var nondetPos: int;
  var i1: int;
  var j1: int;
  var nondetNat1: int;
  var nondetPos1: int;
  i := __VERIFIER_nondet_int();
  j := __VERIFIER_nondet_int();
  i1 := __VERIFIER_nondet_int();
  j1 := __VERIFIER_nondet_int();
  while (((((i + i1) - j) - j1) >= 1))
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
  j := (j + nondetPos);
  nondetNat1 := __VERIFIER_nondet_int();
  if ((nondetNat1 < 0))
  {
    nondetNat1 := -(nondetNat1);  }

  i1 := (i1 - nondetNat1);
  nondetPos1 := __VERIFIER_nondet_int();
  if ((nondetPos1 < 0))
  {
    nondetPos1 := -(nondetPos1);  }

  nondetPos1 := (nondetPos1 + 1);
  j1 := (j1 + nondetPos1);  }

}