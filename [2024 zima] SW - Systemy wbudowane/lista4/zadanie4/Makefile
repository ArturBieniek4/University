PRG            = zadanie4
OBJ            = ${PRG}.o
PROGRAMMER     = arduino
PORT           = /dev/ttyUSB0
MCU_TARGET     = atmega328p 
AVRDUDE_TARGET = atmega328p
OPTIMIZE       = -O3 -Wl,-u,vfprintf -lprintf_flt -lm
DEFS           =
LIBS           =
BAUDRATE       = 115200

HZ          = 16000000

# You should not have to change anything below here.

CC             = avr-gcc

# Override is only needed by avr-lib build system.

override CFLAGS        = -g -std=c99 -DF_CPU=$(HZ) -Wall $(OPTIMIZE) -mmcu=$(MCU_TARGET) $(DEFS)
override LDFLAGS       = -Wl,-Map,$(PRG).map

OBJCOPY        = avr-objcopy
OBJDUMP        = avr-objdump
SIZE           = avr-size

all: $(PRG).elf lst text

$(PRG).elf: $(OBJ)
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^ $(LIBS)

clean:
	rm -rf *.o $(PRG).elf *.eps *.png *.pdf *.bak *.hex *.bin *.srec
	rm -rf *.lst *.map $(EXTRA_CLEAN_FILES)

lst:  $(PRG).lst

%.lst: %.elf
	$(OBJDUMP) -h -S $< > $@

# Rules for building the .text rom images

text: hex bin srec

hex:  $(PRG).hex
bin:  $(PRG).bin
srec: $(PRG).srec

%.hex: %.elf
	$(OBJCOPY) -j .text -j .data -O ihex $< $@
	$(SIZE) --mcu=${MCU_TARGET} --format=avr $<

%.srec: %.elf
	$(OBJCOPY) -j .text -j .data -O srec $< $@

%.bin: %.elf
	$(OBJCOPY) -j .text -j .data -O binary $< $@

install:  $(PRG).hex
	avrdude -p $(AVRDUDE_TARGET) -c $(PROGRAMMER) -P $(PORT) \
        -b $(BAUDRATE) -v -U flash:w:$(PRG).hex 

screen:
	screen $(PORT) 9600

miniterm:
	miniterm $(PORT) 9600


