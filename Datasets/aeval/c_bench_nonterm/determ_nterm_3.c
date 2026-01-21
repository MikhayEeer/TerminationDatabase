int main() {
  int x = -1;
  int y = 2;
  int z = 3;
  
  while (x != 1) {
    x = x + z;
    z = y + z;
    y = y + 2;
  }
  return 0;
}
