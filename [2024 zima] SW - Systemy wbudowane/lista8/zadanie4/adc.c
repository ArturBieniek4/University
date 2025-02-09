#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include "semphr.h"

SemaphoreHandle_t adcMutex;
SemaphoreHandle_t adcResultReady;
volatile uint16_t adcResult;

void adc_init()
{
    ADMUX = _BV(REFS0); // Napięcie referencyjne AVcc
    ADCSRA = _BV(ADEN) | _BV(ADIE) | _BV(ADPS2) | _BV(ADPS1); // Włączenie ADC, przerwań, preskaler 64
    adcMutex = xSemaphoreCreateMutex();
    adcResultReady = xSemaphoreCreateBinary();
}

uint16_t readADC(uint8_t mux)
{
    xSemaphoreTake(adcMutex, portMAX_DELAY);
    ADMUX = (ADMUX & 0xF0) | (mux & 0x0F); // wybranie wejścia
    ADCSRA |= _BV(ADSC); // rozpocznij konwersję
    xSemaphoreTake(adcResultReady, portMAX_DELAY);
    xSemaphoreGive(adcMutex);
    return adcResult;
}

ISR(ADC_vect)
{
    adcResult = ADC;
    xSemaphoreGiveFromISR(adcResultReady, NULL);
}