/******************************************************************************
 * Header file inclusions.
 ******************************************************************************/

#include "FreeRTOS.h"
#include "task.h"

#include <avr/io.h>


#include <stdio.h>

/******************************************************************************
 * Private macro definitions.
 ******************************************************************************/

#define mainCyclicLED_TASK_PRIORITY   1

#define mainScrollingLED_TASK_PRIORITY 1

/******************************************************************************
 * Private function prototypes.
 ******************************************************************************/

static void vCyclicLed(void* pvParameters);

static void vScrollingLed(void* pvParameters);

/******************************************************************************
 * Public function definitions.
 ******************************************************************************/

/**************************************************************************//**
 * \fn int main(void)
 *
 * \brief Main function.
 *
 * \return
 ******************************************************************************/
int main(void)
{
    // Create task.
    xTaskHandle blink_handle;
    xTaskHandle serial_handle;

    xTaskCreate
        (
         vCyclicLed,
         "cyclic",
         configMINIMAL_STACK_SIZE,
         NULL,
         mainCyclicLED_TASK_PRIORITY,
         &blink_handle
        );

    xTaskCreate
        (
         vScrollingLed,
         "scrolling",
         configMINIMAL_STACK_SIZE,
         NULL,
         mainScrollingLED_TASK_PRIORITY,
         &serial_handle
        );

    // Start scheduler.
    vTaskStartScheduler();

    return 0;
}

/**************************************************************************//**
 * \fn static vApplicationIdleHook(void)
 *
 * \brief
 ******************************************************************************/
void vApplicationIdleHook(void)
{

}

/******************************************************************************
 * Private function definitions.
 ******************************************************************************/

/**************************************************************************//**
 * \fn static void vBlinkLed(void* pvParameters)
 *
 * \brief
 *
 * \param[in]   pvParameters
 ******************************************************************************/
static void vCyclicLed(void* pvParameters)
{
    #define LED PB5 // D13
    #define LED_DDR DDRB
    #define LED_PORT PORTB

    #define BTN PB4 // D12
    #define BTN_PIN PINB
    #define BTN_PORT PORTB

    #define BUF_SIZE 25
    uint8_t buffer[BUF_SIZE];
    uint8_t bufcnt=0;
    uint8_t bytecnt=1;

    #define DELAY 1000/8/BUF_SIZE
    LED_DDR |= _BV(LED);
    BTN_PORT |= _BV(BTN);
    while(1)
    {
        if(BTN_PIN & _BV(BTN))
        {
            buffer[bufcnt] |= bytecnt;
        }
        else 
        {
            buffer[bufcnt] &= ~bytecnt;
        }
        bytecnt<<=1;
        if(bytecnt==0)
        {
            bytecnt=1;
            bufcnt++;
            if(bufcnt==BUF_SIZE)
            {
                bufcnt=0;
            }
        }
        if(buffer[bufcnt] & bytecnt)
        {
            LED_PORT &= ~_BV(LED);
        }
        else
        {
            LED_PORT |= _BV(LED);
        }
        vTaskDelay(DELAY / portTICK_PERIOD_MS);
    }
}

/**************************************************************************//**
 * \fn static void vSerial(void* pvParameters)
 *
 * \brief
 *
 * \param[in]   pvParameters
 ******************************************************************************/
static void vScrollingLed(void* pvParameters)
{
    #define LED PD7
    #define LED_DDR DDRD
    #define LED_PORT PORTD
    uint16_t kitt=0b111000000000;
    LED_DDR = 0b11111111;
    LED_PORT = kitt>>2;
    UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
    while(1) {
        UCSR0B &= ~_BV(RXEN0) & ~_BV(TXEN0);
        for(int i=0;i<9;i++)
        {
            kitt=kitt>>1;
            LED_PORT=kitt>>2;
            vTaskDelay(50 / portTICK_PERIOD_MS);
        }
        for(int i=0;i<9;i++)
        {
            kitt=kitt<<1;
            LED_PORT=kitt>>2;
            vTaskDelay(50 / portTICK_PERIOD_MS);
        }
    }
}
