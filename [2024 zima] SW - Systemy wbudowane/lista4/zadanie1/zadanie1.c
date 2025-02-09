#include <avr/io.h>
#include <inttypes.h>
#include <stdio.h>
#include <util/delay.h>

#define BAUD 9600                              // baudrate
#define UBRR_VALUE ((F_CPU) / 16 / (BAUD) - 1) // zgodnie ze wzorem

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

// inicjalizacja UART
void uart_init() {
  // ustaw baudrate
  UBRR0 = UBRR_VALUE;
  // włącz odbiornik i nadajnik
  UCSR0B = _BV(RXEN0) | _BV(TXEN0);
  // ustaw format 8n1
  UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);
}

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream) {
  // czekaj aż transmiter gotowy
  while (!(UCSR0A & _BV(UDRE0)))
    ;
  UDR0 = data;
  return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream) {
  // czekaj aż znak dostępny
  while (!(UCSR0A & _BV(RXC0)))
    ;
  return UDR0;
}

FILE uart_file;

void timer1_init()
{
  // ustaw tryb licznika
  // WGM1  = 0000 -- normal
  // CS1   = 001  -- prescaler 1
  TCCR1B = _BV(CS10);
}

int main() {
  LED_DDR |= _BV(LED);
  // zainicjalizuj UART
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;
  timer1_init();

  volatile int8_t a8=123, b8=223, c8;
  volatile int16_t a16=12345, b16=2345, c16;
  volatile int32_t a32=123456, b32=7891, c32;
  volatile int64_t a64=123456789, b64=7987, c64;
  volatile float af=123.45132, bf=643.213, cf;
  uint16_t timer_a, timer_b;



  timer_a = TCNT1; // wartość licznika przed czekaniem
  c8=a8+b8;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas + 8bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c8=a8-b8;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas - 8bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c8=a8*b8;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas * 8bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c8=a8/b8;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas / 8bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);
  
  printf("\n");




  timer_a = TCNT1; // wartość licznika przed czekaniem
  c16=a16+b16;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas + 16bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c16=a16-b16;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas - 16bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c16=a16*b16;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas * 16bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c16=a16/b16;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas / 16bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);
  
  printf("\n");




  timer_a = TCNT1; // wartość licznika przed czekaniem
  c32=a32+b32;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas + 32bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c32=a32-b32;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas - 32bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c32=a32*b32;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas * 32bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c32=a32/b32;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas / 32bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);
  
  printf("\n");




  timer_a = TCNT1; // wartość licznika przed czekaniem
  c64=a64+b64;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas + 64bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c64=a64-b64;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas - 64bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c64=a64*b64;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas * 64bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  c64=a64/b64;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas / 64bit: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);
  
  printf("\n");

  timer_a = TCNT1; // wartość licznika przed czekaniem
  cf=af+bf;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas + float: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  cf=af-bf;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas - float: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  cf=af*bf;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas * float: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);

  timer_a = TCNT1; // wartość licznika przed czekaniem
  cf=af/bf;
  timer_b = TCNT1; // wartość licznika po czekaniu
  printf("Zmierzony czas / float: %"PRIu16" cykli\r\n", timer_b - timer_a - 4);


  while(1);
}