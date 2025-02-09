#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>
#include "hd44780.h"
#include <string.h>

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

// odczyt jednego znaku
int uart_receive()
{
  // czekaj aż znak dostępny
  while (!(UCSR0A & _BV(RXC0)));
  return UDR0;
}

int hd44780_transmit(char data, FILE *stream)
{
  LCD_WriteData(data);
  return 0;
}

FILE hd44780_file;

int main()
{
  uart_init();

  // skonfiguruj wyświetlacz
  LCD_Initialize();
  LCD_Clear();
  // skonfiguruj strumienie wyjściowe
  fdev_setup_stream(&hd44780_file, hd44780_transmit, NULL, _FDEV_SETUP_WRITE);
  stdout = stderr = &hd44780_file;
  uint8_t pos_x=0;
  char row[16]={0};
  LCD_GoTo(0,1);
  while(1) {
    char c = uart_receive();
    if(c=='\r')
    {
        LCD_Clear();
        LCD_GoTo(0, 0);
        printf("%s", row);
        memset(row, 0, sizeof(row));
        pos_x=0;
        LCD_GoTo(0, 1);
        continue;
    }
    row[pos_x]=c;
    LCD_GoTo(pos_x++, 1);
    printf("%c", c);
    if(pos_x==16)
    {
        pos_x=0;
        LCD_GoTo(pos_x, 1); 
    }
  }
}

