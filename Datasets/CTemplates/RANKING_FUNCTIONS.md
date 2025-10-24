# Ranking Function Theory-Based Templates

This directory contains templates based on **Ranking Function Theory** for systematic generation of termination analysis test cases.

## 📚 Theoretical Foundation

### Ranking Functions
A **ranking function** is a function from program states to a well-founded domain that strictly decreases with each loop iteration, guaranteeing termination.

### Classification Taxonomy

```
Termination Programs
├── Linear Ranking Function
├── Multiple Linear (Lexicographic)
├── Nested Ranking Functions
│   ├── 2-Nested
│   ├── 3-Nested
│   └── N-Nested
└── N-Multiple (Lexicographic)

Non-Termination Programs
├── Infinite Increment
├── Infinite Decrement
├── Periodic/Cyclic Loop
├── Unreachable Exit Condition
└── Always-True Condition
```

|模板|复杂度|RF|
|--|--|--|
|linear|O(N)|f(x)=x|


---

## 🎯 Terminating Programs
终止性模板的基本保证：
- 每个模板有明确秩函数定义
- 证明了良基性
- 每次迭代秩函数严格递减
- 保证终止
### 1. Linear Ranking Function
**File:** `rf_linear.c.tpl`

**Theory:** Single variable with linear ranking function f(x) = c·x + k

**Properties:**
- Simplest ranking function
- Decreases by constant amount each iteration
- Well-founded over natural numbers

**Parameters:**
- `{VAR_NAME}` - Loop variable
- `{INIT_VALUE}` - Starting value
- `{DECREMENT}` - Amount decreased per iteration
- `{LOWER_BOUND}` - Termination bound

**Example Ranking Function:**
```
f(x) = x
Iteration i: x_i = x_0 - i
Terminates when: x ≤ 0
```

**Use Cases:**
- Simple countdown loops
- Basic iteration with constant decrement
- Foundational termination pattern

---

### 2. Multiple Linear Ranking Functions
**File:** `rf_multiple_linear.c.tpl`

**Theory:** Lexicographic ordering (f₁, f₂, ..., fₙ)

**Properties:**
- Uses lexicographic (dictionary) ordering
- Either f₁ decreases, or f₁ stays same and f₂ decreases
- Well-founded over (ℕ × ℕ × ... × ℕ)

**Parameters:**
- `{VAR1}`, `{VAR2}` - Multiple variables
- `{INIT1}`, `{INIT2}` - Initial values
- `{DEC1}`, `{DEC2}` - Decrements

**Example Ranking Function:**
```
Lex((x, y)) = (x, y)
At each step: (x, y) decreases lexicographically
Ordering: (3,5) > (3,4) > (3,0) > (2,10) > (2,9) > ...
```

**Use Cases:**
- Loops with multiple phase progression
- State machines with ordered states
- Algorithms with nested phases

---

### 3. Nested Ranking Functions (2-Nested)
**File:** `rf_2nested.c.tpl`

**Theory:** Hierarchical nested loops with independent ranking functions

**Properties:**
- Outer loop: f_outer(i)
- Inner loop: f_inner(j), terminates for each i
- Total: f_outer × max(f_inner)
- Complexity: O(n²) for balanced nesting

**Parameters:**
- `{OUTER_VAR}`, `{INNER_VAR}` - Loop variables
- `{OUTER_INIT}`, `{INNER_INIT}` - Initial values
- `{NESTING_LEVEL}` - Depth = 2

**Example Ranking Function:**
```
f_outer(i) = i (outer loop)
f_inner(j) = j (inner loop, reset each outer iteration)
Total iterations: Σᵢ₌₁ⁿ i = n(n+1)/2
```

**Use Cases:**
- Matrix operations
- Nested iterations
- Bubble sort, insertion sort patterns

---

### 4. N-Nested Ranking Functions
**File:** `rf_n_nested.c.tpl`

**Theory:** N-level hierarchical nesting

