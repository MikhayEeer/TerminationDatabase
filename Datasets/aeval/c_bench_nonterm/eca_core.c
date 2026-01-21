int calculate_output(int);
extern int __VERIFIER_nondet_int(void);
extern void exit(int);

// GF: all eca-benchmarks and their CHC-encodings at http://www.cs.princeton.edu/~grigoryf/eca_rers_nonterm.zip

	int a17 = 1;
	int a7 = 0;
	int a20 = 1;
	int a8 = 15;
	int a12 = 8;
	int a16 = 5;
	int a21 = 1;

	int calculate_output(int input) {
    
	    if((((a8==15)&&(((((a21==1)&&(((a16==5)||(a16==6))&&(input==1)))&&(a20==1))&&(a17==1))&&!(a7==1)))&&(a12==8))){
	    	a16 = 5;
	    	a20 = 0;
	    	return 24;
	    } else if((((((((input==5)&&((((a16==6)&&(a17==1))||(!(a17==1)&&(a16==4)))||(!(a17==1)&&(a16==5))))&&(a20==1))&&(a12==8))&&(a7==1))&&!(a21==1))&&(a8==13))){
	    	a20 = 0;
	    	a16 = 6;
	    	a17 = 0;
	    	a8 = 15;
	    	a7 = 0;
	    	a21 = 1;
	    	return 26;
	    } else if(((a12==8)&&((input==1)&&(((a21==1)&&(((a8==15)&&((!(a17==1)&&!(a7==1))&&!(a20==1)))&&(a16==6)))||(!(a21==1)&&((a16==4)&&((a8==13)&&(((a17==1)&&(a7==1))&&(a20==1))))))))){
	    	a7 = 1;
	    	a17 = 1;
	    	a21 = 0;
	    	a20 = 1;
	    	a8 = 13;
	    	a16 = 5;
	    	return 26;
	    }
	    if(((((((!(a17==1)&&!(a7==1))&&(a20==1))&&(a8==13))&&(a12==8))&&(a16==5))&&(a21==1))){
	    	error_39: return 0;
	    }
	    return -2;
	}

int main()
{
    // default output
    int output = -1;
  
    // main i/o-loop
    while(output != 0)
    {
        // read input
        int input = __VERIFIER_nondet_int();
        if ((input != 1) && (input != 2) && (input != 3) && (input != 4) && (input != 5) && (input != 6)) return -2;

        // operate eca engine
        output = calculate_output(input);
    }
}
