#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <util/delay.h>
#include <string.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

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
  ADMUX   = _BV(REFS0) | _BV(REFS1); // referencja 1.1V, wejście ADC0
  DIDR0   = _BV(ADC0D); // wyłącz wejście cyfrowe na ADC0
  // częstotliwość zegara ADC 125 kHz (16 MHz / 128)
  ADCSRA  = _BV(ADPS0) | _BV(ADPS1) | _BV(ADPS2); // preskaler 128
  ADCSRA |= _BV(ADEN); // włącz ADC
}

FILE uart_file;

#define HEAT_DDR DDRB
#define HEAT_PORT PORTB
#define HEAT PB5

#define HIST 1

int main()
{
    // zainicjalizuj UART
    uart_init();
    // skonfiguruj strumienie wejścia/wyjścia
    fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
    stdin = stdout = stderr = &uart_file;
    // zainicjalizuj ADC
    adc_init();

    HEAT_DDR |= _BV(HEAT);
    int temp = 28;
    uint8_t heating = 0;
    // mierz napięcie

    while(1) {
        char cmd;
        scanf("%c", &cmd);
        if(cmd=='s')
        {
            printf("Ustawianie temparetury:");
            scanf("%d", &temp);
            printf("\r\nUstawiona temperatura: %d\r\n", temp);
        }
        HEAT_PORT &= ~_BV(HEAT);
        _delay_ms(10);
        ADCSRA |= _BV(ADSC); // wykonaj konwersję
        while (!(ADCSRA & _BV(ADIF))); // czekaj na wynik
        ADCSRA |= _BV(ADIF); // wyczyść bit ADIF (pisząc 1!)
        uint8_t celcius = ((1.1*ADC*1000/1024)-500)/10; // weź zmierzoną wartość (0..1023)
        if(celcius<(temp-HIST)) heating=1;
        else if(celcius>temp) heating=0;
        printf("Temperatura: %d, grzałka: %d\r\n", celcius, heating);
        if(heating) HEAT_PORT |= _BV(HEAT);
        else HEAT_PORT &= ~_BV(HEAT);
    }
}