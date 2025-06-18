

procedure main() returns (x: int)
{
  assume true;
  while (true) {
    x := 0;
    assume(x > 0);
  }
}

