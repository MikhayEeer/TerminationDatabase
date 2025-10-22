// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: s, a, r, k, q, d, n, t
// Renamed to: sqrt_val, alpha, remainder, kappa, quotient, delta, number, temp

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned sqrt_val, alpha;
    unsigned remainder, kappa, quotient, delta, number, temp;
    sqrt_val = __VERIFIER_nondet_uint();
    alpha = __VERIFIER_nondet_uint();
    if (sqrt_val >= 8192) {
        return 0;
    }
    if (alpha <= 2) {
        return 0;
    }
    number = sqrt_val*sqrt_val;
    delta = alpha;
    remainder = number % delta;
    temp = 0;
    kappa = number % (delta - 2);
    quotient = 4 * (number / (delta - 2) - number / delta);
    while (1) {
        if (!((sqrt_val + delta * kappa - delta * temp - alpha * kappa + alpha * temp >= delta) && (remainder != 0))) break;
        if (2 * remainder + quotient < kappa) {
            temp = remainder;
            remainder = 2 * remainder - kappa + quotient + delta + 2;
            kappa = temp;
            quotient = quotient + 4;
            delta = delta + 2;
        } else if ((2 * remainder + quotient >= kappa) && (2 * remainder + quotient < delta + kappa + 2)) {
            temp = remainder;
            remainder = 2 * remainder - kappa + quotient;
            kappa = temp;
            delta = delta + 2;
        } else if ((2 * remainder + quotient >= kappa) && (2 * remainder + quotient >= delta + kappa + 2) && (2 * remainder + quotient < 2 * delta + kappa + 4)) {
            temp = remainder;
            remainder = 2 * remainder - kappa + quotient - delta - 2;
            kappa = temp;
            quotient = quotient - 4;
            delta = delta + 2;
        } else {
            temp = remainder;
            remainder = 2 * remainder - kappa + quotient - 2 * delta - 4;
            kappa = temp;
            quotient = quotient - 8;
            delta = delta + 2;
        }
    }
    return 0;
}
