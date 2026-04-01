// This file is part of the SV-Benchmarks collection of verification tasks:
// https://github.com/sosy-lab/sv-benchmarks
//
// SPDX-FileCopyrightText: 2025 RWTH Aachen
//
// SPDX-License-Identifier: LicenseRef-RWTH-Aachen

// Augmentation: variable renaming
// Original variables: i
// Renamed to: loop_counter

typedef enum {false,true} bool;

extern int __VERIFIER_nondet_int(void);

int main() {
    int loop_counter;
    loop_counter = __VERIFIER_nondet_int();
    
    while (loop_counter > 0) {
        if (loop_counter != 5) {
            loop_counter = loop_counter-1;
        }
    }
    
    return 0;
}
