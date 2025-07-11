_BASIC = {
    "termination_role" : 
'''
You are an expert of program termination analysis.\n
''',
    "boogie_syntax" : 
'''
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
''',

}

PROMPTS = {
    "termination_analysis" : {
        "boogie_nested_phase" : {
            "description" : 
              "分析终止的nested类型boogie程序的【阶段数】",
            "prompt" : _BASIC["termination_role"] + _BASIC["boogie_syntax"] +
'''
You will be given a loop program in Boogie which is terminating.
You will judge the number of phases needed for a nested-ranking function to prove the termination of the loop program.
You should give the minimum number of phases needed for the nested ranking function to work.

The definition of nested ranking function is: <f1, f2, ..., fn> where n is the number of phases and for each i in {1, . . . , k}, fi(x) is a polynomial or an algebraic fraction over the program variables vec(x) and there exists a positive real number C, such that f1(x) - f1(x') >= C, fi(x) - fi(x') + f_(i-1)(x) >= C for i in {2, . . . , k} and fk(x) >= C, where x is the vector of variables before the execution of loop body and x' is the vector of variables after execution of loop body.

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
''',
            "parse_pattern" : r"\[PHASE_NUM\]\n(\d+)"
        },
        "boogie_multi_phase" : {
            "description" :
              "分析终止的multi-phase类型boogie程序的【阶段数】",
            "prompt" : _BASIC["termination_role"] + _BASIC["boogie_syntax"] +
'''
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
''',
            "parse_pattern" : r"\[PHASE_NUM\]\n(\d+)"
        },
        "boogie_is_terminating" : {
            "description" :
              "判断boogie程序是否终止",
            "prompt" : _BASIC["termination_role"] + _BASIC["boogie_syntax"] +
'''
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
''',
            "parse_pattern" : r"\[RESULT\]\n(TERMINATE|NONTERM)"
        },
        "boogie_termed_single_RF" : {
            "description" :
              "判断【已经确定是终止】的boogie程序是否可以用单个ranking function证明终止",
            "prompt" : _BASIC["termination_role"] + _BASIC["boogie_syntax"] +
'''
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
''',
            "parse_pattern" : r"\[SINGLE\]\n(YES|NO)"        
        },
        "boogie_termed_type_direct" : {
            "description" :
              "已知boogie程序是终止的，【直接】判断其类型[Single/Nested/Multi/Other]",
            "prompt" : _BASIC["termination_role"] + _BASIC["boogie_syntax"] +
'''
You will be given a loop program in Boogie which is known to be terminating.
Your task is to classify the program based on the simplest type of ranking function required to prove its termination.

The classification must be one of {single, nested, multi, other}.
Please adhere to the following priority order:
single > nested > multi > other

This means you should choose the simplest possible type. For example, if a single-phase function is sufficient, you must choose 'single', even if a more complex function could also work. Choose 'nested' only if 'single' is not sufficient, and so on.

The output you provide should be in the format strictly:
[RANKING_TYPE]
<type>
where <type> is one of {single, nested, multi, other}.
Do not provide any explanation.

Example 1:
<Boogie code>
[RANKING_TYPE]
single

Example 2:
<Boogie code>
[RANKING_TYPE]
nested

Example 3:
<Boogie code>
[RANKING_TYPE]
multi
''',
            "parse_pattern" : r"\[RANKING_TYPE\]\n(single|nested|multi|other)"
        },
        "boogie_termed_type_fewshot" : {
            "description" :
              "已知boogie程序是终止的，【结合两个特例作为fewshot】，判断其类型[Single/Nested/Multi/Other]",
            "prompt" : _BASIC["termination_role"] + _BASIC["boogie_syntax"] +
'''
You will be given a loop program in Boogie which is known to be terminating.
Your task is to classify the program based on the simplest type of ranking function required to prove its termination.

**Key Insight:** The mathematical form (template) of the ranking function is crucial. A program might be impossible to prove with a `single` function, but provable with a `nested` one. Another might fail `nested` but be provable with `multi`.

Therefore, your goal is to identify the **simplest sufficient** template, following the priority:
**single > nested > multi > other**

The output you provide should be in the format strictly:
[RANKING_TYPE]
<type>
where <type> is one of {single, nested, multi, other}.
Do not provide any explanation.

---
**Example 1: A simple case**
<Boogie>
procedure single_example() {
  var x: int;
  x := __VERIFIER_nondet_int();
  assume x >= 0;
  while (x > 0) {
    x := x - 1;
  }
}
</Boogie>
[RANKING_TYPE]
single

---
**Example 2: A case requiring a nested function**
// This program cannot be proven by any single linear ranking function.
// It requires a nested function where one variable's decrease depends on another.
<Boogie>
procedure nested_example() {
  var q: int;
  var y: int;
  q := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (q > 0) {
    q := q - y;
    y := y + 1;
  }
}
</Boogie>
[RANKING_TYPE]
nested

---
**Example 3: A case requiring a multi-phase function**
// This program cannot be proven by any nested linear ranking function.
// It requires a multi-phase function that first decreases one variable to 0, then another.
<Boogie>
procedure multi_example() {
  var q: int;
  var y: int;
  q := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (q > 0 || y > 0) {
    q := q + y - 1;
    y := y - 1;
  }
}
</Boogie>
[RANKING_TYPE]
multi
''',
            "parse_pattern" : r"\[RANKING_TYPE\]\n(single|nested|multi|other)"
        }
    },

    "nontermination_analysis" : {
        "cpp_nontermtype" : {
            "description" :
              "分析非终止的C程序的【非终止类型】",
            "prompt" :
'''
You are an expert of program nontermination analysis. 
In the following, you will be given an C program that is nonterminating 
and you should do the classification based on the reason of the nontermination. 
The nontermination categories are:
1. DIVERGENT: the value of state changes is linear transformation and there exists a satisfiable initial
condition that the state grows/decreases monotonely and avoiding the violation of loop condition.
2. RECUR: the nontermination comes from a recursive set, which can be regarded as a loop in the concrete state values
which do not violate the loop condition.
3. GEOMETRIC: the nontermination can be proved by a geometric argument, which is the state values grows in the manner of 
geometric series or combination of geometric series and the growing always satisfy the loop condition.
4. RECUR_FUNC: nontermination caused by recursive call of function.
5. OTHER: nontermination that does not fit the categories above.

We give some program example of categories 1-4:
1. 
int x = nondet_int();
	if (x > 0) {
			while (x≠0) {
			x=x-2;
		}
}
2.
int x = nondet_int();
while (x≠0) {
		x=-x;
}
3.
int x=1;
while(x+y≥3) {
		x=3x-2;
		y=2y;
}
4. 
void f(x) {
				if (x≥0 ) {g(x);}
}
void g(x) {
				if (x≤0) {f(x);}
}
int main() {
		int x = nondet_int();
	f(x);
}

The outcome results should be EXACTLY in the format below: 
[NONTERMTYPE] 
DIVERGENT/RECUR/GEOMETRIC/RECUR_FUNC/OTHER

example 1:
<code>
[NONTERMTYPE]
DIVERGENT

The program is:\n
''',
            "parse_pattern" : r"\[NONTERMTYPE\]\n(DIVERGENT|RECUR|GEOMETRIC|RECUR_FUNC|OTHER)"
        }
    }

}

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

