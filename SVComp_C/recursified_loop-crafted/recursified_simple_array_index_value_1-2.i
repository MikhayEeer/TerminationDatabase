/* Benchmark used to verify Chimdyalwar, Bharti, et al. "VeriAbs: Verification by abstraction (competition contribution)." 
International Conference on Tools and Algorithms for the Construction and Analysis of Systems. Springer, Berlin, Heidelberg, 2017.*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'simple_array_index_value_1-2.i' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]simple_array_index_value_1-2.i -o . --pretty_names --trace to_recursive:0
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
      __assert_fail("0", "simple_array_index_value_1-2.c", 7, __extension__ __PRETTY_FUNCTION__);
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
void func_to_recursive_line_39_to_45_0(unsigned int (*array)[10000], unsigned int *index, unsigned int *tmp)
{
  if (1)
  {
    {
      *index = __VERIFIER_nondet_uint();
      if ((*index) >= 10000)
      {
        return;
      }
      else
      {
      }
      (*array)[*index] = *index;
      *tmp = *index;
    }
    func_to_recursive_line_39_to_45_0(array, index, tmp);
  }
  else
  {
  }
}

int main()
{
  unsigned int array[10000];
  unsigned int index = 0;
  unsigned int tmp = 0;
  func_to_recursive_line_39_to_45_0(&array, &index, &tmp);
  __VERIFIER_assert((tmp < 10000) && (array[tmp] == tmp));
}

