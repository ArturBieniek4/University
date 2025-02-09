#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>
#include <stdbool.h>

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BTN PB4 // D12
#define BTN_PIN PINB
#define BTN_PORT PORTB

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

// transmisja jednego znaku
int uart_transmit(char data, FILE *stream)
{
  // czekaj aż transmiter gotowy
  while(!(UCSR0A & _BV(UDRE0)));
  UDR0 = data;
  return 0;
}

// odczyt jednego znaku
int uart_receive(FILE *stream)
{
  // czekaj aż znak dostępny
  while (!(UCSR0A & _BV(RXC0)));
  return UDR0;
}

FILE uart_file;

#define MORSE_MULT 100

bool isbtnchanged(int16_t ms)
{
    uint8_t state = (BTN_PIN & _BV(BTN));
    while(ms>=0)
    {
        _delay_ms(1);
        if((BTN_PIN & _BV(BTN))!=state) return true;
        ms--;
    }
    return false;
}

char morsetab[]=
{
'#',
'#',
'E',
'T',
'I',
'A',
'N',
'M',
'S',
'U',
'R',
'W',
'D',
'K',
'G',
'O',
'H',
'V',
'F',
'#',
'L',
'#',
'P',
'J',
'B',
'X',
'C',
'Y',
'Z',
'Q',
'#',
'#',
'5',
'4',
'#',
'3',
'#',
'#',
'#',
'2',
'#',
'#',
'#',
'#',
'#',
'#',
'#',
'1',
'6',
'#',
'#',
'#',
'#',
'#',
'#',
'#',
'7',
'#',
'#',
'#',
'8',
'#',
'9',
'0',
};

uint8_t morsecode=1;

int main() {
    // zainicjalizuj UART
    uart_init();
    // skonfiguruj strumienie wejścia/wyjścia
    fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
    stdin = stdout = stderr = &uart_file;

    LED_DDR |= _BV(LED);
    BTN_PORT |= _BV(BTN);
    printf("Morse translator v2!\r\n");
    while(1)
    {
        LED_PORT &= ~_BV(LED);
        if(!(BTN_PIN & _BV(BTN))) // 0 znaczy wciśnięty
        {
            if(isbtnchanged(MORSE_MULT*0.05)) continue; //drgania
            morsecode<<=1;
            if(isbtnchanged(MORSE_MULT*1.4))
            { // .
                while(!(BTN_PIN & _BV(BTN))) ; // czekamy na zwolnienie
            }
            else
            { // -
                morsecode|=1;
                LED_PORT |= _BV(LED);
                while(!(BTN_PIN & _BV(BTN))) ; // czekamy na zwolnienie
            }
            if(isbtnchanged(MORSE_MULT*1)) continue;
            if(!isbtnchanged(MORSE_MULT*2))
            {
                printf("%c", morsetab[morsecode]);
                morsecode=1;
                if(!isbtnchanged(MORSE_MULT*4)) printf(" ");
            }
        }
    }
}
