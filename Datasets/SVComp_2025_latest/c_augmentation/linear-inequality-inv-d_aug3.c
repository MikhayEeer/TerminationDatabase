// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2022 Dirk Beyer, Matthias Dangl, Daniel Dietsch, Matthias Heizmann, Thomas Lemberger, and Michael Tautschnig
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: loop increment transformation + variable renaming
// Original: prefix increment (++i)
// Transformed: postfix increment (i++) with descriptive names

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "linear-inequality-inv-d_aug3.c", 2, "reach_error"); }
extern unsigned int __VERIFIER_nondet_uint(void);
int main() {
  unsigned int limit = __VERIFIER_nondet_uint();
  if (limit == 0) {
    return 0;
  }
  unsigned int   value = 0;
  unsigned long  accumulator = 0;
  unsigned long  index = 0;
  while (index < limit) {
    value = __VERIFIER_nondet_uint();
    accumulator += value;
    index++;  // Postfix increment instead of prefix
  }
  if (accumulator < value) {
    reach_error();
    return 1;
  }
  if (accumulator > 18446744065119617025ULL) { // (2**32 - 1)**2
    reach_error();
    return 1;
  }
  return 0;
}