**Properties:**
- Each level k has ranking function fₖ
- Level k terminates before level k-1 progresses
- Total: f₁ × f₂ × ... × fₙ
- Complexity: O(nᴺ)

**Parameters:**
- `{NEST_DEPTH}` - Number of nesting levels (N)
- `{VAR_PREFIX}` - Variable naming prefix
- `{INIT_BASE}` - Initial value for each level

**Example Ranking Function (3-nested):**
```
f(i, j, k) = i × M₂ × M₃ + j × M₃ + k
Where Mₖ = max value at level k
Complexity: O(n³)
```

**Use Cases:**
- Multi-dimensional array processing
- N-level hierarchical algorithms
- Tensor operations

---

### 5. N-Multiple Ranking Functions
**File:** `rf_n_multiple.c.tpl`

**Theory:** N-dimensional lexicographic ordering in single loop

**Properties:**
- Single loop with N-tuple state (v₁, v₂, ..., vₙ)
- Lexicographic ordering: v₁ > v₂ > ... > vₙ
- Decreases rightmost possible component each iteration
- Well-founded over ℕᴺ with lex ordering

**Parameters:**
- `{NUM_COMPONENTS}` - Number of components (N)
- `{VAR_PREFIX}` - Variable naming prefix
- `{INIT_VALUE}` - Initial value for components

**Example Ranking Function (3-multiple):**
```
Lex((x, y, z))
Priority: x > y > z
Sequence: (n,n,n) → (n,n,n-1) → ... → (n,n,0) → (n,n-1,n) → ...
Total iterations: n³
```

**Use Cases:**
- Multi-counter algorithms
- Base-n counting
- Multi-phase single-loop algorithms

---

## ❌ Non-Terminating Programs

### 1. Infinite Increment
**File:** `nonterm_infinite_inc.c.tpl`

**Theory:** Variable increases without upper bound

**Properties:**
- No ranking function exists
- Loop condition always satisfied
- Variable grows unboundedly: 0, 1, 2, 3, ...

**Parameters:**
- `{VAR_NAME}` - Loop variable
- `{INCREMENT}` - Increase amount
- `{CONDITION}` - Always-true condition (e.g., x ≥ 0)

**Anti-Pattern:**
```
while (x >= 0) {  // Always true for increasing x
    x = x + 1;
}
```

**Why Non-Terminating:**
- Condition `x ≥ 0` remains true as x increases
- No convergence toward exit

---

### 2. Infinite Decrement
**File:** `nonterm_infinite_dec.c.tpl`

**Theory:** Variable decreases without lower bound

**Properties:**
- Decreases past target (e.g., skips 0)
- For signed integers: continues negative
- No lower bound on ranking function

**Parameters:**
- `{VAR_NAME}` - Loop variable
- `{DECREMENT}` - Decrease amount
- `{CONDITION}` - Condition that's never met (e.g., x == 0)

**Anti-Pattern:**
```
int x = 100;
while (x != 0) {  // Skips 0 if DECREMENT > 1
    x = x - 2;    // 100, 98, ..., 2, -2, -4, ...
}
```

**Why Non-Terminating:**
- Variable skips termination value
- Continues into negative values indefinitely

---

### 3. Periodic/Cyclic Loop
**File:** `nonterm_periodic.c.tpl`

**Theory:** State cycles through finite set of values

**Properties:**
- States repeat: s₀ → s₁ → ... → sₙ → s₀
- System returns to previous states
- Violates well-foundedness requirement

**Parameters:**
- `{VAR1}`, `{VAR2}` - Cycling variables
- `{CYCLE_LENGTH}` - Number of states in cycle

**Anti-Pattern:**
```
while (x != y) {
    temp = x;
    x = y;
    y = temp;  // Swaps: (a,b) → (b,a) → (a,b) → ...
}
```

**Why Non-Terminating:**
- No progress toward exit
- State space forms cycle
- No ranking function can decrease monotonically

---

### 4. Unreachable Exit Condition
**File:** `nonterm_condition_unreach.c.tpl`

**Theory:** Variable update pattern skips exit condition

