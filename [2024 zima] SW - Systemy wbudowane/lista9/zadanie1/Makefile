
PRG                = zadanie1
OBJ                = ${PRG}.o 
PROGRAMMER         = stk500v1
PROGRAMMER_ISP     = arduino
PORT               = /dev/ttyUSB0
MCU_TARGET         = attiny84
AVRDUDE_TARGET     = attiny84
AVRDUDE_TARGET_ISP = atmega328p
OPTIMIZE           = -O3
DEFS               =
LIBS               = #-Wl,-u,vfprintf -lprintf_flt -lm
BAUDRATE           = 19200
BAUDRATE_ISP       = 115200
#BAUDRATE           = 115200

HZ          = 1000000

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
	rm -rf *.o $(PRG).elf *.eps *.png *.pdf *.bak $(PRG).hex $(PRG).bin $(PRG).srec
	rm -rf $(PRG).lst *.map $(EXTRA_CLEAN_FILES)

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

arduinoisp: arduinoisp.hex
	avrdude -p $(AVRDUDE_TARGET_ISP) -c $(PROGRAMMER_ISP) -P $(PORT) \
        -b $(BAUDRATE_ISP) -v -U flash:w:arduinoisp.hex 

install:  $(PRG).hex
	avrdude -p $(AVRDUDE_TARGET) -c $(PROGRAMMER) -P $(PORT) \
        -b $(BAUDRATE) -v -U flash:w:$(PRG).hex 

screen:
	screen $(PORT)

