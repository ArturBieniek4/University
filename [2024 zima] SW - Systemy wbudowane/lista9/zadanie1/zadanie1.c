#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/sleep.h>
#include <avr/interrupt.h>

#define LED PB2 // nóżka 5
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BTN PA7 // nóżka 6
#define BTN_PIN PINA
#define BTN_PORT PORTA

#define BUF_SIZE 16

uint8_t buffer[BUF_SIZE];
uint8_t bufcnt=0;
uint8_t bytecnt=1;

#define DELAY 1000/8/BUF_SIZE

// inicjalizacja licznika 0
void timer0_init()
{
    // WGM  = 0100 - CTC
    // CS0   = 11  - prescaler 64
    // częstotliwość 1000000/(2*64*(1+31)) = 244 Hz
    OCR0A = 31;
    TCCR0B = _BV(WGM02) | _BV(CS01) | _BV(CS00);
    // włącz przerwaie
    TIMSK0 = _BV(OCIE0A);
}

// procedura obsługi przerwania przepełnienia licznika
ISR(TIM0_COMPA_vect) {
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
    // zainicjalizuj licznik 1
    timer0_init();
    // ustaw tryb uśpienia na tryb bezczynności
    set_sleep_mode(SLEEP_MODE_IDLE);
    LED_DDR |= _BV(LED);
    BTN_PORT |= _BV(BTN);
    sei();
    while(1)
    {
        sleep_mode();
    }
}
