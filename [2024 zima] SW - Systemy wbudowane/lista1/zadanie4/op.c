#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>

#define LED PB5
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

// inicjalizacja UART
void uart_init()
{
  // ustaw baudrate
  UBRR0 = UBRR_VALUE;
  // wyczyść rejestr UCSR0A
  UCSR0A = 0;
  // włącz odbiornik i nadajnik
  UCSR0B = _BV(RXEN0) | _BV(TXEN0);
  // ustaw format 8n1
  UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);
}

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream)
{
  // czekaj aż transmiter gotowy
  while(!(UCSR0A & _BV(UDRE0)));
  UDR0 = data;
  return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream)
{
  // czekaj aż znak dostępny
  while (!(UCSR0A & _BV(RXC0)));
  return UDR0;
}

FILE uart_file;

int main() {
  // zainicjalizuj UART
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;

  LED_DDR |= _BV(LED);

  printf("Calculator\r\n");
  while(1) {
    printf("8 bit\r\n");
    int8_t d8_1, d8_2;
    scanf("%"SCNd8, &d8_1);
    printf("Odczytano d1: %d\r\n", d8_1);
    scanf("%"SCNd8, &d8_2);
    printf("Odczytano d2: %d\r\n", d8_2);
    printf("Dodawanie: %d\r\n", d8_1+d8_2);
    printf("Mnożenie: %d\r\n", d8_1*d8_2);
    printf("Dzielenie: %d\r\n", d8_1/d8_2);
    
    printf("16 bit\r\n");
    int16_t d16_1, d16_2;
    scanf("%"SCNd16, &d16_1);
    printf("Odczytano d1: %d\r\n", d16_1);
    scanf("%"SCNd16, &d16_2);
    printf("Odczytano d2: %d\r\n", d16_2);
    printf("Dodawanie: %d\r\n", d16_1+d16_2);
    printf("Mnożenie: %d\r\n", d16_1*d16_2);
    printf("Dzielenie: %d\r\n", d16_1/d16_2);
    
    printf("32 bit\r\n");
    int32_t d32_1, d32_2;
    scanf("%"SCNd32, &d32_1);
    printf("Odczytano d1: %d\r\n", d32_1);
    scanf("%"SCNd32, &d32_2);
    printf("Odczytano d2: %d\r\n", d32_2);
    printf("Dodawanie: %d\r\n", d32_1+d32_2);
    printf("Mnożenie: %d\r\n", d32_1*d32_2);
    printf("Dzielenie: %d\r\n", d32_1/d32_2);

    printf("64 bit\r\n");
    int64_t d64_1, d64_2;
    scanf("%"SCNd32, &d64_1);
    printf("Odczytano d1: %d\r\n", d64_1);
    scanf("%"SCNd32, &d64_2);
    printf("Odczytano d2: %d\r\n", d64_2);
    printf("Dodawanie: %d\r\n", d64_1+d64_2);
    printf("Mnożenie: %d\r\n", d64_1*d64_2);
    printf("Dzielenie: %d\r\n", d64_1/d64_2);

    printf("float\r\n");
    float f_1, f_2;
    scanf("%f", &f_1);
    printf("Odczytano d1: %f\r\n", f_1);
    scanf("%f", &f_2);
    printf("Odczytano d2: %f\r\n", f_2);
    printf("Dodawanie: %f\r\n", f_1+f_2);
    printf("Mnożenie: %f\r\n", f_1*f_2);
    printf("Dzielenie: %f\r\n", f_1/f_2);
  }

  
  
}
