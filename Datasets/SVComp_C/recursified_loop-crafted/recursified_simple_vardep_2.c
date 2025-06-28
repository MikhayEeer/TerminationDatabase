/* Benchmark used to verify Chimdyalwar, Bharti, et al. "VeriAbs: Verification by abstraction (competition contribution)." 
International Conference on Tools and Algorithms for the Construction and Analysis of Systems. Springer, Berlin, Heidelberg, 2017.*/


// This file is part of the SV-Benchmarks collection of verification tasks:
// https://gitlab.com/sosy-lab/benchmarking/sv-benchmarks
//
// It was automatically generated from 'simple_vardep_2.c' with https://github.com/FlorianDyck/semtransforms
// To reproduce it you can use the following command:
// python run_transformations.py [insert path here]simple_vardep_2.c -o . --pretty_names --trace to_recursive:0
// in case the newest version cannot recreate this file, the commit hash of the used version is 869b5a9

extern void abort(void);
extern void __assert_fail(const char *, const char *, unsigned int, const char *) __attribute__((__nothrow__, __leaf__)) __attribute__((__noreturn__));
void reach_error()
{
  __assert_fail("0", "simple_vardep_2.c", 6, "reach_error");
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

void func_to_recursive_line_20_to_24_0(unsigned int *i, unsigned int *k, unsigned int *j)
{
  if ((*k) < 0x0fffffff)
  {
    {
      *i = (*i) + 1;
      *j = (*j) + 2;
      *k = (*k) + 3;
      __VERIFIER_assert(((*k) == (3 * (*i))) && ((*j) == (2 * (*i))));
    }
    func_to_recursive_line_20_to_24_0(i, k, j);
  }
  else
  {
  }
}

int main()
{
  unsigned int i = 0;
  unsigned int j = 0;
  unsigned int k = 0;
  func_to_recursive_line_20_to_24_0(&i, &k, &j);
}

