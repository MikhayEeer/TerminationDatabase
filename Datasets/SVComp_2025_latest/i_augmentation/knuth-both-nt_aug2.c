// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined bounds) + variable renaming
// Original: separate condition checks
// Transformed: combined condition with compact names

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned num, a_param;
    unsigned r_val, k_val, q_val, d_val, s_val, t_val;
    num = __VERIFIER_nondet_uint();
    a_param = __VERIFIER_nondet_uint();
    // Combined bounds check
    if (num >= (0x7fffffff * 2U + 1U)/8 || a_param <= 2) {
        return 0;
    }
    d_val = a_param;
    r_val = num % d_val;
    t_val = 0;
    k_val = num % (d_val - 2);
    q_val = 4 * (num / (d_val - 2) - num / d_val);
    s_val = sqrt(num);
    while (1) {
        if (!(d_val * k_val - d_val * t_val - a_param * k_val + a_param * t_val == 0)) break;
        if (2 * r_val + q_val < k_val) {
            t_val = r_val;
            r_val = 2 * r_val - k_val + q_val + d_val + 2;
            k_val = t_val;
            q_val = q_val + 4;
            d_val = d_val + 2;
        } else if ((2 * r_val + q_val >= k_val) && (2 * r_val + q_val < d_val + k_val + 2)) {
            t_val = r_val;
            r_val = 2 * r_val - k_val + q_val;
            k_val = t_val;
            d_val = d_val + 2;
        } else if ((2 * r_val + q_val >= k_val) && (2 * r_val + q_val >= d_val + k_val + 2) && (2 * r_val + q_val < 2 * d_val + k_val + 4)) {
            t_val = r_val;
            r_val = 2 * r_val - k_val + q_val - d_val - 2;
            k_val = t_val;
            q_val = q_val - 4;
            d_val = d_val + 2;
        } else {
            t_val = r_val;
            r_val = 2 * r_val - k_val + q_val - 2 * d_val - 4;
            k_val = t_val;
            q_val = q_val - 8;
            d_val = d_val + 2;
        }
    }
    return 0;
}
