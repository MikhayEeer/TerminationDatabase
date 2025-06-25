
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
            [RESULT] TERMINATE
            If it is non-terminating, output:
            [RESULT] NONTERM
            Do not provide any explanation or ranking function.
            Example 1:
            <Boogie code>
            [RESULT] TERMINATE
            Example 2:
            <Boogie code>
            [RESULT] NONTERM
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
If it can be proved by a single ranking function, output:
[SINGLE] YES
If not, output:
[SINGLE] NO
Do not provide any explanation or ranking function.
Example 1:
<Boogie code>
[SINGLE] YES
Example 2:
<Boogie code>
[SINGLE] NO
"""