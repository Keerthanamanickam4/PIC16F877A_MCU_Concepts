#include <pic.h>


void delay()
{
    unsigned int i;
    for(i=0; i<50000; i++);
}

void main()
{
    TRISB = 0x00;
    PORTB = 0x00;  

    while(1)
    {
        for(int i = 8; i >=0; i--)  //for(int i=0;i<8;i++)-forward led blinking
        {
            PORTB = (1 << i); //Move the binary 1 to the bit position corresponding to i.so one led turn on at a time
            delay();
        }
    }
}
