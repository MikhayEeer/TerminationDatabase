// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2019 Dirk Beyer and Matthias Dangl
//
// SPDX-License-Identifier: Apache-2.0

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));
void reach_error() { __assert_fail("0", "eq2.c", 3, "reach_error"); }
extern unsigned int __VERIFIER_nondet_uint(void);
void __VERIFIER_assert(int cond) {
  if (!(cond)) {
    ERROR: {reach_error();abort();}
  }
  return;
}
int main(void) {
  unsigned int w = __VERIFIER_nondet_uint();
  unsigned int x = w;
  unsigned int y = w + 1;
  unsigned int z = x + 1;
  while (__VERIFIER_nondet_uint()) {
    y++;
    z++;
  }
  __VERIFIER_assert(y == z);
  return 0;
}
