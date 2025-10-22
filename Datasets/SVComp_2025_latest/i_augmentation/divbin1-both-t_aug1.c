// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: A, B, q, r, b, c, k
// Renamed to: num_a, num_b, quotient, remainder, divisor, counter, limit

extern int __VERIFIER_nondet_int(void);
extern unsigned __VERIFIER_nondet_uint(void);
int main() {
  unsigned num_a, num_b;
  unsigned quotient, remainder, divisor;
  int counter = 0, limit = __VERIFIER_nondet_int();
  num_a = __VERIFIER_nondet_uint();
  num_b = __VERIFIER_nondet_uint();
  if (num_b >= (0x7fffffff * 2U + 1U)/2) return 0;
  if ( num_b < 1 ) return 0;
  if (num_a >= (0x7fffffff * 2U + 1U)/2) return 0;
    quotient = 0;
    remainder = num_a;
    divisor = num_b;
    while (remainder >= divisor) {
      divisor = 2 * divisor;
    }
    while (quotient * divisor + remainder - num_a + counter <=limit) {
        quotient = 2 * quotient;
        divisor = divisor / 2;
        if (remainder >= divisor) {
            quotient = quotient + 1;
            remainder = remainder - divisor;
        }
        counter++;
    }
    return 0;
}
