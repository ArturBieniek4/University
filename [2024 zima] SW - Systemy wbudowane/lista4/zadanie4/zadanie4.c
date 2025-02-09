#include <avr/io.h>
#include <util/delay.h>

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

#define DET PB0 // D8
#define DET_PIN PINB

void timer1_init()
{
  // ustaw tryb licznika
  // COM1A = 10   -- non-inverting mode
  // WGM1  = 1110 -- fast PWM top=ICR1
  // CS1   = 101  -- prescaler 1024
  // ICR1  = 441
  // częstotliwość 16e6/(1*(1+441)) = około 37.9 kHz
  // wzór: datasheet 20.12.3 str. 164
  ICR1 = 421;
  TCCR1A = _BV(COM1A1) | _BV(WGM11);
  TCCR1B = _BV(WGM12) | _BV(WGM13) | _BV(CS10);
  // ustaw pin OC1A (PB1) jako wyjście
  DDRB |= _BV(PB1);
}



int main()
{
  // uruchom licznik
  timer1_init();
  LED_DDR |= _BV(LED);
  while(1)
  {
    for(uint8_t i=0; i<6; i++)
    {
      OCR1A = ICR1/2;
      _delay_us(600);
      OCR1A = 0;
      _delay_us(600);
    }
    if(DET_PIN & _BV(DET))
    {
      LED_PORT |= _BV(LED);
    }
    else
    {
      LED_PORT &= ~_BV(LED);
    }
  } 
}

