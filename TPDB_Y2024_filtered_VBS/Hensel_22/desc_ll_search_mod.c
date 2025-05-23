#include <stdlib.h>

extern int __VERIFIER_nondet_int();

struct list {
  int value;
  struct list* next;
};

struct list* init_list(int n) {
  struct list* curr = NULL;
  struct list* tail = curr;

  for (int j = 0; j < n; j++) {
    curr = malloc(sizeof(struct list));
    curr->value = j;
    curr->next = tail;
    tail = curr;
  }

  return curr;
}

void search(struct list* head, int m) {
  struct list* curr = head;
  while(curr->value != m) {
    curr = curr->next;
  }
}

int main() {
  int n = __VERIFIER_nondet_int();
  if (n < 1) return 0;
  int m = __VERIFIER_nondet_int();
  if (m < 0) return 0;
  struct list* head = init_list(n);
  search(head,m%n);
  return 0;
}
