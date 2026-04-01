// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2022 Dirk Beyer, Matthias Dangl, Daniel Dietsch, Matthias Heizmann, Thomas Lemberger, and Michael Tautschnig
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: n, v, s, i
// Renamed to: loop_count, current_value, accumulator, loop_index

extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "linear-inequality-inv-c_aug1.c", 2, "reach_error"); }
extern unsigned short __VERIFIER_nondet_ushort(void);
int main() {
  unsigned short loop_count = __VERIFIER_nondet_ushort();
  if (loop_count == 0) {
    return 0;
  }
  unsigned short current_value = 0;
  unsigned int  accumulator = 0;
  unsigned int  loop_index = 0;
  while (loop_index < loop_count) {
    current_value = __VERIFIER_nondet_ushort();
    accumulator += current_value;
    ++loop_index;
  }
  if (accumulator < current_value) {
    reach_error();
    return 1;
  }
  if (accumulator > 4294836225) { // (2**16 - 1)**2
    reach_error();
    return 1;
  }
  return 0;
}
