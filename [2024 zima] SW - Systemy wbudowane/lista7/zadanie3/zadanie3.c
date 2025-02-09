#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include "i2c.c"
#include <util/delay.h>
#include <string.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem
#define DS3231_ADDR 0xD0

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

const uint8_t eeprom_addr = 0xa0;

uint8_t bcd_to_bin(uint8_t bcd)
{
  return (bcd & 0x0F) + ((bcd >> 4) * 10);
}

uint8_t bin_to_bcd(uint8_t bin)
{
  return ((bin / 10) << 4) | (bin % 10);
}

void ds3231_read(uint8_t reg, uint8_t *data, uint8_t length)
{
  i2cStart();
  i2cSend(DS3231_ADDR);
  i2cSend(reg);
  i2cStart();
  i2cSend(DS3231_ADDR | 1);
  for (uint8_t i = 0; i < length; i++)
    data[i] = (i == length - 1) ? i2cReadNoAck() : i2cReadAck();
  i2cStop();
}

void ds3231_write(uint8_t reg, uint8_t *data, uint8_t length)
{
  i2cStart();
  i2cSend(DS3231_ADDR);
  i2cSend(reg);
  for (uint8_t i = 0; i < length; i++)
    i2cSend(data[i]);
  i2cStop();
}

int main()
{
  // zainicjalizuj UART
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;
  // zainicjalizuj I2C
  i2cInit();
  // program testowy
  printf("Ready!\r\n");
  while(1) {
    char cmd[5];
    scanf("%4s", cmd);
    if(strcmp(cmd, "date")==0)
    {
      uint8_t data[3];
      ds3231_read(0x04, data, 3);
      uint8_t day = bcd_to_bin(data[0]);
      uint8_t month = bcd_to_bin(data[1] & 0x1F);
      uint16_t year = 2000 + bcd_to_bin(data[2]);
      printf("%02d-%02d-%04d\r\n", day, month, year);
    }
    else if(strcmp(cmd, "time")==0)
    {
      uint8_t data[3];
      ds3231_read(0x00, data, 3);
      uint8_t sec = bcd_to_bin(data[0]);
      uint8_t min = bcd_to_bin(data[1]);
      uint8_t hour = bcd_to_bin(data[2] & 0x3F);
      printf("%02d:%02d:%02d\r\n", hour, min, sec);
    }
    else if(strcmp(cmd, "set") == 0)
    {
      scanf("%4s", cmd);
      if(strcmp(cmd, "date") == 0)
      {
        uint8_t day, month;
        uint16_t year;
        scanf("%2hhu-%2hhu-%4hu", &day, &month, &year);

        uint8_t data[3];
        data[0] = bin_to_bcd(day);
        data[1] = bin_to_bcd(month) | ((year >= 2100) ? 0x80 : 0x00);
        data[2] = bin_to_bcd(year % 100);

        ds3231_write(0x04, data, 3);
        printf("Date set to: %02d-%02d-%04d\r\n", day, month, year);
      }
      else if (strcmp(cmd, "time") == 0)
      {
        uint8_t hour, min, sec;
        scanf("%2hhu:%2hhu:%2hhu", &hour, &min, &sec);

        uint8_t data[3];
        data[0] = bin_to_bcd(sec);
        data[1] = bin_to_bcd(min);
        data[2] = bin_to_bcd(hour);

        ds3231_write(0x00, data, 3);
        printf("Time set to: %02d:%02d:%02d\r\n", hour, min, sec);
      }
      else
      {
        printf("Unknown command\r\n");
      }
    }
    else
    {
      printf("Unknown command\r\n");
    }
  }
}

