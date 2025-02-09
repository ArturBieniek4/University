#include <avr/io.h>
#include <util/delay.h>
#include <inttypes.h>

const uint8_t digits[]={
    0b00111111,
    0b00000110,
    0b01011011,
    0b01001111,
    0b01100100,
    0b01101101,
    0b11111101,
    0b00000111,
    0b01111111,
    0b11100111
};

// inicjalizacja SPI
void spi_init()
{
    // ustaw piny MOSI, SCK i ~SS jako wyjścia
    DDRB |= _BV(DDB3) | _BV(DDB5) | _BV(DDB2);
    // włącz SPI w trybie master z zegarem F/4
    SPCR = _BV(SPE) | _BV(MSTR);
}

// transfer jednego bajtu
void spi_transfer(uint8_t data)
{
    PORTB |= _BV(PB2);

    // rozpocznij transmisję
    SPDR = data;
    while (!(SPSR & _BV(SPIF)));
    SPSR |= _BV(SPIF);
    
    PORTB &= ~_BV(PB2); // zbocze opadające LE
}

int main() {
    spi_init();
    
    while(1) {
        for(int i=0;i<=9;i=(i+1)%10)
        {
            spi_transfer(digits[i]);
            _delay_ms(1000);
        }
    }
}
