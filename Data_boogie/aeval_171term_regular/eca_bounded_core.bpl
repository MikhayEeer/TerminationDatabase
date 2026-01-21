function calculate_output(arg0: int) returns (int);
function __VERIFIER_nondet_int() returns (int);
var a17: int;
var a7: int;
var a20: int;
var a8: int;
const a12: int;
axiom a12 == 8;
var a16: int;
var a21: int;
procedure calculate_output(input: int)
{
  if ((((a8 == 15) && (((((a21 == 1) && (((a16 == 5) || (a16 == 6)) && (input == 1))) && (a20 == 1)) && (a17 == 1)) && !((a7 == 1)))) && (a12 == 8)))
  {
    a16 := 5;
    a20 := 0;  } else {
    if ((((((((input == 5) && ((((a16 == 6) && (a17 == 1)) || (!((a17 == 1)) && (a16 == 4))) || (!((a17 == 1)) && (a16 == 5)))) && (a20 == 1)) && (a12 == 8)) && (a7 == 1)) && !((a21 == 1))) && (a8 == 13)))
    {
      a20 := 0;
      a16 := 6;
      a17 := 0;
      a8 := 15;
      a7 := 0;
      a21 := 1;    } else {
      if (((a12 == 8) && ((input == 1) && (((a21 == 1) && (((a8 == 15) && ((!((a17 == 1)) && !((a7 == 1))) && !((a20 == 1)))) && (a16 == 6))) || (!((a21 == 1)) && ((a16 == 4) && ((a8 == 13) && (((a17 == 1) && (a7 == 1)) && (a20 == 1)))))))))
      {
        a7 := 1;
        a17 := 1;
        a21 := 0;
        a20 := 1;
        a8 := 13;
        a16 := 5;      }
    }
  }

  if (((((((!((a17 == 1)) && !((a7 == 1))) && (a20 == 1)) && (a8 == 13)) && (a12 == 8)) && (a16 == 5)) && (a21 == 1)))
  {
    error_39:   }

}procedure main()
{
  var c: int;
  var limit: int;
  a17 := 1;
  a7 := 0;
  a20 := 1;
  a8 := 15;
  a16 := 5;
  a21 := 1;
  c := 0;
  limit := __VERIFIER_nondet_int();
  while ((c < limit))
  {
  input := __VERIFIER_nondet_int();
  if (((((((input != 1) && (input != 2)) && (input != 3)) && (input != 4)) && (input != 5)) && (input != 6)))
  {
  }

  if ((calculate_output(input) != 0))
  {
    c := (c + 1);  }
  }

}