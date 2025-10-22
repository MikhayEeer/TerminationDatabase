// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: arithmetic expression style + variable renaming
// Original: separate increment statements
// Transformed: explicit addition with descriptive names

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned sqrt_input, alpha_input;
    unsigned remainder_val, kappa_val, quotient_val, delta_val, number_val, temp_val;
    sqrt_input = __VERIFIER_nondet_uint();
    alpha_input = __VERIFIER_nondet_uint();
    if (sqrt_input >= 8192) {
        return 0;
    }
    if (alpha_input <= 2) {
        return 0;
    }
    number_val = sqrt_input*sqrt_input;
    delta_val = alpha_input;
    remainder_val = number_val % delta_val;
    temp_val = 0;
    kappa_val = number_val % (delta_val - 2);
    quotient_val = 4 * (number_val / (delta_val - 2) - number_val / delta_val);
    while (1) {
        if (!(delta_val * kappa_val - delta_val * temp_val - alpha_input * kappa_val + alpha_input * temp_val == 0)) break;
        if (2 * remainder_val + quotient_val < kappa_val) {
            temp_val = remainder_val;
            remainder_val = 2 * remainder_val - kappa_val + quotient_val + delta_val + 2;
            kappa_val = temp_val;
            quotient_val = quotient_val + 4;
            delta_val = delta_val + 2;
        } else if ((2 * remainder_val + quotient_val >= kappa_val) && (2 * remainder_val + quotient_val < delta_val + kappa_val + 2)) {
            temp_val = remainder_val;
            remainder_val = 2 * remainder_val - kappa_val + quotient_val;
            kappa_val = temp_val;
            delta_val = delta_val + 2;
        } else if ((2 * remainder_val + quotient_val >= kappa_val) && (2 * remainder_val + quotient_val >= delta_val + kappa_val + 2) && (2 * remainder_val + quotient_val < 2 * delta_val + kappa_val + 4)) {
            temp_val = remainder_val;
            remainder_val = 2 * remainder_val - kappa_val + quotient_val - delta_val - 2;
            kappa_val = temp_val;
            quotient_val = quotient_val - 4;
            delta_val = delta_val + 2;
        } else {
            temp_val = remainder_val;
            remainder_val = 2 * remainder_val - kappa_val + quotient_val - 2 * delta_val - 4;
            kappa_val = temp_val;
            quotient_val = quotient_val - 8;
            delta_val = delta_val + 2;
        }
    }
    return 0;
}
