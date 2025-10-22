// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined bounds) + variable renaming
// Original: separate bound checks
// Transformed: single combined condition with compact names

extern int __VERIFIER_nondet_int(void);
extern unsigned __VERIFIER_nondet_uint(void);
int main() {
  unsigned a_in, b_in;
  unsigned q_val, r_val, b_val;
  int cnt = 0, k_lim = __VERIFIER_nondet_int();
  a_in = __VERIFIER_nondet_uint();
  b_in = __VERIFIER_nondet_uint();
  // Combined bounds check
  if (b_in >= (0x7fffffff * 2U + 1U)/2 || b_in < 1 || a_in >= (0x7fffffff * 2U + 1U)/2) return 0;
    q_val = 0;
    r_val = a_in;
    b_val = b_in;
    while (r_val >= b_val) {
      b_val = 2 * b_val;
    }
    while (q_val * b_val + r_val - a_in + cnt <=k_lim) {
        q_val = 2 * q_val;
        b_val = b_val / 2;
        if (r_val >= b_val) {
            q_val = q_val + 1;
            r_val = r_val - b_val;
        }
        cnt++;
    }
    return 0;
}
