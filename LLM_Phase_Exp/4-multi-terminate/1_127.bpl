
procedure Thun() returns (x: int, y: int)
{
  while (x >= 0) {
    x := x + y;
    y := -2*y - 1;
    assume (x >= 0);
    x := x + y;
    y := -2*y - 1;

  }
}
