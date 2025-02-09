#include <avr/io.h>
#include <util/delay.h>
#include <inttypes.h>
#include <stdbool.h>

#define LED PD7
#define LED_DDR DDRD
#define LED_PORT PORTD

#define NEXTBTN PB4 // D12
#define NEXTBTN_PIN PINB
#define NEXTBTN_PORT PORTB

#define PREVBTN PB3 // D11
#define PREVBTN_PIN PINB
#define PREVBTN_PORT PORTB

#define ZEROBTN PB2 // D10
#define ZEROBTN_PIN PINB
#define ZEROBTN_PORT PORTB

bool isbtnchanged(uint8_t *btnpin, uint8_t btn, int16_t ms)
{
    uint8_t state = (*btnpin & _BV(btn));
    while(ms>=0)
    {
        _delay_ms(1);
        if((*btnpin & _BV(btn))!=state) return true;
        ms--;
    }
    return false;
}

uint8_t n=0;

uint8_t gray(uint8_t n)
{
    return n ^ (n>>1);
}

int main() {
    LED_DDR = 0b11111111;
    UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
    NEXTBTN_PORT |= _BV(NEXTBTN);
    PREVBTN_PORT |= _BV(PREVBTN);
    ZEROBTN_PORT |= _BV(ZEROBTN);
    while(1) {
        if(!(NEXTBTN_PIN & _BV(NEXTBTN)))
        {
            if(isbtnchanged(&NEXTBTN_PIN, NEXTBTN, 20)) continue;
            n++;
            isbtnchanged(&NEXTBTN_PIN, NEXTBTN, 200); // ograniczenie prędkości przewijania przy trzymaniu przycisku
        }
        else if(!(PREVBTN_PIN & _BV(PREVBTN)))
        {
            if(isbtnchanged(&PREVBTN_PIN, PREVBTN, 20)) continue;
            n--;
            isbtnchanged(&PREVBTN_PIN, PREVBTN, 200); // ograniczenie prędkości przewijania przy trzymaniu przycisku
        }
        else if(!(ZEROBTN_PIN & _BV(ZEROBTN)))
        {
            if(isbtnchanged(&ZEROBTN_PIN, ZEROBTN, 20)) continue;
            n=0;
        }
        LED_PORT=gray(n);
    }
}
