#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>

#define BAUD 9600
#define UBRR_VALUE ((F_CPU) / 16 / (BAUD)-1)

#define SPI_PORT PORTD
#define SPI_PIN PIND
#define SPI_MISO PD4
#define SPI_MOSI PD5
#define SPI_SCK  PD6
#define SPI_SS   PD7

// inicjalizacja UART
void uart_init()
{
  // ustaw baudrate
  UBRR0 = UBRR_VALUE;
  // wyczyść rejestr UCSR0A
  UCSR0A = 0;
  // włącz odbiornik i nadajnik
  UCSR0B = _BV(RXEN0) | _BV(TXEN0);
  // ustaw format 8n1
  UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);
}

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream)
{
  // czekaj aż transmiter gotowy
  while(!(UCSR0A & _BV(UDRE0)));
  UDR0 = data;
  return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream)
{
  // czekaj aż znak dostępny
  while (!(UCSR0A & _BV(RXC0)));
  return UDR0;
}

FILE uart_file;

// inicjalizacja SPI
void spi_init()
{
    // ustaw piny MOSI, SCK i ~SS jako wyjścia
    DDRB &= ~((1 << PB3) | (1 << PB5) | (1 << PB7));
    DDRB |= (1 << PB4);  // MISO jako wyjście
    SPCR = (1 << SPE);   // Włącz SPI w trybie slave
}

// Inicjalizacja GPIO dla bit-banging SPI (Master)
void spi_master_init() {
    DDRD |= (1 << SPI_MOSI) | (1 << SPI_SCK) | (1 << SPI_SS);
    DDRD &= ~(1 << SPI_MISO);
    SPI_PORT |= (1 << SPI_SS);
    SPI_PORT &= ~(1 << SPI_SCK);
}

uint8_t spi_master_transfer(uint8_t data) {
    uint8_t received = 0;

    for (uint8_t i = 0; i < 8; i++) {
        if (data & 0b10000000)
            SPI_PORT |= (1 << SPI_MOSI);
        else
            SPI_PORT &= ~(1 << SPI_MOSI);

        // zbocze narastające na SCK
        SPI_PORT |= (1 << SPI_SCK);
        _delay_us(1);

        // Odczytaj bit z MISO
        received = (received << 1) | ((SPI_PIN & (1 << SPI_MISO)) ? 1 : 0);

        // zbocze opadające na SCK
        SPI_PORT &= ~(1 << SPI_SCK);
        _delay_us(1);

        data <<= 1;
    }

    return received;
}

int main() {
    // Inicjalizacja UART, SPI Slave i SPI Master (bit-banging)
    uart_init();
    spi_init();
    spi_master_init();

    fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
    stdin = stdout = stderr = &uart_file;

    printf("Ready!\r\n");

    uint8_t counter = 1;

    while (1) {
        SPI_PORT &= ~(1 << SPI_SS);
        _delay_us(10);

        uint8_t received = spi_master_transfer(counter);
        _delay_us(10);

        SPI_PORT |= (1 << SPI_SS);

        printf("Wysłano: %d, Odebrano: %d\r\n", counter, received);
        counter++;

        _delay_ms(100);
    }
    return 0;
}
