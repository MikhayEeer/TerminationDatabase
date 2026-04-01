extern int __VERIFIER_nondet_int(void);

int main() {
  int flag, i, range1, range2;
  flag = 1;
  i = __VERIFIER_nondet_int();
  range1 = __VERIFIER_nondet_int();
  range2 = __VERIFIER_nondet_int();

  while (range1 <= i && i <= range2) {
    if (flag == 1 && i < range2) {
      i++;
    } else if (i == range2) {
      flag = -1;
    } else if (flag == -1 && i > range1) {
      i--;
    } else if (i == range1) {
      flag = 1;
    }
  }
  
  return 0;
}
