
# Remarks:
# $@   <----- denotes input 
# $<   <----- denotes output 


CROSS := msp40-elf
TARGET := msp430f5529
CC  := $(CROSS)-gcc
SRC := button.c
OBJCOPY := $(CROSS)-objcopy
LDPATH := /opt/msp40-toolchain/msp430-elf/lib/

PROG := $(firstword $(SRC:.c=))

#LDFLAGS :=-T$(LDPATH)$(TARGET).ld 
LDFLAGS :=-T$(TARGET).ld 
CFLAGS :=-mmcu=$(TARGET) 


all: $(PROG).elf $(PROG).hex $(PROG).txt 

$(PROG).elf: $(SRC)
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(PROG).elf $(SRC) 

%.hex: %.elf
		$(OBJCOPY) -0 ihex  $@ $< 


#Generate the TI txt file, used for the MSPFlasher
#%.txt: %.hex
#		ihex2txt $< $@
# TODO: ignore for now


.PHONEY: clean


clean:
		rm *.elf *.hex
		echo -e pass

