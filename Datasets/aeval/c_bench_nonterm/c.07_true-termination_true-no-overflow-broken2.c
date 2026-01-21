extern int __VERIFIER_nondet_int(void);

int main() {
  int i, j, k, tmp;
  i = __VERIFIER_nondet_int();
  j = __VERIFIER_nondet_int();
  k = __VERIFIER_nondet_int();
  while ((i <= 100) && (j <= k) && (k > -1073741824)) {
    tmp = i;
    i = j;
    j = tmp;
    k = i + j;
  }
  return 0;
}
