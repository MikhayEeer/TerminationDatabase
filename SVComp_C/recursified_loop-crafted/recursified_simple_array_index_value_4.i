/* Benchmark used to verify Chimdyalwar, Bharti, et al. "VeriAbs: Verification by abstraction (competition contribution)." 
International Conference on Tools and Algorithms for the Construction and Analysis of Systems. Springer, Berlin, Heidelberg, 2017.*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'simple_array_index_value_4.i' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]simple_array_index_value_4.i -o . --pretty_names --trace to_recursive:0 for2while:0 to_recursive:1 to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *__assertion, const char *__file, unsigned int __line, const char *__function) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern void __assert_perror_fail(int __errnum, const char *__file, unsigned int __line, const char *__function) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
extern void __assert(const char *__assertion, const char *__file, int __line) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  (void) (sizeof((0) ? (1) : (0))), __extension__(  {
    if (0)
    {
      ;
    }
    else
    {
      __assert_fail("0", "simple_array_index_value_4.c", 7, __extension__ __PRETTY_FUNCTION__);
    }
  }
);
}

extern void abort(void);
void assume_abort_if_not(int cond)
{
  if (!cond)
  {
    abort();
  }
  else
  {
  }
}

void __VERIFIER_assert(int cond)
{
  if (!cond)
  {
    ERROR:
    {
      reach_error();
      abort();
    }

  }
  else
  {
  }
  return;
}

unsigned int __VERIFIER_nondet_uint();
void func_to_recursive_line_58_to_61_0(unsigned int *index2, unsigned int *index1, unsigned int (*array)[100000])
{
  if ((*index2) < (*index1))
  {
    {
      __VERIFIER_assert((*array)[*index1] == (*array)[*index2]);
      (*index2)++;
      (*index1)--;
    }
    func_to_recursive_line_58_to_61_0(index2, index1, array);
  }
  else
  {
  }
}

void func_to_recursive_line_49_to_54_0(unsigned int *index1, unsigned int *loop_entered, unsigned int *index2, unsigned int (*array)[100000])
{
  if ((*index1) < (*index2))
  {
    {
      __VERIFIER_assert(((*index1) < 100000) && ((*index2) < 100000));
      assume_abort_if_not((*array)[*index1] == (*array)[*index2]);
      (*index1)++;
      (*index2)--;
      *loop_entered = 1;
    }
    func_to_recursive_line_49_to_54_0(index1, loop_entered, index2, array);
  }
  else
  {
  }
}

void func_to_recursive_line_40_to_41_0(unsigned *i, unsigned int (*array)[100000])
{
  if ((*i) < 100000)
  {
    {
      {
        (*array)[*i] = __VERIFIER_nondet_uint();
      }
      ++(*i);
    }
    func_to_recursive_line_40_to_41_0(i, array);
  }
  else
  {
  }
}

int main()
{
  unsigned int array[100000];
  unsigned int index1;
  unsigned int index2;
  unsigned int loop_entered = 0;
  {
    unsigned i = 0;
    func_to_recursive_line_40_to_41_0(&i, &array);
  }
  index1 = __VERIFIER_nondet_uint();
  assume_abort_if_not(index1 < 100000);
  index2 = __VERIFIER_nondet_uint();
  assume_abort_if_not(index2 < 100000);
  func_to_recursive_line_49_to_54_0(&index1, &loop_entered, &index2, &array);
  if (loop_entered)
  {
    func_to_recursive_line_58_to_61_0(&index2, &index1, &array);
  }
  else
  {
  }
}

