extern int __VERIFIER_nondet_int(void);

int main() {
  int flag, i, range1, range2;
  flag = 1;
  i = __VERIFIER_nondet_int();
  range1 = __VERIFIER_nondet_int();
  range2 = __VERIFIER_nondet_int();
  if (range1 >= 0 || range2 <= 0)  return 0;
  
  while (range1 <= i && i <= range2) {
    if (flag == 1 && i < range2) {
      i++;
    } else if (i == range2) {
      flag = -1;
      range1 = range1 * 2;
    } else if (flag == -1 && i > range1) {
      i--;
    } else if (i == range1) {
      flag = 1;
      range2 = range2 * 2;
    }
  }
  
  return 0;
}
