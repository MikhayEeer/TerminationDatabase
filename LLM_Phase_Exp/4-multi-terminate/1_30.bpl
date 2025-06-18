

procedure Copenhagen(c: int) returns (x: int)
{
  var y: int;
  
  while (x >= 0 && y==0) {
    x, y := y-1, x+1;
  }
}

