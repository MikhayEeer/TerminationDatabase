// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined conditions) + variable renaming
// Original: separate if statements for bounds checking
// Transformed: combined condition with shorter variable names

extern int __VERIFIER_nondet_int(void);
extern unsigned int __VERIFIER_nondet_uint(void);
int main() {
  unsigned a_val, b_val;
  unsigned q_res, r_rem, b_div;
  a_val = __VERIFIER_nondet_uint();
  b_val = __VERIFIER_nondet_uint();
  // Combined bounds checking
  if (b_val >= (0x7fffffff * 2U + 1U)/2 || b_val < 1 || a_val >= (0x7fffffff * 2U + 1U)/2) return 0;
    q_res = 0;
    r_rem = a_val;
    b_div = b_val;
    if (r_rem < b_div) {
    while (a_val == q_res * b_div + r_rem) {
        if (2 * (b_div / 2) == b_div) {
            q_res = 2 * q_res;
            b_div = b_div / 2;
            if (r_rem >= b_div) {
                q_res = q_res + 1;
                r_rem = r_rem - b_div;
            }
        }
    }
    }
    return 0;
}
