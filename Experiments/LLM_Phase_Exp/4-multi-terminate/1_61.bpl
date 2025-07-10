

procedure MenloPark() returns (x,y,z: int)
{
  while (y < 7 && x >= 0) {
    y := - y + 7;
    x := x - y;
  }
}

