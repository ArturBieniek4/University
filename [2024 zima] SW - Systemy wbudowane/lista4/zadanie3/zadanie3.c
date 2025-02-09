#include <avr/io.h>
#include <util/delay.h>
#include "logscale.h"
#include "hsv.h"
#include <stddef.h>
#include <stdlib.h>

// inicjalizacja ADC
void adc_init()
{
  ADMUX  = _BV(REFS0) | 0b1110; // referencja AVcc, wejście AREF
//   DIDR0   = _BV(ADC0D); // wyłącz wejście cyfrowe na ADC0
  // częstotliwość zegara ADC 125 kHz (16 MHz / 128)
  ADCSRA  = _BV(ADPS0) | _BV(ADPS1) | _BV(ADPS2); // preskaler 128
  ADCSRA |= _BV(ADEN); // włącz ADC
}

void timer1_init() {
  // ustaw tryb licznika
  // COM1A = 10   -- non-inverting mode
  // WGM1  = 0101 -- fast PWM 8-bit
  // CS1   = 001  -- prescaler 1
  TCCR1A = _BV(COM1A1) | _BV(COM1B1) | _BV(WGM10);
  TCCR1B = _BV(WGM12) | _BV(CS10);
  // ustaw pin OC1A (PB1) jako wyjście
  DDRB |= _BV(PB1);
  // ustaw pin OC1B (PB2) jako wyjście
  DDRB |= _BV(PB2);
}

void timer0_init() {
  // ustaw tryb licznika
  // COM0A = 10   -- non-inverting mode
  // WGM0  = 011 -- fast PWM top=0xFF
  // CS0   = 001  -- prescaler 1
  TCCR0A = _BV(COM0A1) | _BV(WGM00) | _BV(WGM01);
  TCCR0B = _BV(CS00);
  // ustaw pin OC0A (PD6) jako wyjście
  DDRD |= _BV(PD6);
}

int main() {
  // inicjalizacja ADC
  adc_init();

  // uruchom licznik
  timer0_init();
  timer1_init();

  // inicjalizacja randa poprzez pierwszy odczyt z ADC
  ADCSRA |= _BV(ADSC); // wykonaj konwersję
  while (!(ADCSRA & _BV(ADIF))); // czekaj na wynik
  ADCSRA |= _BV(ADIF); // wyczyść bit ADIF (pisząc 1!)
  uint16_t v = ADC; // weź zmierzoną wartość (0..1023)
  srand(v);
  rand(); // pierwszy wynik jest chyba bezpośrednio zależny od seeda więc trzeba go odrzucić.

  while (1)
  {
    uint32_t rr = rand();
    rr=rr*255/RAND_MAX;
    uint8_t r = rr;

    for(uint8_t i=0; i!=255; i++)
    {
      uint8_t fill = logscale[i];

      OCR0A=255-(fill*color[r][0]/256);
      OCR1A=255-(fill*color[r][1]/256);
      OCR1B=255-(fill*color[r][2]/256);
      _delay_ms(10);
    }

    for(uint8_t i=255; i!=0; i--)
    {
      uint8_t fill = logscale[i];
      OCR0A=255-(fill*color[r][0]/256);
      OCR1A=255-(fill*color[r][1]/256);
      OCR1B=255-(fill*color[r][2]/256);
      _delay_ms(10);
    }
  }
}
