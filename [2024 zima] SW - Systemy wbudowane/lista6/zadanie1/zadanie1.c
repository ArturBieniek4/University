#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>
#include <stdbool.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

volatile char received_char;

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

ISR(USART_RX_vect) {
    received_char = UDR0;
    UCSR0B |= (1 << UDRIE0);
}

ISR(USART_UDRE_vect) {
    UDR0 = received_char;
    UCSR0B &= ~(1 << UDRIE0);
}

int main() {
    uart_init();
    set_sleep_mode(SLEEP_MODE_IDLE);
    sei();
    while(1)
    {
        sleep_cpu();
    }
}
