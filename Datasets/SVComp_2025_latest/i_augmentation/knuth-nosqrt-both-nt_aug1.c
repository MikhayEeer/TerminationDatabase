// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

// Augmentation: variable renaming
// Original variables: s, a, r, k, q, d, n, t
// Renamed to: square_root, alpha_val, rem, kap, quot, delt, num, tmp

extern unsigned __VERIFIER_nondet_uint(void);
extern double sqrt(double);
int main() {
    unsigned square_root, alpha_val;
    unsigned rem, kap, quot, delt, num, tmp;
    square_root = __VERIFIER_nondet_uint();
    alpha_val = __VERIFIER_nondet_uint();
    if (square_root >= 8192) {
        return 0;
    }
    if (alpha_val <= 2) {
        return 0;
    }
    num = square_root*square_root;
    delt = alpha_val;
    rem = num % delt;
    tmp = 0;
    kap = num % (delt - 2);
    quot = 4 * (num / (delt - 2) - num / delt);
    while (1) {
        if (!(delt * kap - delt * tmp - alpha_val * kap + alpha_val * tmp == 0)) break;
        if (2 * rem + quot < kap) {
            tmp = rem;
            rem = 2 * rem - kap + quot + delt + 2;
            kap = tmp;
            quot = quot + 4;
            delt = delt + 2;
        } else if ((2 * rem + quot >= kap) && (2 * rem + quot < delt + kap + 2)) {
            tmp = rem;
            rem = 2 * rem - kap + quot;
            kap = tmp;
            delt = delt + 2;
        } else if ((2 * rem + quot >= kap) && (2 * rem + quot >= delt + kap + 2) && (2 * rem + quot < 2 * delt + kap + 4)) {
            tmp = rem;
            rem = 2 * rem - kap + quot - delt - 2;
            kap = tmp;
            quot = quot - 4;
            delt = delt + 2;
        } else {
            tmp = rem;
            rem = 2 * rem - kap + quot - 2 * delt - 4;
            kap = tmp;
            quot = quot - 8;
            delt = delt + 2;
        }
    }
    return 0;
}
