
TARGET := msp430f5529
CC  := msp430-elf-gcc
SRC := interrupt.c

LDPATH := /opt/msp40-toolchain/msp430-elf/lib/

PROG := $(firstword $(SRC:.c=))

LDFLAGS :=-T$(LDPATH)$(TARGET).ld 
CFLAGS :=-mmcu=$(TARGET) 


all: $(PROG).elf 

$(PROG).elf: $(SRC)
		$(CC) $(CFLAGS) $(LDFLAGS) -o $(PROG).elf $(SRC) 


.PHONEY: clean

clean: 
		rm *.o 
