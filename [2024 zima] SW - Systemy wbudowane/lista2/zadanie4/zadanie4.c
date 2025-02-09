#include <avr/io.h>
#include <util/delay.h>
#include <inttypes.h>

#define LED PD7
#define LED_DDR DDRD
#define LED_PORT PORTD

#define MUX1 PC0
#define MUX2 PC1
#define MUX_DDR DDRC
#define MUX_PORT PORTC

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
    MUX_DDR |= _BV(MUX1);
    MUX_DDR |= _BV(MUX2);
    UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
    while(1) {
        for(uint8_t i=0;i<=5;i=(i+1)%10)
        {
            for(uint8_t j=0;j<=9;j++)
            {
                for(uint16_t k=0;k<500;k++)
                {
                    MUX_PORT = 0b10;
                    LED_PORT=~digits[i];
                    _delay_ms(1);
                    MUX_PORT = 0b01;
                    LED_PORT=~digits[j];
                    _delay_ms(1);
                }
            }
        }
    }
}