# 已知Terminating，直接判断类型[Single/Nested/Multi/Other]
termed_type_direct_judge_prompt = '''
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
You will be given a loop program in Boogie which is known to be terminating.
Your task is to classify the program based on the simplest type of ranking function required to prove its termination.

The classification must be one of {single, nested, multi, other}.
Please adhere to the following priority order:
single > nested > multi > other

This means you should choose the simplest possible type. For example, if a single-phase function is sufficient, you must choose 'single', even if a more complex function could also work. Choose 'nested' only if 'single' is not sufficient, and so on.

The output you provide should be in the format strictly:
[RANKING_TYPE]
<type>
where <type> is one of {single, nested, multi, other}.
Do not provide any explanation.

Example 1:
<Boogie code>
[RANKING_TYPE]
single

Example 2:
<Boogie code>
[RANKING_TYPE]
nested

Example 3:
<Boogie code>
[RANKING_TYPE]
multi
'''

# 已知Terminating，结合两个特例作为fewshot，判断类型[Single/Nested/Multi/Other]
termed_type_fewshot_judge_prompt = '''
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
You will be given a loop program in Boogie which is known to be terminating.
Your task is to classify the program based on the simplest type of ranking function required to prove its termination.

**Key Insight:** The mathematical form (template) of the ranking function is crucial. A program might be impossible to prove with a `single` function, but provable with a `nested` one. Another might fail `nested` but be provable with `multi`.

Therefore, your goal is to identify the **simplest sufficient** template, following the priority:
**single > nested > multi > other**

The output you provide should be in the format strictly:
[RANKING_TYPE]
<type>
where <type> is one of {single, nested, multi, other}.
Do not provide any explanation.

---
**Example 1: A simple case**
<Boogie>
procedure single_example() {
  var x: int;
  x := __VERIFIER_nondet_int();
  assume x >= 0;
  while (x > 0) {
    x := x - 1;
  }
}
</Boogie>
[RANKING_TYPE]
single

---
**Example 2: A case requiring a nested function**
// This program cannot be proven by any single linear ranking function.
// It requires a nested function where one variable's decrease depends on another.
<Boogie>
procedure nested_example() {
  var q: int;
  var y: int;
  q := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (q > 0) {
    q := q - y;
    y := y + 1;
  }
}
</Boogie>
[RANKING_TYPE]
nested

---
**Example 3: A case requiring a multi-phase function**
// This program cannot be proven by any nested linear ranking function.
// It requires a multi-phase function that first decreases one variable to 0, then another.
<Boogie>
procedure multi_example() {
  var q: int;
  var y: int;
  q := __VERIFIER_nondet_int();
  y := __VERIFIER_nondet_int();
  while (q > 0 || y > 0) {
    q := q + y - 1;
    y := y - 1;
  }
}
</Boogie>
[RANKING_TYPE]
multi
'''


