function __VERIFIER_nondet_int() returns (int);
procedure main()
{
  var flag: int;
  var i: int;
  var j: int;
  var range1: int;
  var range2: int;
  flag := 1;
  i := 0;
  j := 0;
  range1 := __VERIFIER_nondet_int();
  range2 := -(range1);
  if ((range1 >= 0))
  {
  }

  while (((range1 <= j) && (j <= range2)))
  {
  if (((flag == 1) && (i < range2)))
  {
    i := i + 1;  } else {
    if ((i == range2))
    {
      flag := -(1);    } else {
      if (((flag == -(1)) && (i > range1)))
      {
        i := i - 1;      } else {
        if ((i == range1))
        {
          flag := 1;        }
      }
    }
  }

  j := i;  }

}