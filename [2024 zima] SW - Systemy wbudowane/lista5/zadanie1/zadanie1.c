#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BTN PB4 // D12
#define BTN_PIN PINB
#define BTN_PORT PORTB

#define BUF_SIZE 31

uint8_t buffer[BUF_SIZE];
uint8_t bufcnt=0;
uint8_t bytecnt=1;

#define DELAY 1000/8/BUF_SIZE

// inicjalizacja licznika 2
void timer2_init()
{
  // 16M/256/256=244Hz
  // preskaler 256
  TCCR2B = _BV(CS22) | _BV(CS21);
  // odmaskowanie przerwania przepełnienia licznika
  TIMSK2 |= _BV(TOIE2);
}

// procedura obsługi przerwania przepełnienia licznika
ISR(TIMER2_OVF_vect) {
    if(BTN_PIN & _BV(BTN))
    {
        buffer[bufcnt] |= bytecnt;
    }
    else 
    {
        buffer[bufcnt] &= ~bytecnt;
    }
    bytecnt<<=1;
    if(bytecnt==0)
    {
        bytecnt=1;
        bufcnt++;
        if(bufcnt==BUF_SIZE)
        {
            bufcnt=0;
        }
    }
    if(buffer[bufcnt] & bytecnt)
    {
        LED_PORT &= ~_BV(LED);
    }
    else
    {
        LED_PORT |= _BV(LED);
    }
}

int main() {
    // zainicjalizuj licznik 2
    timer2_init();
    // ustaw tryb uśpienia na tryb bezczynności
    set_sleep_mode(SLEEP_MODE_PWR_SAVE);
    LED_DDR |= _BV(LED);
    BTN_PORT |= _BV(BTN);
    sei();
    while(1)
    {
        sleep_mode();
    }
}
