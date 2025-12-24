#include <pic.h>

#define CS RB0
#define SW RC0



void SPI_Init(void)
{
    TRISC3 = 0;   // SCK
    TRISC4 = 1;   // SDI
    TRISC5 = 0;   // SDO
    TRISC0 = 1;   // Switch

    TRISB0 = 0;   // CS

    CS = 1;

    SSPSTAT = 0x40;  // Mode 0
    SSPCON  = 0x21;  // Master, Fosc/16

    SSPIF = 0;
}

unsigned char SPI_Transfer(unsigned char data)
{
    SSPIF = 0;
    SSPBUF = data;
    while(!SSPIF);
    return SSPBUF;
}

void EEPROM_Write(unsigned int addr, unsigned char data)
{
    /* Step 1: Write Enable */
    CS = 0;
    SPI_Transfer(0x06);   // WREN
    CS = 1;

    /* Step 2: Write Command */
    CS = 0;
    SPI_Transfer(0x02);           // WRITE
    SPI_Transfer(0X00);    // Address LSB
    SPI_Transfer(data);           // Data
    CS = 1;

    // Write cycle time
}

void main()
{
    SPI_Init();

    while(1)
    {
        if(SW==0)
        {
            EEPROM_Write(0x0000, 0x41); // Write 'A'
            while(SW); // wait for button release
        }
    }
}
