# MSP430

Personal developement project for MCUs using the TI MSP 430--EXP430f5529.



## Acknowledgments

* Embedded tutorial: https://embedded.fm/blog/ese101 
* FreeRTOS: https://www.freertos.org/tutorial/solution1.html
* Linux MSP tutorial: https://www.instructables.com/id/Getting-started-with-TIs-MSP430-gcc-and-the-MSP430/
* Launchpad Wiki: https://rtime.felk.cvut.cz/hw/index.php/MSP430F5529_Launchpad

## Support Files
http://www.ti.com/tool/MSP430-GCC-OPENSOURCE

## Tools
TI development tools
* http://www.ti.com/tool/download/MSP-CGT-17#sw-whats-new-box
	-Might need updating
http://www.ti.com/tool/MSP430-FLASHER


## Toolcain
msp430-elf-gcc
mspdebug
mspflasher (MSPFlasher) 

## Creating executable

```
msp430-elf-gcc -mmc=msp430f5529 -T<path-to-linker-scripts>/msp430f5529.ld -o <target-file>.elf <target-file>.c
```


## Loading
Run mspdebug
```
sudo mspdebug tilib -d /dev/ttyACM0 --allow-fw-update
```

Once inside mspdebug, issue the prog command:
```
prog <elf-file>.elf
```


## Flashing
Flash the firmware via the following:
```
<path>MSP430Flasher -i ttyACM0 -n MSP430F5529 -w <firmware>.hex -v -g
```


The Intel hex file can be generated with the following:
```
msp430-elf-objcopy -O ihex <firmware>.hex <firmware>.elf
```

A remark:
The flasher tool looks for the environment variable `LD_LIBRARY_PATH`. Set this to the same directory where the flasher tool is located.

## Issues

- When using the makefile, there's an issue finding the linker script. Running the command above works.


