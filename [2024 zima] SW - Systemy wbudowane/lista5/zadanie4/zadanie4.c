#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>
#include <stdio.h>
#include <util/delay.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

// inicjalizacja UART
void uart_init()
{
  // ustaw baudrate
  UBRR0 = UBRR_VALUE;
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

volatile uint16_t last_capture = 0;
volatile uint16_t capture_diff = 0;
volatile uint16_t frequency = 0;

void timer1_init()
{
  TCCR1A = 0;
  TCCR1B |= _BV(CS11) | _BV(CS10) | _BV(ICES1);  // preskaler 64
  TIMSK1 |= (1 << ICIE1);  // Włącz przerwanie od Capture Event
}

ISR(TIMER1_CAPT_vect) {
    uint16_t capture_value = ICR1;  // Odczytaj wartość Capture
    capture_diff = capture_value - last_capture;  // Oblicz różnicę między kolejnymi pomiarami
    last_capture = capture_value;  // Zapisz bieżącą wartość Capture
    
    frequency = F_CPU / 64 / capture_diff;  // Częstotliwość = F_CPU / preskaler / różnica
}

FILE uart_file;

int main()
{
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;
  // uruchom licznik
  timer1_init();
  LED_DDR |= _BV(LED);
  set_sleep_mode(SLEEP_MODE_PWR_SAVE);
  while(1)
  {
    cli();
    printf("%d\r\n", frequency);
    sei();
    sleep_cpu();
    
  } 
}

