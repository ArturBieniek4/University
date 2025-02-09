//make && python3 gen-nums.py 10 | ./mergesort
#include "csapp.h"

typedef struct {
  int child_fd;
  int parent_fd;
} sockpair_t;

static sockpair_t MakeSocketPair(void) {
  int sv[2];
  Socketpair(AF_UNIX, SOCK_STREAM, 0, sv);
  return (sockpair_t){.child_fd = sv[0], .parent_fd = sv[1]};
}

static bool MaybeReadNum(int fd, int *num_p) {
  return Read(fd, num_p, sizeof(int)) == sizeof(int);
}

static int ReadNum(int fd) {
  int num;
  if (Read(fd, &num, sizeof(int)) < sizeof(int))
    app_error("ReadNum error");
  return num;
}

static void WriteNum(int fd, int num) {
  if (Write(fd, &num, sizeof(int)) < sizeof(int))
    app_error("WriteNum error");
}

static void SendElem(int parent_fd, int child_fd, int nelem) {
  WriteNum(child_fd, nelem);
  for (int i = 0; i < nelem; i++)
    WriteNum(child_fd, ReadNum(parent_fd));
}

static void Merge(int left_fd, int right_fd, int parent_fd) {
  bool has_left = true;
  bool has_right = true;
  int left = ReadNum(left_fd);
  int right = ReadNum(right_fd);

  do {
    if ((has_left && has_right) ? left < right : has_left) {
      WriteNum(parent_fd, left);
      has_left = MaybeReadNum(left_fd, &left);
    } else {
      WriteNum(parent_fd, right);
      has_right = MaybeReadNum(right_fd, &right);
    }
  } while (has_left || has_right);
}

static void Sort(int parent_fd) {
  int nelem = ReadNum(parent_fd);

  if (nelem < 2) {
    WriteNum(parent_fd, ReadNum(parent_fd));
    Close(parent_fd);
    return;
  }

  sockpair_t left = MakeSocketPair();
  if (Fork() == 0) {
    // left child
    Close(left.parent_fd);
    Sort(left.child_fd);
    exit(0);
  }

  sockpair_t right = MakeSocketPair();
  if (Fork() == 0) {
    // right child
    Close(right.parent_fd);
    Sort(right.child_fd);
    exit(0);
  }

  // Parent zamyka niepotrzebne gniazda
  Close(left.child_fd);
  Close(right.child_fd);

  int left_nelem = nelem / 2;
  SendElem(parent_fd, left.parent_fd, left_nelem);

  int right_nelem = nelem - left_nelem;
  SendElem(parent_fd, right.parent_fd, right_nelem);


  Merge(left.parent_fd, right.parent_fd, parent_fd);

  Close(left.parent_fd);
  Close(right.parent_fd);

  /* Wait for both children. */
  Wait(NULL);
  Wait(NULL);
}

static int GetNumber(void) {
  char buf[20];
  if (fgets(buf, sizeof(buf), stdin) == NULL)
    app_error("GetNumber error");
  return strtol(buf, NULL, 10);
}

int main(void) {
  sockpair_t sort = MakeSocketPair();

  if (Fork()) {
    /* parent */
    int nelem = GetNumber();
    if (nelem < 2)
      app_error("Number of sorted elements must be at least 2!\n");
    Close(sort.child_fd);

    /* Write unsorted numbers to mergesort */
    WriteNum(sort.parent_fd, nelem);
    for (int i = 0; i < nelem; i++)
      WriteNum(sort.parent_fd, GetNumber());

    /* Read sorted numbers from mergesort */
    int prev = INT_MIN;
    for (int i = 0; i < nelem; i++) {
      int elem = ReadNum(sort.parent_fd);
      fprintf(stderr, "%d\n", elem);
      assert(prev <= elem);
      prev = elem;
    }
    Close(sort.parent_fd);

    Wait(NULL);
  } else {
    /* child */
    Close(sort.parent_fd);
    Sort(sort.child_fd);
  }

  return 0;
}
