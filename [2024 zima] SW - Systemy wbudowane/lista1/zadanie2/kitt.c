#include <avr/io.h>
#include <util/delay.h>
#include <inttypes.h>

#define LED PD7
#define LED_DDR DDRD
#define LED_PORT PORTD

uint16_t kitt=0b111000000000;

int main() {
    LED_DDR = 0b11111111;
    LED_PORT = kitt>>2;
    UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
    while(1) {
        UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
        for(int i=0;i<9;i++)
        {
            kitt=kitt>>1;
            LED_PORT=kitt>>2;
            _delay_ms(300);
        }
        for(int i=0;i<9;i++)
        {
            kitt=kitt<<1;
            LED_PORT=kitt>>2;
            _delay_ms(300);
        }
    }
}
