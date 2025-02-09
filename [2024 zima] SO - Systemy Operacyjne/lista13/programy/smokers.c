#include "csapp.h"

static __unused void outc(char c) {
  Write(STDOUT_FILENO, &c, 1);
}

static __thread unsigned seed;

static sem_t tobacco;
static sem_t matches;
static sem_t paper;
static sem_t doneSmoking;

/* TODO: If you need any extra global variables, then define them here. */
static bool tobacco_placed=false, matches_placed=false, paper_placed=false;
static sem_t tobacco_matches, tobacco_paper, matches_paper;
static sem_t notifier_lock;

static void *agent(void *arg) {
  seed = pthread_self();

  while (true) {
    Sem_wait(&doneSmoking);

    int choice = rand_r(&seed) % 3;
    if (choice == 0) {
      Sem_post(&tobacco);
      Sem_post(&paper);
    } else if (choice == 1) {
      Sem_post(&tobacco);
      Sem_post(&matches);
    } else {
      Sem_post(&paper);
      Sem_post(&matches);
    }
  }

  return NULL;
}

/* TODO: If you need extra threads, then define their main procedures here. */
static void *notifier(void *arg)
{
  char type = (long)arg;
  while(true) {
    if(type=='t') Sem_wait(&tobacco);
    if(type=='m') Sem_wait(&matches);
    if(type=='p') Sem_wait(&paper);
    // fprintf(stderr, "[%c], %d, %d, %d\n", type, tobacco_placed, matches_placed, paper_placed);
    Sem_wait(&notifier_lock);
    if(type=='t') {
      if(matches_placed) {
        matches_placed=false;
        Sem_post(&tobacco_matches);
      } else if(paper_placed) {
        paper_placed=false;
	      Sem_post(&tobacco_paper);
      } else tobacco_placed=true;
    }
    else if(type=='m') {
      if(tobacco_placed) {
        tobacco_placed=false;
        Sem_post(&tobacco_matches);
      } else if(paper_placed) {
        paper_placed=false;
	      Sem_post(&matches_paper);
      } else matches_placed=true;
    }
    else if(type=='p'){
      if(matches_placed) {
        matches_placed=false;
        Sem_post(&matches_paper);
      } else if(tobacco_placed) {
        tobacco_placed=false;
	      Sem_post(&tobacco_paper);
      } else paper_placed=true;
    }
    Sem_post(&notifier_lock);
  }
  return NULL;
}

static void randsleep(void) {
  usleep(rand_r(&seed) % 1000 + 1000);
}

static void make_and_smoke(char smoker) {
  randsleep();
  Sem_post(&doneSmoking);
  outc(smoker);
  randsleep();
}

static void *smokerWithMatches(void *arg) {
  seed = pthread_self();

  while (true) {
    /* TODO: wait for paper and tobacco */
    Sem_wait(&tobacco_paper);
    make_and_smoke('M');
  }

  return NULL;
}

static void *smokerWithTobacco(void *arg) {
  seed = pthread_self();

  while (true) {
    /* TODO: wait for paper and matches */
    Sem_wait(&matches_paper);
    make_and_smoke('T');
  }

  return NULL;
}

static void *smokerWithPaper(void *arg) {
  seed = pthread_self();
 
  while (true) {
    /* TODO: wait for tobacco and matches */
    Sem_wait(&tobacco_matches);
    make_and_smoke('P');
  }

  return NULL;
}

int main(void) {
  Sem_init(&tobacco, 0, 0);
  Sem_init(&matches, 0, 0);
  Sem_init(&paper, 0, 0);
  Sem_init(&doneSmoking, 0, 1);

  /* TODO: Initialize your global variables here. */
  Sem_init(&tobacco_matches, 0, 0);
  Sem_init(&tobacco_paper, 0, 0);
  Sem_init(&matches_paper, 0, 0);
  Sem_init(&notifier_lock, 0, 1);
  pthread_t tobacco_matches_t, tobacco_paper_t, matches_paper_t;
  Pthread_create(&tobacco_matches_t, NULL, notifier, (void *)'p');
  Pthread_create(&tobacco_paper_t, NULL, notifier, (void *)'m');
  Pthread_create(&matches_paper_t, NULL, notifier, (void *)'t');

  pthread_t agentThread;
  Pthread_create(&agentThread, NULL, agent, NULL);

  pthread_t smokerPaperThread, smokerMatchesThread, smokerTobaccoThread;
  Pthread_create(&smokerPaperThread, NULL, smokerWithPaper, NULL);
  Pthread_create(&smokerMatchesThread, NULL, smokerWithMatches, NULL);
  Pthread_create(&smokerTobaccoThread, NULL, smokerWithTobacco, NULL);

  Pthread_join(agentThread, NULL);
  Pthread_join(smokerPaperThread, NULL);
  Pthread_join(smokerMatchesThread, NULL);
  Pthread_join(smokerTobaccoThread, NULL);

  Pthread_join(tobacco_matches_t, NULL);
  Pthread_join(tobacco_paper_t, NULL);
  Pthread_join(matches_paper_t, NULL);

  return 0;
}
