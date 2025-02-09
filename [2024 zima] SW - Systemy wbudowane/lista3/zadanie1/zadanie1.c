#include <avr/io.h>
#include <util/delay.h>
#include <stdio.h>
#include <inttypes.h>
#include <avr/pgmspace.h>

#define LED PB5 // D13
#define LED_DDR DDRB
#define LED_PORT PORTB

#define BUZ PB4 // D12
#define BUZ_DDR DDRB
#define BUZ_PORT PORTB

enum notes {
    A,
    B,
    C,
    D,
    E,
    F,
    G,
    C_NEXT,
    PAUSE
};

const uint8_t notefreqs[] = {
    220.0,
    246.94165062806206,
    130.8127826502993,
    146.8323839587038,
    164.81377845643496,
    174.61411571650194,
    195.99771799087463,
    261.6255653005986,
    0
};

const uint8_t melody[][2] PROGMEM = {
    {C, 12}, {G, 12},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {F, 4}, {D, 12}, {G, 6},

    {C, 12}, {G, 12},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {F, 4}, {D, 12}, {G, 6},

    {A, 12}, {F, 3}, {E, 3}, {D, 3}, {C, 3},
    {C, 4}, {D, 4}, {E, 4}, {D, 3}, {A, 3}, {B, 6}, {G, 6},
    {A, 12}, {F, 3}, {E, 3}, {D, 3}, {C, 3},
    {G, 6}, {D, 12}, {G, 6},

    {A, 12}, {F, 3}, {E, 3}, {D, 3}, {C, 3},
    {C, 4}, {D, 4}, {E, 4}, {D, 3}, {A, 3}, {B, 6}, {G, 6},
    {C, 6}, {G, 6}, {F, 6}, {D, 3}, {C, 3},
    {G, 24},

    {C, 12}, {G, 12},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {F, 4}, {D, 12}, {G, 6},

    {C, 12}, {G, 12},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {F, 4}, {E, 4}, {D, 4}, {C, 12}, {G, 6},
    {C, 8}, {B, 4}, {C, 6}, {C, 6}, {PAUSE, 1}, {C, 6},

    {PAUSE, 20}
};

void play_quartertone(uint16_t tone)
{
    if(tone==0)
    {
        _delay_ms(250/4);
        return;
    }
    uint16_t delay = 250*8/tone;
    uint16_t reps = tone/6;
    while(reps>0)
    {
        BUZ_PORT |= _BV(BUZ);
        for(uint16_t i=0;i<delay;i++)
            _delay_us(100);
        BUZ_PORT &= ~_BV(BUZ);
        for(uint16_t i=0;i<delay;i++)
            _delay_us(100);
        reps--;
    }
}

int main() {
    LED_DDR |= _BV(LED);
    BUZ_DDR |= _BV(BUZ);
    while(1)
    {
        for(uint8_t i=0; i<sizeof(melody)/sizeof(melody[0]); i++)
        {
            uint8_t reps=pgm_read_byte(&(melody[i][1]));
            for(uint8_t j=0; j<reps; j++)
            {
                uint8_t tone=pgm_read_byte(&(melody[i][0]));
                play_quartertone(notefreqs[tone]);
            }
        }
    }
}
