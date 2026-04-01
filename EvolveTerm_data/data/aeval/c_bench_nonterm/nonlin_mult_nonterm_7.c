extern int __VERIFIER_nondet_int(void);

int main() {
    int i,j,k;
    i = __VERIFIER_nondet_int();
    j = __VERIFIER_nondet_int();
    k = __VERIFIER_nondet_int();
    
    while (i*j*k > 0) {
        i = i + 1;
        j = j + 1;
        k = k + 1;
    }
    
    return 0;
}
