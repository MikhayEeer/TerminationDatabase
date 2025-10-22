// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined bounds) + variable renaming
// Original: separate bound checks
// Transformed: combined into single condition with compact names

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned s_in, a_in;
    unsigned r_val, k_val, q_val, d_val, n_val, t_val;
    s_in = __VERIFIER_nondet_uint();
    a_in = __VERIFIER_nondet_uint();
    // Combined bounds check
    if (s_in >= 8192 || a_in <= 2) {
        return 0;
    }
    n_val = s_in*s_in;
    d_val = a_in;
    r_val = n_val % d_val;
    t_val = 0;
    k_val = n_val % (d_val - 2);
    q_val = 4 * (n_val / (d_val - 2) - n_val / d_val);
    while (1) {
        if (!((s_in + d_val * k_val - d_val * t_val - a_in * k_val + a_in * t_val >= d_val) && (r_val != 0))) break;
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