nontermtype_judge_prompt = '''
You are an expert of program nontermination analysis. 
In the following, you will be given an C program that is nonterminating 
and you should do the classification based on the reason of the nontermination. 
The nontermination categories are:
1. DIVERGENT: the value of state changes is linear transformation and there exists a satisfiable initial
condition that the state grows/decreases monotonely and avoiding the violation of loop condition.
2. RECUR: the nontermination comes from a recursive set, which can be regarded as a loop in the concrete state values
which do not violate the loop condition.
3. GEOMETRIC: the nontermination can be proved by a geometric argument, which is the state values grows in the manner of 
geometric series or combination of geometric series and the growing always satisfy the loop condition.
4. RECUR_FUNC: nontermination caused by recursive call of function.
5. OTHER: nontermination that does not fit the categories above.

We give some program example of categories 1-4:
1. 
int x = nondet_int();
	if (x > 0) {
			while (x≠0) {
			x=x-2;
		}
}
2.
int x = nondet_int();
while (x≠0) {
		x=-x;
}
3.
int x=1;
while(x+y≥3) {
		x=3x-2;
		y=2y;
}
4. 
void f(x) {
				if (x≥0 ) {g(x);}
}
void g(x) {
				if (x≤0) {f(x);}
}
int main() {
		int x = nondet_int();
	f(x);
}

The outcome results should be EXACTLY in the format below: 
[NONTERMTYPE] 
DIVERGENT/RECUR/GEOMETRIC/RECUR_FUNC/OTHER

example 1:
<code>
[NONTERMTYPE]
DIVERGENT

The program is:\n
'''