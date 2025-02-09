/******************************************************************************
 * Header file inclusions.
 ******************************************************************************/

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"

#include <avr/io.h>


#include <stdio.h>
#include "uart.c"
#include "adc.c"

/******************************************************************************
 * Private macro definitions.
 ******************************************************************************/

#define mainADC_TASK_PRIORITY 3

QueueHandle_t xQueue1;

/******************************************************************************
 * Private function prototypes.
 ******************************************************************************/

static void vADC(void* pvParameters);

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
    xTaskHandle adc_handle;
    uart_init();
    adc_init();
    stdin = stdout = stderr = &uart_file;
    
    xTaskCreate
        (
         vADC,
         "ADC0",
         configMINIMAL_STACK_SIZE,
         (void *)0,
         mainADC_TASK_PRIORITY,
         &adc_handle
        );

    xTaskCreate
        (
         vADC,
         "ADC1",
         configMINIMAL_STACK_SIZE,
         (void *)1,
         mainADC_TASK_PRIORITY,
         &adc_handle
        );

    xTaskCreate
        (
         vADC,
         "ADC2",
         configMINIMAL_STACK_SIZE,
         (void *)2,
         mainADC_TASK_PRIORITY,
         &adc_handle
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

void vADC(void *pvParameters)
{
    uint8_t channel = (uint8_t)(uintptr_t)pvParameters;
    for( ;; )
    {
        uint16_t value = readADC(channel);
        printf("ADC read [%d]: %d\r\n", channel, value);
        vTaskDelay(1000*(channel+1) / portTICK_PERIOD_MS);
    }
}