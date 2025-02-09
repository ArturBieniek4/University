/*
Przykładowe dane z Wikipedii w formacie I8HEX:
:10010000214601360121470136007EFE09D2190140
:100110002146017E17C20001FF5F16002148011928
:10012000194E79234623965778239EDA3F01B2CAA7
:100130003F0156702B5E712B722B732146013421C7
:00000001FF

read 0x0100 64
*/

#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include "i2c.c"
#include <util/delay.h>
#include <string.h>
#include <stdbool.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

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

uint8_t calculate_checksum(uint8_t *data, uint8_t length, uint16_t address, uint8_t type)
{
  uint8_t checksum = length + (address >> 8) + (address & 0xFF) + type;
  for (uint8_t i = 0; i < length; i++)
    checksum += data[i];
  return ~checksum + 1; // U2
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
  #define i2cCheck(code, msg) \
    if ((TWSR & 0xf8) != (code)) { \
      printf(msg " failed, status: %.2x\r\n", TWSR & 0xf8); \
      i2cReset(); \
      continue; \
    }
  printf("Ready!\r\n");
  while(1) {
    char cmd[6];
    uint16_t addr;
    uint8_t value;
    scanf("%5s", &cmd);
    if(strcmp(cmd, "read")==0)
    {
      uint16_t length;
      scanf("%x %d", &addr, &length);
      uint8_t data[length];
      i2cStart();
      i2cCheck(0x08, "I2C start")
      i2cSend(eeprom_addr | ((addr & 0x100) >> 7));
      i2cCheck(0x18, "I2C EEPROM write request")
      i2cSend(addr & 0xff);
      i2cCheck(0x28, "I2C EEPROM set address")
      i2cStart();
      i2cCheck(0x10, "I2C second start")
      i2cSend(eeprom_addr | 0x1 | ((addr & 0x100) >> 7));
      i2cCheck(0x40, "I2C EEPROM read request")
      for (uint16_t i = 0; i < length; i++)
      {
        data[i] = (i == length - 1) ? i2cReadNoAck() : i2cReadAck();
      }
      i2cStop();
      i2cCheck(0xf8, "I2C stop")
      for (uint16_t i = 0; i < length; i += 16)
      { // dzielenie na chunki po 16 bajtów
        uint8_t chunk_length = (length - i > 16) ? 16 : (length - i);
        uint8_t checksum = calculate_checksum(&data[i], chunk_length, addr + i, 0x00);
        printf(":%.2X%.4X00", chunk_length, addr + i);
        for (uint8_t j = 0; j < chunk_length; j++)
        {
          printf("%.2X", data[i + j]);
        }
        printf("%.2X\r\n", checksum);
      }
      printf(":00000001FF\r\n");
    }
    else if(strcmp(cmd, "write")==0)
    {
      char line[50];
      while(true)
      {
        scanf("%s", line);
        if (line[0] != ':')
        {
          printf("Data error! Line ignored\r\n");
          continue;
        }

        uint8_t length, type, checksum;
        uint16_t addr;
        sscanf(line + 1, "%2hhx%4hx%2hhx", &length, &addr, &type);

        if (type == 0x01) // EOF
          break;

        uint8_t data[length];
        for (uint8_t i = 0; i < length; i++)
        {
          sscanf(line + 9 + i * 2, "%2hhx", &data[i]);
        }
        sscanf(line + 9 + length * 2, "%2hhx", &checksum);

        uint8_t calc_checksum = calculate_checksum(data, length, addr, type);
        if (calc_checksum != checksum)
        {
          printf("Checksum error: expected %.2X, got %.2X. Line ignored.\r\n", calc_checksum, checksum);
          continue;
        }

        i2cStart();
        i2cCheck(0x08, "I2C start");
        i2cSend(eeprom_addr | ((addr & 0x100) >> 7));
        i2cCheck(0x18, "I2C EEPROM write request");
        i2cSend(addr & 0xff);
        i2cCheck(0x28, "I2C EEPROM set address");

        for (uint8_t i = 0; i < length; i++)
        {
          i2cSend(data[i]);
          i2cCheck(0x28, "I2C EEPROM write data");
        }

        i2cStop();
        i2cCheck(0xf8, "I2C stop");
      }
      printf("Write complete.\r\n");
    }
    else
    {
      printf("Unknown command\r\n");
    }
  }
}

