procedure main()
{
  var x: int;
  var y: int;
  var z: int;
  x := 5;
  y := 1;
  z := 17;
  while (!(((x == y) && (y == z))))
  {
  x := (x + 1);
  y := (y * 2);
  z := (z - 3);  }

}