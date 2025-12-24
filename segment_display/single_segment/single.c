#include <pic.h>

void delay()
{
     int i;
    for(i=0; i<30000; i++);
}
char seg_hex[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void main()
{
    TRISB = 0x00;
    
    while(1)
    {
        for(int i=10; i>0; i--)
        {
            PORTB = seg_hex[i];
            delay();
        }
     
        for(int i=0; i<10; i++)
        {
            PORTB = seg_hex[i];
            delay();
    }
}
}
