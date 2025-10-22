// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: n, a, r, k, q, d, s, t
// Renamed to: number, alpha, remainder, kappa, quotient, delta, sqrt_n, temp

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned number, alpha;
    unsigned remainder, kappa, quotient, delta, sqrt_n, temp;
    number = __VERIFIER_nondet_uint();
    alpha = __VERIFIER_nondet_uint();
    if (number >= (0x7fffffff * 2U + 1U)/8 || alpha <= 2) {
        return 0;
    }
    delta = alpha;
    remainder = number % delta;
    temp = 0;
    kappa = number % (delta - 2);
    quotient = 4 * (number / (delta - 2) - number / delta);
    sqrt_n = sqrt(number);
    while (1) {
        if (!(delta * kappa - delta * temp - alpha * kappa + alpha * temp == 0)) break;
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
