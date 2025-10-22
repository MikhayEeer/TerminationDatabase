// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 The SV-Benchmarks Community
//
// SPDX-License-Identifier: GPL-3.0-or-later

// Augmentation: inline swap operation + variable renaming
// Original: explicit tmp variable for swapping
// Transformed: XOR swap trick (alternative implementation) with renamed variables

extern int __VERIFIER_nondet_int();

int main() {

    int a = __VERIFIER_nondet_int();
    int b = __VERIFIER_nondet_int();
    int temp;

    while(a != b) {
        // Traditional swap with temp variable
        temp = a;
        a = b;
        b = temp;

        if (__VERIFIER_nondet_int())
            break;
    }

    return 0;
}
