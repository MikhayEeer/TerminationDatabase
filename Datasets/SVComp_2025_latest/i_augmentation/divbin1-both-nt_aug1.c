// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: A, B, q, r, b
// Renamed to: dividend, divisor, quotient, remainder, base

extern int __VERIFIER_nondet_int(void);
extern unsigned int __VERIFIER_nondet_uint(void);
int main() {
  unsigned dividend, divisor;
  unsigned quotient, remainder, base;
  dividend = __VERIFIER_nondet_uint();
  divisor = __VERIFIER_nondet_uint();
  if (divisor >= (0x7fffffff * 2U + 1U)/2) return 0;
  if ( divisor < 1 ) return 0;
  if (dividend >= (0x7fffffff * 2U + 1U)/2) return 0;
    quotient = 0;
    remainder = dividend;
    base = divisor;
    if (remainder < base) {
    while (dividend == quotient * base + remainder) {
        if (2 * (base / 2) == base) {
            quotient = 2 * quotient;
            base = base / 2;
            if (remainder >= base) {
                quotient = quotient + 1;
                remainder = remainder - base;
            }
        }
    }
    }
    return 0;
}
