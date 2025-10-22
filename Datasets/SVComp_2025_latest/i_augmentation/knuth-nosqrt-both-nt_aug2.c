// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: control flow transformation (combined bounds) + variable renaming
// Original: separate if statements
// Transformed: combined condition with compact variable names

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned s_val, a_param;
    unsigned r_var, k_var, q_var, d_var, n_var, t_var;
    s_val = __VERIFIER_nondet_uint();
    a_param = __VERIFIER_nondet_uint();
    // Combined bounds checking
    if (s_val >= 8192 || a_param <= 2) {
        return 0;
    }
    n_var = s_val*s_val;
    d_var = a_param;
    r_var = n_var % d_var;
    t_var = 0;
    k_var = n_var % (d_var - 2);
    q_var = 4 * (n_var / (d_var - 2) - n_var / d_var);
    while (1) {
        if (!(d_var * k_var - d_var * t_var - a_param * k_var + a_param * t_var == 0)) break;
        if (2 * r_var + q_var < k_var) {
            t_var = r_var;
            r_var = 2 * r_var - k_var + q_var + d_var + 2;
            k_var = t_var;
            q_var = q_var + 4;
            d_var = d_var + 2;
        } else if ((2 * r_var + q_var >= k_var) && (2 * r_var + q_var < d_var + k_var + 2)) {
            t_var = r_var;
            r_var = 2 * r_var - k_var + q_var;
            k_var = t_var;
            d_var = d_var + 2;
        } else if ((2 * r_var + q_var >= k_var) && (2 * r_var + q_var >= d_var + k_var + 2) && (2 * r_var + q_var < 2 * d_var + k_var + 4)) {
            t_var = r_var;
            r_var = 2 * r_var - k_var + q_var - d_var - 2;
            k_var = t_var;
            q_var = q_var - 4;
            d_var = d_var + 2;
        } else {
            t_var = r_var;
            r_var = 2 * r_var - k_var + q_var - 2 * d_var - 4;
            k_var = t_var;
            q_var = q_var - 8;
            d_var = d_var + 2;
        }
    }
    return 0;
}
