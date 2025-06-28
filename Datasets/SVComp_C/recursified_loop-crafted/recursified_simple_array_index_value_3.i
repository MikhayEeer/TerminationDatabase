/* Benchmark used to verify Chimdyalwar, Bharti, et al. "VeriAbs: Verification by abstraction (competition contribution)." 
International Conference on Tools and Algorithms for the Construction and Analysis of Systems. Springer, Berlin, Heidelberg, 2017.*/

//This program is similar to loops/sum03_true-unreach-call_false-termination.i but uses array index and value

// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'simple_array_index_value_3.i' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]simple_array_index_value_3.i -o . --pretty_names --trace to_recursive:0 for2while:0 to_recursive:0
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
      __assert_fail("0", "simple_array_index_value_3.c", 8, __extension__ __PRETTY_FUNCTION__);
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

void func_to_recursive_line_38_to_41_0(unsigned int (*array)[10000], unsigned int *index, unsigned int *tmp)
{
  if ((*index) < 10000)
  {
    {
      (*array)[*index] = *tmp;
      *index = (*index) + 1;
      *tmp = (*tmp) + 2;
    }
    func_to_recursive_line_38_to_41_0(array, index, tmp);
  }
  else
  {
  }
}

void func_to_recursive_line_44_to_45_0(unsigned int (*array)[10000], unsigned int *index)
{
  if ((*index) < 10000)
  {
    {
      {
        __VERIFIER_assert(((*array)[*index] == (2 * (*index))) || ((*array)[*index] == 0));
      }
      (*index)++;
    }
    func_to_recursive_line_44_to_45_0(array, index);
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
  func_to_recursive_line_38_to_41_0(&array, &index, &tmp);
  {
    index = 0;
    func_to_recursive_line_44_to_45_0(&array, &index);
  }
}

