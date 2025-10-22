// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2022 Dirk Beyer, Matthias Dangl, Daniel Dietsch, Matthias Heizmann, Thomas Lemberger, and Michael Tautschnig
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined checks) + variable renaming
// Original: separate if statements for error checking
// Transformed: single combined condition with compact names

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "linear-inequality-inv-d_aug2.c", 2, "reach_error"); }
extern unsigned int __VERIFIER_nondet_uint(void);
int main() {
  unsigned int num = __VERIFIER_nondet_uint();
  if (num == 0) {
    return 0;
  }
  unsigned int   val = 0;
  unsigned long  sum = 0;
  unsigned long  i = 0;
  while (i < num) {
    val = __VERIFIER_nondet_uint();
    sum += val;
    ++i;
  }
  // Combined error checks
  if (sum < val || sum > 18446744065119617025ULL) {
    reach_error();
    return 1;
  }
  return 0;
}
