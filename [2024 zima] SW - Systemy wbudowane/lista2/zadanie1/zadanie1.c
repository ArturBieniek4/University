#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BTN PB4 // D12
#define BTN_PIN PINB
#define BTN_PORT PORTB

#define BUF_SIZE 25

uint8_t buffer[BUF_SIZE];
uint8_t bufcnt=0;
uint8_t bytecnt=1;

#define DELAY 1000/8/BUF_SIZE

int main() {
    LED_DDR |= _BV(LED);
    BTN_PORT |= _BV(BTN);
    while(1)
    {
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
        _delay_ms(DELAY);
    }
}
