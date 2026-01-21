extern int __VERIFIER_nondet_int(void);

int main() {
  int flag, i, j, range1, range2;
  flag = 1;
  i = 0;
  j = 0;
  range1 = __VERIFIER_nondet_int();
  range2 = -range1;
  if (range1 >= 0)  return 0;
  
  while (range1 <= j && j <= range2) {
    if (flag == 1 && i < range2) {
      i++;
    } else if (i == range2) {
      flag = -1;
    } else if (flag == -1 && i > range1) {
      i--;
    } else if (i == range1) {
      flag = 1;
    }
    j = i;
  }
  
  return 0;
}
