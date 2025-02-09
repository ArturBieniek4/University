#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <util/delay.h>

#define UBRR_VALUE ((F_CPU) / 16 / (BAUD) - 1) // zgodnie ze wzorem

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

// inicjalizacja ADC
void adc_init()
{
  ADMUX |= _BV(REFS0) | _BV(ADLAR) | 0b0101; // referencja AVCC, wejście A5
  DIDR0   = _BV(ADC5D); // wyłącz wejście cyfrowe na ADC5
  // częstotliwość zegara ADC 125 kHz (16 MHz / 128)
  ADCSRA = _BV(ADPS0) | _BV(ADPS1) | _BV(ADPS2); // preskaler 128
  ADCSRA |= _BV(ADEN);                           // włącz ADC
}

int main()
{
  LED_DDR |= _BV(LED);
  // zainicjalizuj ADC
  adc_init();
  // mierz napięcie
  uint8_t ledofftime = 0;
  uint8_t ledontime = 0;
  while (1)
  {
    LED_PORT &= ~_BV(LED); // wyłącz LED na czas pomiaru
    _delay_us(100);          // poczekaj na stabilizację napięcia

    ADCSRA |= _BV(ADSC); // wykonaj konwersję
    while (!(ADCSRA & _BV(ADIF))); // czekaj na wynik
    ADCSRA |= _BV(ADIF); // wyczyść bit ADIF (pisząc 1!)
    ledofftime = ADCH;     // weź zmierzoną wartość (0..255)
    ledontime = 255 - ledofftime;
    while (ledofftime != 0)
    {
      _delay_us(10);
      ledofftime--;
    }
    LED_PORT |= _BV(LED);
    while (ledontime != 0)
    {
      _delay_us(10);
      ledontime--;
    }
  }
}