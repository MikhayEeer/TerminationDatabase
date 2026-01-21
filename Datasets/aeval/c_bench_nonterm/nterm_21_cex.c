extern int __VERIFIER_nondet_int(void);

int main() {
  int i, j, k, l, tmp;
  i = __VERIFIER_nondet_int();
  j = __VERIFIER_nondet_int();
  k = __VERIFIER_nondet_int();
  l = __VERIFIER_nondet_int();
  while ((i <= l) && (j <= k)) {
    tmp = i;
    i = j;
    j = tmp - 1;
  }
  return 0;
}
