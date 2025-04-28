/* Benchmark used to verify Chimdyalwar, Bharti, et al. "VeriAbs: Verification by abstraction (competition contribution)." 
International Conference on Tools and Algorithms for the Construction and Analysis of Systems. Springer, Berlin, Heidelberg, 2017.*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'simple_array_index_value_1-1.i' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]simple_array_index_value_1-1.i -o . --pretty_names --trace for2while:0 for2while:0 to_recursive:1 to_recursive:0
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
      __assert_fail("0", "simple_array_index_value_1-1.c", 7, __extension__ __PRETTY_FUNCTION__);
    }
  }
);
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

void func_to_recursive_line_36_to_40_0(unsigned int (*array)[1000], unsigned int *index)
{
  if ((*index) < 1000)
  {
    {
      {
        if (((*index) % 2) == 0)
        {
          __VERIFIER_assert((*array)[*index] == 0);
        }
        else
        {
          __VERIFIER_assert((*array)[*index] != 0);
        }
      }
      (*index)++;
    }
    func_to_recursive_line_36_to_40_0(array, index);
  }
  else
  {
  }
}

void func_to_recursive_line_32_to_33_0(unsigned int (*array)[1000], unsigned int *index)
{
  if ((*index) < 1000)
  {
    {
      {
        (*array)[*index] = (*index) % 2;
      }
      (*index)++;
    }
    func_to_recursive_line_32_to_33_0(array, index);
  }
  else
  {
  }
}

int main()
{
  unsigned int array[1000];
  unsigned int index;
  {
    index = 0;
    func_to_recursive_line_32_to_33_0(&array, &index);
  }
  {
    index = 0;
    func_to_recursive_line_36_to_40_0(&array, &index);
  }
}

