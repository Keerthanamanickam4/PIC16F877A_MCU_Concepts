#include <pic.h>

#define cs1 RB0
#define cs2 RB1
#define cs3 RB2

#define sw1 RC0
#define sw2 RC1
#define sw3 RC2

void main()
{
   
    TRISB = 0x00;     
    TRISC = 0x07;    

    TRISC3 = 0;     
    TRISC4 = 1;      
    TRISC5 = 0;       
    
    cs1 = 1;
    cs2 = 1;
    cs3 = 1;

    
    SSPSTAT = 0x40;   
    SSPCON  = 0x21;  

    SSPIF = 0;

    while(1)
    {
        if(sw1)
        {
            cs1 = 0; cs2 = 1; cs3 = 1;
            SSPIF = 0;
            SSPBUF = 'A';
            while(!SSPIF);
            SSPIF=0;
            cs1 = 1;
        }

        if(sw2)
        {
            cs2 = 0; cs1 = 1; cs3 = 1;
            SSPIF = 0;
            SSPBUF = 'B';
            while(!SSPIF);
            SSPIF=0;
            cs2 = 1;
        }

        if(sw3)
        {
            cs3 = 0; cs1 = 1; cs2 = 1;
            SSPIF = 0;
            SSPBUF = 'C';
          while(!SSPIF);
            SSPIF=0;
            cs3 = 1;
        }
    }
}
