// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2022 Dirk Beyer, Matthias Dangl, Daniel Dietsch, Matthias Heizmann, Thomas Lemberger, and Michael Tautschnig
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: n, v, s, i
// Renamed to: iterations, elem_value, total_sum, counter

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "linear-inequality-inv-d_aug1.c", 2, "reach_error"); }
extern unsigned int __VERIFIER_nondet_uint(void);
int main() {
  unsigned int iterations = __VERIFIER_nondet_uint();
  if (iterations == 0) {
    return 0;
  }
  unsigned int   elem_value = 0;
  unsigned long  total_sum = 0;
  unsigned long  counter = 0;
  while (counter < iterations) {
    elem_value = __VERIFIER_nondet_uint();
    total_sum += elem_value;
    ++counter;
  }
  if (total_sum < elem_value) {
    reach_error();
    return 1;
  }
  if (total_sum > 18446744065119617025ULL) { // (2**32 - 1)**2
    reach_error();
    return 1;
  }
  return 0;
}
