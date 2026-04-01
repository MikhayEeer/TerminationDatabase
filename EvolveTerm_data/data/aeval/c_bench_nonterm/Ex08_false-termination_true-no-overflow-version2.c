extern int __VERIFIER_nondet_int(void);

int main() {
    int i, j, k;
    int up, left, closer;
    i = __VERIFIER_nondet_int();
    j = __VERIFIER_nondet_int();
    k = __VERIFIER_nondet_int();
    up = 0;
    left = 0;
    closer = 0;
    
    while (i > 0 && j > 0 && k > 0) {
        if (i == 1) {
            up = 1;
        }
        if (i == 10) {
            up = 0;
        }
        if (j == 1) {
            left = 1;
        }
        if (j == 10) {
            left = 0;
        }
        if (k == 1) {
            closer = 1;
        }
        if (k == 10) {
            closer = 0;
        }
        if (up == 1) {
            i = i+1;
        } else {
            i = i-1;
        }
        if (left == 1) {
            j = j+1;
        } else {
            j = j-1;
        }
        if (closer == 1) {
            k = k+1;
        } else {
            k = k-1;
        }
    }
    
    return 0;
}
