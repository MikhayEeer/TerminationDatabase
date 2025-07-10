
var x: int;

procedure main() returns (x: int, y: int)
modifies x;
{
  while (true) {
    assume (x >= 0);
    x := x - 1;
  }
}
