# using for ask nested phase 
nested_phase_judge_prompt = '''
You are an expert of program termination analysis.
The input is a program written in Boogie, a simple intermediate verification language.
Boogie syntax example:

procedure addition(m: int, n: int)
{
  if ((n==0)) { }
  if ((n>0)) { }
  if ((n<0)) { }
}
procedure main()
{
  var m: int;
  var n: int;
  var result: int;
  m := __VERIFIER_nondet_int();
  n := __VERIFIER_nondet_int();
  result := addition(m, n);
  if ((result==(m+n))) { } else { __VERIFIER_error(); }
}

The function __VERIFIER_nondet_int() returns a nondeterministic integer.
You will be given a loop program in Boogie which is terminating.
You will judge the number of phases needed for a nested-ranking function to prove the termination of the loop program.
You should give the minimum number of phases needed for the nested ranking function to work.

The definition of nested ranking function is: <f1, f2, ..., fn> where n is the number of phases and for each i in {1, . . . , k}, fi(x) is a polynomial or an algebraic fraction over the program variables vec(x) and there exists a positive real number C, such that f1(x) - f1(x') >= C, fi(x) - fi(x') + f_(i-1)(x) >= C for i in {2, . . . , k} and fk(x) >= C, where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.

The output you provide should be in the format strictly:
[PHASE_NUM]k
where k is the number of minimum phases needed. Notice that if the termination can be proved by one ranking function then the phase num is 1.
Do not provide any explanation.

Example 1:
<Boogie code>
[PHASE_NUM]1

Example 2:
<Boogie code>
[PHASE_NUM]2
'''

__nested_phase_judge_prompt = '''
You are an expert of program termination analysis.
In the following you will be given a loop program in Boogie which is terminating.
You will judge the number of phases needed for  nested-ranking function to prove the termination of the loop program,
you should give the minimum number of phases needed for the nested ranking function to work.\n
The definition of nested ranking function is: <f1, f2, ..., fn> where n is the number of phases and  for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction
over the program variables vec(x) and there exists a positive real number C, such that f1(x) - f1(x') >= C, fi(x) - fi(x') + f_(i-1)(x) >= C for i ∈ {2, . . . , k} and fk(x) >= C
where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.\n
The output you provide shoude in the format strictly:  [PHASE_NUM]k\n, where k is the number of minimum phase needed, notice that if the termination can be prove by one ranking function the phase num is 1. DO NOT GENERATE EXPLANATION!!
'''

multi_phase_judge_prompt = '''You are an expert of program termination analysis.
The input is a program written in Boogie, a simple intermediate verification language.
Boogie syntax example:

procedure addition(m: int, n: int)
{
  if ((n==0)) { }
  if ((n>0)) { }
  if ((n<0)) { }
}
procedure main()
{
  var m: int;
  var n: int;
  var result: int;
  m := __VERIFIER_nondet_int();
  n := __VERIFIER_nondet_int();
  result := addition(m, n);
  if ((result==(m+n))) { } else { __VERIFIER_error(); }
}

The function __VERIFIER_nondet_int() returns a nondeterministic integer.
You will be given a loop program in Boogie which is terminating.
You will judge the number of phases needed for a multi-phase function to prove the termination of the loop program.
You should give the minimum number of phases needed for the multi-phase ranking function to work.

The definition of multi-phase ranking function is: <f1, f2, ..., fn> where n is the number of phases and for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction
over the program variables vec(x) and we require that there exists an index i ∈ {1, . . . , k} and a constant C such that: f_i(x) >= C and f1(x) - f1(x') >= C and for all j < i we have f_j(x) < 0
where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.

The output you provide should be in the format strictly:
[PHASE_NUM]
k
where k is the number of minimum phases needed. Notice that if the termination can be proved by one ranking function then the phase num is 1.
Do not provide any explanation.
Example 1:
<Boogie code>
[PHASE_NUM]
1
Example 2:
<Boogie code>
[PHASE_NUM]
2
'''

__multi_phase_judge_prompt = "You are an expert of program termination analysis. In the following you will be given a loop program in Boogie which is terminating." \
        "You will judge the number of phases needed for multi-phase function to prove the termination of the loop program," \
        "you should give the minimum number of phases needed for the multi-phase ranking function to work\n" \
        "The definition of multi-phase ranking function is: <f1, f2, ..., fn> where n is the number of phases and  for each i ∈ {1, . . . , k}, fi(x) be a polynomial or an algebraic fraction" \
        "over the program variables vec(x) and we require that there exists an index i ∈ {1, . . . , k} and a constant C such that: f_i(x) >= C and f1(x) - f1(x') >= C and for all j < i we have f_j(x) < 0" \
        "where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.\n"\
        "The output you provide shoude in the format strictly:  [PHASE_NUM]k\n, where k is the number of minimum phase needed, notice that if the termination can be prove by one ranking function then the phase num is 1. DO NOT GENERATE EXPLANATION!!"

# using for ask_boogie_is_terminating
boogie_is_terminating_prompt = '''
            You are an expert of program termination analysis. 
            The input is a program written in Boogie, a simple intermediate verification language. 
            Boogie syntax example:

            procedure addition(m: int, n: int)
            {
            if ((n==0)) { }
            if ((n>0)) { }
            if ((n<0)) { }
            }
            procedure main()
            {
            var m: int;
            var n: int;
            var result: int;
            m := __VERIFIER_nondet_int();
            n := __VERIFIER_nondet_int();
            result := addition(m, n);
            if ((result==(m+n))) { } else { __VERIFIER_error(); }
            }

            The function __VERIFIER_nondet_int() returns a nondeterministic integer.
            Given a Boogie program, strictly judge whether it is terminating. 
            If it is terminating, output:
            [RESULT]
            TERMINATE
            If it is non-terminating, output:
            [RESULT]
            NONTERM
            Do not provide any explanation or ranking function.
            Example 1:
            <Boogie code>
            [RESULT]
            TERMINATE
            Example 2:
            <Boogie code>
            [RESULT]
            NONTERM
            '''

# using for ask_boogie_is_single_ranking_function
boogie_single_RF_prompt = """You are an expert of program termination analysis.
The input is a program written in Boogie, a simple intermediate verification language.
Boogie syntax example:

procedure addition(m: int, n: int)
{
  if ((n==0)) { }
  if ((n>0)) { }
  if ((n<0)) { }
}
procedure main()
{
  var m: int;
  var n: int;
  var result: int;
  m := __VERIFIER_nondet_int();
  n := __VERIFIER_nondet_int();
  result := addition(m, n);
  if ((result==(m+n))) { } else { __VERIFIER_error(); }
}

The function __VERIFIER_nondet_int() returns a nondeterministic integer.
Given a Boogie program that is known to be terminating, strictly judge whether its termination can be proved by a single ranking function.
If it can be proved by a single ranking function, output:\n
[SINGLE]
YES
If not, output:
[SINGLE]
NO
Do not provide any explanation or ranking function.
Example 1:
<Boogie code>
[SINGLE]
YES
Example 2:
<Boogie code>
[SINGLE]
NO
"""