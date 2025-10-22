// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: loop increment style + variable renaming
// Original: counter++ implicit in expression
// Transformed: explicit increment with descriptive names

extern int __VERIFIER_nondet_int(void);
extern unsigned __VERIFIER_nondet_uint(void);
int main() {
  unsigned input_a, input_b;
  unsigned quot, rem, div_base;
  int iter_count = 0, max_iter = __VERIFIER_nondet_int();
  input_a = __VERIFIER_nondet_uint();
  input_b = __VERIFIER_nondet_uint();
  if (input_b >= (0x7fffffff * 2U + 1U)/2) return 0;
  if ( input_b < 1 ) return 0;
  if (input_a >= (0x7fffffff * 2U + 1U)/2) return 0;
    quot = 0;
    rem = input_a;
    div_base = input_b;
    while (rem >= div_base) {
      div_base = 2 * div_base;
    }
    while (quot * div_base + rem - input_a + iter_count <=max_iter) {
        quot = 2 * quot;
        div_base = div_base / 2;
        if (rem >= div_base) {
            quot = quot + 1;
            rem = rem - div_base;
        }
        iter_count = iter_count + 1;
    }
    return 0;
}
