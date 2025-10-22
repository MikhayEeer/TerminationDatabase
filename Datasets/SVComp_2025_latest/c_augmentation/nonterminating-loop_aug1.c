// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 The SV-Benchmarks Community
//
// SPDX-License-Identifier: GPL-3.0-or-later

// Augmentation: variable renaming
// Original variables: x, y, tmp
// Renamed to: value_x, value_y, swap_temp

extern int __VERIFIER_nondet_int();

int main() {

    int value_x = __VERIFIER_nondet_int();
    int value_y = __VERIFIER_nondet_int();
    int swap_temp;

    while(value_x != value_y) {
        swap_temp = value_x;
        value_x = value_y;
        value_y = swap_temp;

        if (__VERIFIER_nondet_int())
            break;
    }

    return 0;
}
