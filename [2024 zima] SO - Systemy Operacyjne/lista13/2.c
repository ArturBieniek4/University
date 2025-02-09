typedef struct Sem {
	pthread_mutex_t mutex;
	pthread_cond_t waiters;
	int value;
} Sem_t;

void init(Sem_t *sem, int value) {
	pthread_mutex_init(&sem->mutex, NULL);
	pthread_cond_init(&sem->waiters, NULL);
	sem->value = value;
}

void wait(Sem_t *sem, int value) {
	pthread_mutex_lock(&sem->mutex);

	while(sem->value == 0) {
		pthread_cond_wait(&sem->waiters, &sem->mutex);
	}

	sem->value--;
	pthread_mutex_unlock(&sem->mutex);
}

void post(Sem_t *sem) { // V
	pthread_mutex_lock(&sem->mutex);
	sem->value++;
	pthread_cond_signal(&sem->waiters);
	pthread_mutex_unlock(&sem->mutex);
}
