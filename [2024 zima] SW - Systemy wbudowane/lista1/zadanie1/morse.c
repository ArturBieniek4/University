#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>

#define LED PB5
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BAUD 9600                          // baudrate
#define UBRR_VALUE ((F_CPU)/16/(BAUD)-1)   // zgodnie ze wzorem

#define DOT_LENGTH 100

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

char * morseEncode(char x)
{
    switch (x) {
      case 'a':
          return ".-";
      case 'b':
          return "-...";
      case 'c':
          return "-.-.";
      case 'd':
          return "-..";
      case 'e':
          return ".";
      case 'f':
          return "..-.";
      case 'g':
          return "--.";
      case 'h':
          return "....";
      case 'i':
          return "..";
      case 'j':
          return ".---";
      case 'k':
          return "-.-";
      case 'l':
          return ".-..";
      case 'm':
          return "--";
      case 'n':
          return "-.";
      case 'o':
          return "---";
      case 'p':
          return ".--.";
      case 'q':
          return "--.-";
      case 'r':
          return ".-.";
      case 's':
          return "...";
      case 't':
          return "-";
      case 'u':
          return "..-";
      case 'v':
          return "...-";
      case 'w':
          return ".--";
      case 'x':
          return "-..-";
      case 'y':
          return "-.--";
      case 'z':
          return "--..";
      case '1':
          return ".----";
      case '2':
          return "..---";
      case '3':
          return "...--";
      case '4':
          return "....-";
      case '5':
          return ".....";
      case '6':
          return "-....";
      case '7':
          return "--...";
      case '8':
          return "---..";
      case '9':
          return "----.";
      case '0':
          return "-----";
      default:
          printf("Invalid character!\n");
    }
}

int main() {
  // zainicjalizuj UART
  uart_init();
  // skonfiguruj strumienie wejścia/wyjścia
  fdev_setup_stream(&uart_file, uart_transmit, uart_receive, _FDEV_SETUP_RW);
  stdin = stdout = stderr = &uart_file;

  LED_DDR |= _BV(LED);

  printf("MORSE code translator\r\n");
  while(1) {
    char s[200];
    scanf("%s", &s);
    printf("Odczytano: %s\r\n", s);
    for(int i=0;i<200 && s[i]!='\0'; i++)
    {
      char * morse = morseEncode(s[i]);
      printf("%s\r\n", morse);
      while(*morse!='\0')
      {
        if(*morse==".")
        {
          LED_PORT |= _BV(LED);
          _delay_ms(DOT_LENGTH);
          LED_PORT &= ~_BV(LED);
        }
        else
        {
          LED_PORT |= _BV(LED);
          _delay_ms(DOT_LENGTH*3);
          LED_PORT &= ~_BV(LED);
        }
        morse++;
        _delay_ms(DOT_LENGTH);
      }
    }
    _delay_ms(DOT_LENGTH*3);
  }
    _delay_ms(DOT_LENGTH*7);
  
  
}
