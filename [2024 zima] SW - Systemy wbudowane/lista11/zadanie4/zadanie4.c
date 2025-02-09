#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <util/delay.h>

// inicjalizacja ADC
void adc_init()
{
  ADMUX |= _BV(REFS0) | _BV(ADLAR); // referencja AVCC, wejście A0
  DIDR0   = _BV(ADC0D); // wyłącz wejście cyfrowe na ADC0
  // częstotliwość zegara ADC 125 kHz (16 MHz / 128)
  ADCSRA = _BV(ADPS0) | _BV(ADPS1) | _BV(ADPS2); // preskaler 128
  ADCSRA |= _BV(ADEN);                           // włącz ADC
}

void timer1_init()
{
    // Fast PWM, TOP =  ICR1
    TCCR1A |= _BV(WGM11);
    TCCR1B |= _BV(WGM13) | _BV(WGM12);

    TCCR1A |= _BV(COM1A1);

    // Prescaler 64, 1kHz
    TCCR1B |= _BV(CS11) | _BV(CS10); // CS12 = 0, CS11 = 1, CS10 = 1
    ICR1 = 4999;

    OCR1A = 1000;
}

int main()
{
  timer1_init();
  DDRB |= _BV(PB1);
  // zainicjalizuj ADC
  adc_init();
  // mierz napięcie
  while (1)
  {
    ADCSRA |= _BV(ADSC); // wykonaj konwersję
    while (!(ADCSRA & _BV(ADIF))); // czekaj na wynik
    ADCSRA |= _BV(ADIF); // wyczyść bit ADIF (pisząc 1!)
    OCR1A = ADCH*(4999/255*13/100)+120;     // weź zmierzoną wartość (0..255)
  }
}