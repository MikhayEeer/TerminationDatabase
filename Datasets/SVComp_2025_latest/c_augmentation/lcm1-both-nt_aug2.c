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

// Augmentation: control flow transformation (combined bounds check) + variable renaming
// Original: separate OR conditions for bounds
// Transformed: negated AND condition with compact names

extern unsigned __VERIFIER_nondet_uint(void);

int main() {
    unsigned num1, num2;
    unsigned x_g, y_g, u_l, v_l;
    num1 = __VERIFIER_nondet_uint();
    num2 = __VERIFIER_nondet_uint();

    // Combined bounds check with negation
    if (!(num1 >= 1 && num2 >= 1 && num1 <= 65535 && num2 <= 65535)) {
        return 0;
    }

    x_g = num1;
    y_g = num2;
    u_l = num2;
    v_l = 0;

    while (1) {
        if (!(x_g*u_l + y_g*v_l == num1*num2))
            break;

        while (1) {
            if (!(x_g*u_l + y_g*v_l == num1*num2))
                break;
            x_g = x_g - y_g;
            v_l = v_l + u_l;
        }

        while (1) {
            if (!(x_g*u_l + y_g*v_l == num1*num2))
                break;
            y_g = y_g - x_g;
            u_l = u_l + v_l;
        }
    }

    return 0;
}
