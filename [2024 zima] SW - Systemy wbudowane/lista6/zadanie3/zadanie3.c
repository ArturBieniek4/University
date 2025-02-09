#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/pgmspace.h>
#include <util/delay.h>
#include "dzwiek3.c"

// inicjalizacja SPI
void spi_init()
{
    // ustaw piny MOSI, SCK i ~SS jako wyjścia
    DDRB |= _BV(DDB3) | _BV(DDB5) | _BV(DDB2);
    // włącz SPI w trybie master z zegarem F/4
    SPCR = _BV(SPE) | _BV(MSTR);
}

// transfer jednego bajtu
void dac_transfer(uint8_t data)
{
    uint8_t high = 0b00110000 | (data>>4);
    uint8_t low = data<<4;
    PORTB &= ~_BV(PB2);
    // rozpocznij transmisję
    SPDR = high;
    while (!(SPSR & _BV(SPIF)));
    SPSR |= _BV(SPIF);

    SPDR = low;
    while (!(SPSR & _BV(SPIF)));
    SPSR |= _BV(SPIF);
    
    PORTB |= _BV(PB2);
}

int main()
{
  // zainicjalizuj SPI
  spi_init();
  
  while(1) {
    for(uint16_t i=0; i<sizeof(dzwiek_raw); i++){
        unsigned char byte = pgm_read_byte(&(dzwiek_raw[i]));
        dac_transfer(byte);
        _delay_us(63);
    }
    _delay_ms(1000);
  }
}

