#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <util/delay.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

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

// inicjalizacja ADC
void adc_init()
{
  ADMUX  = _BV(REFS0) | 0b1110; // referencja AVcc, wejście AREF
//   DIDR0   = _BV(ADC0D); // wyłącz wejście cyfrowe na ADC0
  // częstotliwość zegara ADC 125 kHz (16 MHz / 128)
  ADCSRA  = _BV(ADPS0) | _BV(ADPS1) | _BV(ADPS2); // preskaler 128
  ADCSRA |= _BV(ADEN) | _BV(ADIE); // włącz ADC i przerwanie
  // SMCR |= _BV(SM0);
}

FILE uart_file;

uint16_t pomiary[100];

ISR(ADC_vect)
{
  // nic nie robimy
}

float seria[100];

int main()
{
    LED_DDR |= _BV(LED);
  // zainicjalizuj UART
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;
  // zainicjalizuj ADC
  adc_init();
  set_sleep_mode(SLEEP_MODE_ADC);
  // mierz napięcie
  while(1) {
    float suma=0;
    for(int i=0;i<100;i++)
    {
      ADCSRA |= _BV(ADSC); // wykonaj konwersję
      sei();
      sleep_mode();
      cli();
      uint16_t v = ADC; // weź zmierzoną wartość (0..1023)
      float volts = 1.1*1024.0/v;
      seria[i]=volts;
      suma+=volts;
    }
    float avg=suma/100;
    float var=0;
    for(int i=0;i<100;i++)
    {
      var += (seria[i] - avg) * (seria[i] - avg);
    }
    var/=100;
    printf("ADC Noise Reduction: %f\r\n", var);

    suma=0;
    for(int i=0;i<100;i++)
    {
      ADCSRA |= _BV(ADSC); // wykonaj konwersję
      while(!(ADCSRA & _BV(ADIF)));
      uint16_t v = ADC; // weź zmierzoną wartość (0..1023)
      float volts = 1.1*1024.0/v;
      seria[i]=volts;
      suma+=volts;
    }
    avg=suma/100;
    var=0;
    for(int i=0;i<100;i++)
    {
      var += (seria[i] - avg) * (seria[i] - avg);
    }
    var/=100;
    printf("ADC aktywne czekanie: %f\r\n", var);

    _delay_ms(500);
  }
}