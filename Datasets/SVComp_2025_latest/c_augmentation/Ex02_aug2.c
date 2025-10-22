// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 RWTH Aachen
//
// SPDX-License-Identifier: LicenseRef-RWTH-Aachen

// Augmentation: control flow transformation (if to ternary operator) + variable renaming
// Original: if-else structure with variable i
// Transformed: ternary operator with variable cnt

typedef enum {false,true} bool;

extern int __VERIFIER_nondet_int(void);

int main() {
    int cnt;
    cnt = __VERIFIER_nondet_int();
    
    while (cnt > 0) {
        cnt = (cnt != 5) ? (cnt - 1) : cnt;
    }
    
    return 0;
}
