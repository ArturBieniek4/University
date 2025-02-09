#ifndef __I2C_H
#define __I2C_H

#include <avr/io.h>

void i2cInit();             /* Ustawia pull-upy i konfiguruje bitrate magistrali */
void i2cWaitForComplete();  /* Czeka na ustawienie flagi TWINT */
void i2cStart();            /* Wysyła warunek startu (ustawia TWSTA) */
void i2cStop();             /* Wysyła warunek stopu (ustawia TWSTO) */
void i2cReset();            /* Wysyła warunek stopu (ustawia TWSTO) i resetuje TWI */
void i2cSend(uint8_t data); /* Wysyła dane, czeka na ukończenie */
uint8_t i2cReadAck();       /* Czyta dane, wysyła ACK po ukończeniu (ustawia TWEA) */
uint8_t i2cReadNoAck();     /* Czyta dane, wysyła NOACK po ukończeniu (nie ustawia TWEA) */

#endif