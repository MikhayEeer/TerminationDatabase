// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2022 Dirk Beyer, Matthias Dangl, Daniel Dietsch, Matthias Heizmann, Thomas Lemberger, and Michael Tautschnig
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined error checks) + variable renaming
// Original: two separate error checks
// Transformed: combined with logical OR and shorter names

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "linear-inequality-inv-c_aug2.c", 2, "reach_error"); }
extern unsigned short __VERIFIER_nondet_ushort(void);
int main() {
  unsigned short cnt = __VERIFIER_nondet_ushort();
  if (cnt == 0) {
    return 0;
  }
  unsigned short val = 0;
  unsigned int  sum = 0;
  unsigned int  idx = 0;
  while (idx < cnt) {
    val = __VERIFIER_nondet_ushort();
    sum += val;
    ++idx;
  }
  // Combined error condition check
  if (sum < val || sum > 4294836225) {
    reach_error();
    return 1;
  }
  return 0;
}
