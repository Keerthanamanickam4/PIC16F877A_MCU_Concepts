#include <pic.h>

#define _XTAL_FREQ 2000000   // required for __delay_ms()

#define d1 RD0
#define d2 RD1

unsigned char seg_hex[] = {0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F};

void display(int tens, int ones)
{
    // show tens digit
    d1 = 1;
    d2 = 0;
    PORTB = seg_hex[tens];
    __delay_ms(5);

    // show ones digit
    d1 = 0;
    d2 = 1;
    PORTB = seg_hex[ones];
    __delay_ms(5);
}

void main()
{
    TRISB = 0x00;   // Segments output
    TRISD = 0x00;   // digit control pins output
    PORTB = 0x00;
    PORTD = 0x00;

    while(1)
    {
        for(int num = 0; num < 100; num++)
        {
            int tens = num / 10;
            int ones = num % 10;

            // Display repeatedly for stability
            for(int counts = 0; counts < 50; counts++)
            {
                display(tens, ones);
            }
        }
    }
}

