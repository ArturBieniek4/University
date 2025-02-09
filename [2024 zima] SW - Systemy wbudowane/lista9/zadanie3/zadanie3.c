#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <util/delay.h>
#include "USI_TWI_Master.c"

#define MESSAGEBUF_SIZE       2

int main() {
    USI_TWI_Master_Initialise();
    unsigned char messageBuf[MESSAGEBUF_SIZE];
    unsigned char TWI_targetSlaveAddress = 0x7f;
    unsigned char temp;
    uint8_t i=42;
    while(1)
    {
        messageBuf[0] = TWI_targetSlaveAddress << 1;
        messageBuf[1] = i++;
        temp = USI_TWI_Start_Transceiver_With_Data( messageBuf, 2 );
        _delay_ms(100);
    }
}
