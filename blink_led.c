#include  <msp430.h>



void delay( unsigned short count)
{
    return;
}

int main(void)
{
    // disable watchdog
    WDTCTL = WDTPW | WDTHOLD;
    //volatile unsigned int i;
  
    P1DIR |= 0x0001;
    P4DIR |= 0x0080;
    P1OUT = 0; 
    P4OUT = 0; 
    
    for (;;) {
        // toggle bit 0 of P1
        P1OUT ^= 0x0001;
        P4OUT ^= 0x0080;
        // delay for a while
       // for (i = 0; i < 0xFFFF; i+2);
        __delay_cycles(250000);

    }
    return 0;
}




