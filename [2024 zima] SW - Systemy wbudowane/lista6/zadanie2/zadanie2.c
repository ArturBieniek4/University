#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

#define UART_BUFZISE 64

volatile char sendbuf[UART_BUFZISE];
volatile char recvbuf[UART_BUFZISE];
volatile uint8_t sendbuf_pos=0;
volatile uint8_t sendbuf_size=0;
volatile uint8_t recvbuf_pos=0;
volatile uint8_t recvbuf_size=0;

// inicjalizacja UART
void uart_init()
{
  // ustaw baudrate
  UBRR0 = UBRR_VALUE;
  // wyczyść rejestr UCSR0A
  UCSR0A = 0;
  // włącz odbiornik i nadajnik + przerwania
  UCSR0B = _BV(RXEN0) | _BV(TXEN0) | (1 << RXCIE0);
  // ustaw format 8n1
  UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);
}

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream)
{
    while(sendbuf_size==UART_BUFZISE); sleep_cpu(); // czekamy kiedy bufor nadawania jest pełny
    cli();
    sendbuf[(sendbuf_pos+sendbuf_size)%UART_BUFZISE]=data;
    sendbuf_size++;
    UCSR0B |= (1 << UDRIE0); // włączenie przerwania 
    sei();
    return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream)
{
    while(recvbuf_size==0); sleep_cpu(); // czekamy kiedy bufor odbierania jest pusty
    cli();
    char data = recvbuf[recvbuf_pos];
    recvbuf_pos=(recvbuf_pos+1)%UART_BUFZISE;
    recvbuf_size--;
    sei();
    return data;
}

ISR(USART_RX_vect) {
    // if(recvbuf_size==UART_BUFZISE) return; // jeżeli skończył nam się bufor bo nikt go nie czyta to chyba nie mamy innego wyjścia
    // alternatywnie można odbierać do bufora nadpisując najstarsze rzeczy
    recvbuf[(recvbuf_pos+recvbuf_size)%UART_BUFZISE]=UDR0;
    recvbuf_size++;
}

ISR(USART_UDRE_vect) {
    if(sendbuf_size!=0)
    {
        UDR0=sendbuf[sendbuf_pos];
        sendbuf_pos=(sendbuf_pos+1)%UART_BUFZISE;
        sendbuf_size--;
    }
    if(sendbuf_size==0) UCSR0B &= ~(1 << UDRIE0);
}

FILE uart_file;

int main()
{
  // zainicjalizuj UART
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;
  // program testowy
  sei();
  printf("Hello world!\r\n");
  while(1) {
    int16_t a = 1;
    scanf("%"SCNd16, &a);
    printf("Odczytano: %"PRId16"\r\n", a);
  }
}

