/******************************************************************************
 * Header file inclusions.
 ******************************************************************************/

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include <avr/io.h>


#include <stdio.h>
#include "uart.c"

/******************************************************************************
 * Private macro definitions.
 ******************************************************************************/

#define mainLED_TASK_PRIORITY   1

#define mainSERIAL_TASK_PRIORITY 2

QueueHandle_t xQueue1;

/******************************************************************************
 * Private function prototypes.
 ******************************************************************************/

static void vBlinkLed(void* pvParameters);

static void vSerial(void* pvParameters);

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
    xQueue1 = xQueueCreate(10, sizeof( uint16_t ));
    // Create task.
    xTaskHandle blink_handle;
    xTaskHandle serial_handle;
    uart_init();
    stdin = stdout = stderr = &uart_file;
    xTaskCreate
        (
         vBlinkLed,
         "blink",
         configMINIMAL_STACK_SIZE,
         NULL,
         mainLED_TASK_PRIORITY,
         &blink_handle
        );

    xTaskCreate
        (
         vSerial,
         "serial",
         configMINIMAL_STACK_SIZE,
         NULL,
         mainSERIAL_TASK_PRIORITY,
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
static void vBlinkLed(void* pvParameters)
{
    DDRB |= _BV(PB5);
    uint16_t time=100;
    for ( ;; )
    {
        // xQueueReceive(xQueue1, &time, portMAX_DELAY);
        PORTB |= _BV(PB5);
        vTaskDelay(time / portTICK_PERIOD_MS);
        PORTB &= ~_BV(PB5);
        vTaskDelay(100 / portTICK_PERIOD_MS);
    }
}


/**************************************************************************//**
 * \fn static void vSerial(void* pvParameters)
 *
 * \brief
 *
 * \param[in]   pvParameters
 ******************************************************************************/
static void vSerial(void* pvParameters)
{
    uint16_t input;
    printf("Hello World\r\n");
    for ( ;; )
    {
        if(scanf("%d", &input)>0)
        {
            printf("Received: %d\r\n", input);
            // xQueueSend(xQueue1, &input, portMAX_DELAY);
        }
    }
}
