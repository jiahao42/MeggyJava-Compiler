#######################
# Makefile for linux
#
# This makefile will generate a .hex file from a 
# file.cpp or file.s
# and upload it to the MeggyJr when the commands 
#   make file.hex
# and
#   make file.install
# are run on the linux boxes in the CS department.
#
# 12/15/10, Michelle Strout
# 1/13/15, checked and updated
#######################


## paths to the necessary tools, on linux the tools are in default path
AVRGCC =        avr-gcc
AVRGXX =        avr-g++
AVRDUDE =       avrdude
AVROBJCOPY =    avr-objcopy

## AVRDUDE_OPTIONS
PORT = /dev/ttyUSB0
AVRDUDE_OPTIONS = -P$(PORT) -patmega328p -cstk500v1

## avr chip
MCU =           atmega328p

## Options common to compile, link and assembly rules
COMMON =        -mmcu=$(MCU)

## Compile options common for all C compilation units.
CFLAGS =        $(COMMON)
CFLAGS +=       -Wall -Os -fsigned-char
CFLAGS +=       -MD -MP -MT $(*F).o -MF dep/$(@F).d 
CFLAGS +=       -DF_CPU=16000000UL -D__DELAY_BACKWARD_COMPATIBLE__

## Assembly specific flags
ASMFLAGS =      $(COMMON)
ASMFLAGS +=     -x assembler-with-cpp -Wa,-gdwarf2

## Linker flags
LDFLAGS =       $(COMMON)
LDFLAGS += 

## Intel Hex file production flags
HEX_FLASH_FLAGS = -R .eeprom
HEX_EEPROM_FLAGS = -j .eeprom
HEX_EEPROM_FLAGS += --set-section-flags=.eeprom="alloc,load"
HEX_EEPROM_FLAGS += --change-section-lma .eeprom=0

## Compile and Build

%.s: %.cpp
	$(AVRGXX) $(INCLUDES) $(CFLAGS) -I. -S  $<

%.hex: %.s MeggyJr.o MeggyJrSimple.o
	$(AVRGXX) $(INCLUDES) $(CFLAGS) -I. -c  $*.s
	$(AVRGXX) $(LDFLAGS) $*.o MeggyJr.o MeggyJrSimple.o $(LINKONLYOBJECTS) $(LIBDIRS) $(LIBS) -o $*.elf
	$(AVROBJCOPY) -O ihex $(HEX_FLASH_FLAGS)  $*.elf $@

MeggyJrSimple.o: MeggyJrSimple.cpp
	$(AVRGXX) $(INCLUDES) $(CFLAGS) -I. -c  $<

MeggyJr.o: MeggyJr.cpp
	$(AVRGCC) $(INCLUDES) $(CFLAGS) -c  $<


## Install on the device
%.install: %.hex
	$(AVRDUDE) -b57600 -v $(AVRDUDE_OPTIONS) -D -Uflash:w:$<:i


## Clean target
.PHONY: clean
clean:
	-rm -rf dep/* dep .DS_Store *.o *.hex *.elf


## Other dependencies
-include $(shell mkdir dep 2>/dev/null) $(wildcard dep/*)