**Properties:**
- Exit condition is satisfiable but unreachable
- Step size incompatible with target
- Common off-by-one or step-size error

**Parameters:**
- `{VAR_NAME}` - Loop variable
- `{TARGET}` - Exit target value
- `{STEP}` - Step size (incompatible with target)

**Anti-Pattern:**
```
int x = 0;
while (x != 10) {
    x = x + 3;  // Sequence: 0, 3, 6, 9, 12, 15, ...
}               // Skips 10!
```

**Why Non-Terminating:**
- Variable jumps over exit condition
- Condition never becomes true
- Common with wrong step size

---

### 5. Always-True Condition
**File:** `nonterm_always_true.c.tpl`

**Theory:** Loop condition is invariantly true

**Properties:**
- Condition doesn't depend on loop updates
- Or updates don't affect condition
- Tautology or logical error

**Parameters:**
- `{VAR_NAME}` - Variable (possibly unused)
- `{CONDITION}` - Always-true expression
- `{DUMMY_UPDATE}` - Update that doesn't help

**Anti-Pattern:**
```
while (1) { ... }           // Explicit infinite loop
while (x > 0) {             // x always positive
    y = y + 1;              // Wrong variable updated
}
```

**Why Non-Terminating:**
- Condition is tautology or invariant
- Loop body doesn't work toward exit
- Logical error in loop design

---

## 📊 Complexity Analysis

| Template Type | Time Complexity | Space | Iterations |
|---------------|-----------------|-------|------------|
| Linear RF | O(n) | O(1) | n |
| Multiple Linear (2) | O(n²) | O(1) | n² |
| 2-Nested RF | O(n²) | O(1) | Σⁿᵢ₌₁ i |
| N-Nested RF | O(nᴺ) | O(N) | nᴺ |
| N-Multiple RF | O(nᴺ) | O(1) | nᴺ |

---

## 🔬 Research Applications

### Termination Analysis Tools Testing
These templates are designed to test:
- **Ranking function synthesis** algorithms
- **Termination checkers** (e.g., Ultimate Automizer, AProVE)
- **Loop bound analysis** tools
- **Complexity analyzers**

### Coverage Dimensions
- **Linear vs Non-linear**: Start with linear, extend to polynomial
- **Single vs Multiple**: Test lexicographic ordering support
- **Nested vs Flat**: Test hierarchical vs sequential analysis
- **Terminating vs Non-terminating**: Balanced dataset

---

## 🎯 Usage Guidelines

### For Terminating Programs
1. Choose ranking function type based on algorithm structure
2. Ensure ranking function actually decreases
3. Verify well-foundedness (bounded below)
4. Document expected ranking function

### For Non-Terminating Programs
1. Clearly mark as non-terminating in comments
2. Add safety breaks for testing (mark as "// SAFETY")
3. Document why non-termination occurs
4. Explain theoretical reason (no ranking function exists)

---

## 📖 References

### Theoretical Background
1. **Ranking Functions**: Floyd-Hoare logic, well-founded relations
2. **Lexicographic Ordering**: Multi-dimensional well-founded orderings
3. **Nested Loops**: Hierarchical termination arguments

### Key Papers
- Ben-Amram & Genaim: "Ranking Functions for Linear-Constraint Loops"
- Bradley, Manna, Sipma: "Linear Ranking with Reachability"
- Cook et al.: "Ranking Function Synthesis for Nondeterministic Programs"

---

## 🚀 Future Extensions

### Planned Template Types
- [ ] Polynomial ranking functions (quadratic, cubic)
- [ ] Non-linear ranking functions
- [ ] Ranking functions with disjunctive invariants
- [ ] Multi-path ranking functions
- [ ] Probabilistic ranking functions (expected termination)

### Advanced Non-Termination
- [ ] Chaotic/divergent behavior
- [ ] Quasi-periodic patterns
- [ ] Data-dependent non-termination

---

**Created:** 2025-10-24  
**Version:** 1.0  
**Based on:** Ranking Function Theory and Termination Analysis Research
