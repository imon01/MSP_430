#include<msp430.h>

int main()
{
    WDTCTL = WDTPW | WDTHOLD;
    
    // Binary constants, for readability on ports and pins
    // GCC  supported
    P1DIR = 0b00000001;  //P1.1 input, P1.0 output 
    P1IES = 0b00000010; //P1.1 hi-lo interrupt edge select 
    P1REN = 0b00000010; // Enable pull up/down resistor P1.1 
    P1OUT = 0b00000010;  //Set P1.1 as pull up resistor
    P1IFG = 0b00000000;  //Clear bit, gets set after setting P1IES 
    P1IE = 0b00000010;   //P1.1 interrupt enabled


    __bis_SR_register( GIE);  //Enable global interrupts
    while(1)
    {
        //loop forever    
    }
}



#pragma vector=PORT1_VECTOR
__interrupt void port1_isr(void)
{

    P1OUT ^= BIT0;
    P1IFG &= ~BIT1;
}
