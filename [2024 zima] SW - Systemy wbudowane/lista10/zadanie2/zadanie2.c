#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>
#include "hd44780.h"

void program_CGRAM() {
    unsigned char bars[5] = {0b10000, 0b11000, 0b11100, 0b11110, 0b11111};
    for (unsigned char i = 0; i < 5; i++) {
        LCD_WriteCommand(HD44780_CGRAM_SET + (i * 8));
        for (unsigned char j = 0; j < 8; j++) {
            LCD_WriteData(bars[i]);
        }
    }
}

int main()
{
  // skonfiguruj wyświetlacz
  LCD_Initialize();
  program_CGRAM();

  while(1)
  {
    LCD_Clear();
    for(uint8_t i=0; i<16; i++)
    {
      for(uint8_t j=0; j<5; j++)
      {
        LCD_GoTo(i,0);
        LCD_WriteData(j);
        LCD_GoTo(i,1);
        LCD_WriteData(j);
        _delay_ms(100);
      }
    }
  }
}

