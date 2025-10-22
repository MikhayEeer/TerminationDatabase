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

// Augmentation: variable renaming
// Original variables: a, b, x, y, u, v
// Renamed to: input_a, input_b, var_x, var_y, var_u, var_v

extern unsigned __VERIFIER_nondet_uint(void);

int main() {
    unsigned input_a, input_b;
    unsigned var_x, var_y, var_u, var_v;
    input_a = __VERIFIER_nondet_uint();
    input_b = __VERIFIER_nondet_uint();
    // assume_abort_if_not(a >= 1);  //infinite loop if remove
    // assume_abort_if_not(b >= 1);

    // assume_abort_if_not(a <= 65535);
    // assume_abort_if_not(b <= 65535);

    if (input_a < 1 || input_b < 1 || input_a > 65535 || input_b > 65535) {
        return 0;
    }

    var_x = input_a;
    var_y = input_b;
    var_u = input_b;
    var_v = 0;

    while (1) {
        // __VERIFIER_assert(x*u + y*v == a*b);
        if (!(var_x*var_u + var_y*var_v == input_a*input_b))
            break;

        while (1) {
	    // __VERIFIER_assert(x*u + y*v == a*b);
            if (!(var_x*var_u + var_y*var_v == input_a*input_b))
                break;
            var_x = var_x - var_y;
            var_v = var_v + var_u;
        }

        while (1) {
	    // __VERIFIER_assert(x*u + y*v == a*b);
            if (!(var_x*var_u + var_y*var_v == input_a*input_b))
                break;
            var_y = var_y - var_x;
            var_u = var_u + var_v;
        }
    }

    // __VERIFIER_assert(u*y + v*y == a*b);
    // __VERIFIER_assert(x == y);

    //x == gcd(a,b)
    //u + v == lcm(a,b)
    return 0;
}
