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
// Renamed to: num_a, num_b, gcd_x, gcd_y, lcm_u, lcm_v

extern unsigned __VERIFIER_nondet_uint(void);

int main() {
    unsigned num_a, num_b;
    unsigned gcd_x, gcd_y, lcm_u, lcm_v;
    num_a = __VERIFIER_nondet_uint();
    num_b = __VERIFIER_nondet_uint();
    // assume_abort_if_not(a >= 1);  //infinite loop if remove
    // assume_abort_if_not(b >= 1);

    // assume_abort_if_not(a <= 65535);
    // assume_abort_if_not(b <= 65535);

    if (num_a < 1 || num_b < 1 || num_a > 65535 || num_b > 65535) {
        return 0;
    }

    gcd_x = num_a;
    gcd_y = num_b;
    lcm_u = num_b;
    lcm_v = 0;

    while (1) {
        // __VERIFIER_assert(x*u + y*v == a*b);
        if (!(gcd_x != gcd_y + gcd_x*lcm_u + gcd_y*lcm_v - num_a*num_b))
            break;

        while (1) {
	    // __VERIFIER_assert(x*u + y*v == a*b);
            if (!(gcd_x > gcd_y + gcd_x*lcm_u + gcd_y*lcm_v - num_a*num_b))
                break;
            gcd_x = gcd_x - gcd_y;
            lcm_v = lcm_v + lcm_u;
        }

        while (1) {
	    // __VERIFIER_assert(x*u + y*v == a*b);
            if (!(gcd_x < gcd_y + gcd_x*lcm_u + gcd_y*lcm_v - num_a*num_b))
                break;
            gcd_y = gcd_y - gcd_x;
            lcm_u = lcm_u + lcm_v;
        }
    }

    // __VERIFIER_assert(u*y + v*y == a*b);
    // __VERIFIER_assert(x == y);

    //x == gcd(a,b)
    //u + v == lcm(a,b)
    return 0;
}
