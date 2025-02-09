#include "FreeRTOS.h"
#include "task.h"
#include <avr/io.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

QueueHandle_t send_xQueue;
QueueHandle_t receive_xQueue;

// inicjalizacja UART
void uart_init()
{
  send_xQueue = xQueueCreate(64, sizeof( uint8_t ));
  receive_xQueue = xQueueCreate(64, sizeof( uint8_t ));
  // ustaw baudrate
  UBRR0 = UBRR_VALUE;
  // wyczyść rejestr UCSR0A
  UCSR0A = 0;
  // włącz odbiornik i nadajnik + przerwania
  UCSR0B = _BV(RXEN0) | _BV(TXEN0) | (1 << RXCIE0);
  // ustaw format 8n1
  UCSR0C = _BV(UCSZ00) | _BV(UCSZ01);
}

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream)
{
    xQueueSend(send_xQueue, &data, portMAX_DELAY);
    UCSR0B |= (1 << UDRIE0); // włączenie przerwania 
    return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream)
{
    char data;
    xQueueReceive(receive_xQueue, &data, portMAX_DELAY);
    return data;
}

ISR(USART_RX_vect) {
    char data = UDR0;
    BaseType_t xHigherPriorityTaskWoken = pdFALSE;
    xQueueSendFromISR(receive_xQueue, &data, &xHigherPriorityTaskWoken);
}

ISR(USART_UDRE_vect) {
    char data;
    BaseType_t xTaskWokenByReceive = pdFALSE;
    if(xQueueReceiveFromISR(send_xQueue, &data, &xTaskWokenByReceive))
        UDR0=data;
    else UCSR0B &= ~(1 << UDRIE0);
    if(xTaskWokenByReceive != pdFALSE)
    {
        taskYIELD();
    }
}

FILE uart_file = FDEV_SETUP_STREAM(uart_transmit, uart_receive, _FDEV_SETUP_RW);

