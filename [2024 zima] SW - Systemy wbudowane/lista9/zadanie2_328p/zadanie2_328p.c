#include <avr/io.h>
#include <inttypes.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define LED PB0
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BTN PB1
#define BTN_PIN PINB
#define BTN_PORT PORTB

ISR(SPI_STC_vect)
{
    if (SPDR)
        LED_PORT |= _BV(LED);
    else
        LED_PORT &= ~_BV(LED);
    SPDR = (BTN_PIN & _BV(BTN)) ? 0 : 1;
}

void spi_init()
{
    // ustaw pin MISO jako wyjście
    DDRB |= _BV(PB4);
    // włącz SPI i przerwanie
    SPCR = _BV(SPE) | _BV(SPIE);
}

int main()
{
    spi_init();
    BTN_PORT |= _BV(BTN);
    LED_DDR |= _BV(LED);
    sei();
    while (1)
    {
        sleep_cpu();
    }
}