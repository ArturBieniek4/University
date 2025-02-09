#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <util/delay.h>

#define MOTOR_1A PB2 // D10
#define MOTOR_2A PB3 // D11
#define MOTOR_DDR DDRB
#define MOTOR_PORT PORTB

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

    ICR1 = 128;

    OCR1A = 0;
}


// PWM to EN
int main()
{
  MOTOR_DDR |= _BV(MOTOR_1A);
  MOTOR_DDR |= _BV(MOTOR_2A);
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
    uint8_t adc = ADCH;
    if(adc&128)
    {
      MOTOR_PORT |= _BV(MOTOR_1A);
      MOTOR_PORT &= ~_BV(MOTOR_2A);
      OCR1A = adc-128;
    }
    else
    {
      MOTOR_PORT &= ~_BV(MOTOR_1A);
      MOTOR_PORT |= _BV(MOTOR_2A);
      OCR1A = 128 - adc;
    }
  }
}