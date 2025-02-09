#include "i2c.h"
void i2cInit() {
  // ustaw bitrate
  // 8MHz / (16+2*TWBR*1) ~= 100kHz
  TWBR = 32;
  // uruchom TWI
  TWCR |= _BV(TWEN);
}
void i2cWaitForComplete() {
  // czekaj na flagę TWINT
  while(!(TWCR & _BV(TWINT)));
}
void i2cStart() {
  // wyślij warunek startu
  TWCR = _BV(TWINT) | _BV(TWEN) | _BV(TWSTA);
  i2cWaitForComplete();
}
void i2cStop() {
  // wyślij warunek stopu
  TWCR = _BV(TWINT) | _BV(TWEN) | _BV(TWSTO);
}
void i2cReset() {
  // wyślij warunek stopu i wyłącz TWI
  TWCR = _BV(TWINT) | _BV(TWSTO);
}
uint8_t i2cReadAck() {
  // odczytaj dane, wyślij ACK
  TWCR = _BV(TWINT) | _BV(TWEN) | _BV(TWEA);
  i2cWaitForComplete();
  return TWDR;
}
uint8_t i2cReadNoAck() {
  // odczytaj dane, wyślij NOACK
  TWCR = _BV(TWINT) | _BV(TWEN);
  i2cWaitForComplete();
  return TWDR;
}
void i2cSend(uint8_t data) {
  // wyślij dane
  TWDR = data;
  TWCR = _BV(TWINT) | _BV(TWEN);
  i2cWaitForComplete();
}
