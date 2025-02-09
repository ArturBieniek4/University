#include <avr/io.h>
#include <util/delay.h>
#include <inttypes.h>

#define LED PD7
#define LED_DDR DDRD
#define LED_PORT PORTD

const uint8_t digits[]={
    0b11111100,
    0b01100000,
    0b11011010,
    0b11110010,
    0b00100110,
    0b10110110,
    0b10111111,
    0b11100000,
    0b11111110,
    0b11100111
};

int main() {
    LED_DDR |= 0b11111111;
    UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
    while(1) {
        for(int i=0;i<=9;i=(i+1)%10)
        {
            LED_PORT=~digits[i];
            _delay_ms(1000);
        }
    }
}
