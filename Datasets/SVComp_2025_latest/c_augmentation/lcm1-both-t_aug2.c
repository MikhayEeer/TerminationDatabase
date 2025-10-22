// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// SPDX-FileCopyrightText: 2021 DynamiTe team <https://github.com/letonchanh/dynamite>
//
// SPDX-License-Identifier: Apache-2.0

/*
  A nonlinear termination benchmark program from the OOPSLA'20 paper 
  "DynamiTe: Dynamic termination and non-termination proofs"
  by Ton Chanh Le, Timos Antonopoulos, Parisa Fathololumi, Eric Koskinen, ThanhVu Nguyen.
  Adapted from the original nonlinear benchmark nla-digbench. 
*/

/*
 * algorithm for computing simultaneously the GCD and the LCM,
 * by Sankaranarayanan
 */

// Augmentation: control flow transformation (combined conditions) + variable renaming
// Original: separate range checks
// Transformed: combined condition with shorter variable names

extern unsigned __VERIFIER_nondet_uint(void);

int main() {
    unsigned a_in, b_in;
    unsigned x_val, y_val, u_val, v_val;
    a_in = __VERIFIER_nondet_uint();
    b_in = __VERIFIER_nondet_uint();

    // Combined bounds checking in single condition
    if (!(a_in >= 1 && b_in >= 1 && a_in <= 65535 && b_in <= 65535)) {
        return 0;
    }

    x_val = a_in;
    y_val = b_in;
    u_val = b_in;
    v_val = 0;

    while (1) {
        if (!(x_val != y_val + x_val*u_val + y_val*v_val - a_in*b_in))
            break;

        while (1) {
            if (!(x_val > y_val + x_val*u_val + y_val*v_val - a_in*b_in))
                break;
            x_val = x_val - y_val;
            v_val = v_val + u_val;
        }

        while (1) {
            if (!(x_val < y_val + x_val*u_val + y_val*v_val - a_in*b_in))
                break;
            y_val = y_val - x_val;
            u_val = u_val + v_val;
        }
    }

    return 0;
}
