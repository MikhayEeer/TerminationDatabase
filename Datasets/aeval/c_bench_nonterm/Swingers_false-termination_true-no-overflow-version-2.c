int main() {
    int bob = 11;
    int samantha = 17;
    int max = 21;
    int lola = 25;

    while (bob + samantha != max + lola) {
        int temp = bob;
        bob = max;
        max = temp;
    }

    return 0;
}
