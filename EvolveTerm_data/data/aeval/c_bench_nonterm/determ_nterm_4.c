int main() {
  int a;
  int b;
  int c;
  a = 1;
  b = 2;
  c = 3;
  
  while (a + b + c < 10) {
    a = a - b;
    b = a + b;
    c = c + a;
    a = b - a;
  }
  
  return 0;
}
