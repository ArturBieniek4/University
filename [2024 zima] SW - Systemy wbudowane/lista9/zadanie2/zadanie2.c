#include <avr/io.h>
#include <inttypes.h>

#define LED PB2 // nóżka 5
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BTN PA7 // nóżka 6
#define BTN_PIN PINA
#define BTN_PORT PORTA

void spi_init()
{
    // ustaw piny MOSI i SCK jako wyjścia
    DDRA = _BV(PA5) | _BV(PA4);
    // ustaw USI w trybie trzyprzewodowym (SPI)
    USICR = _BV(USIWM0);
}

uint8_t spi_transfer(uint8_t data)
{
    // załaduj dane do przesłania
    USIDR = data;
    // wyczyść flagę przerwania USI
    USISR = _BV(USIOIF);
    // póki transmisja nie została ukończona, wysyłaj impulsy zegara
    while (!(USISR & _BV(USIOIF))) {
        // wygeneruj pojedyncze zbocze zegarowe
        // zostanie wykonane 16 razy
        USICR = _BV(USIWM0) | _BV(USICS1) | _BV(USICLK) | _BV(USITC);
    }
    // zwróć otrzymane dane
    return USIDR;
}

int main()
{
    spi_init();
    LED_DDR |= _BV(LED);
    BTN_PORT |= _BV(BTN);
    while(1) {
        uint8_t btn=0;
        if(BTN_PIN & _BV(BTN)) btn=1;
        if(spi_transfer(btn)) LED_PORT |= _BV(LED);
        else LED_PORT &= ~_BV(LED);
    }
}

