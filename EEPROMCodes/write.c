
#include<pic.h>

void write_to_eeprom(unsigned char address, unsigned char data) ;

unsigned char EEPROM_Read(unsigned char address);
unsigned char eeprom_done = 0;



#define _XTAL_FREQ 4000000
#define led RB0
#define led1 RB1

int main()

{
	PORTB=0X00;
	TRISB=0X00;

    unsigned char value;


    value = EEPROM_Read(0x00); 

     if(value>5)
     {
        RB0=1;
       __delay_ms(1000);
        RB0=0;
       __delay_ms(1000);
      }

    write_to_eeprom(0x00,11);

    while(!eeprom_done)
    {
        // CPU can do other tasks here
          RB1 = 1;  // Example: blink LED while waiting
        __delay_ms(200);

          RB1 = 0;  // Example: blink LED while waiting
        __delay_ms(200);
    }
}
	
void write_to_eeprom(unsigned char address, unsigned char data) 
	{
		
    EEADR = address;        // Set the EEPROM address
    EEDATA = data;          // Load data into EEPROM data register
    EEPGD = 0;   // Select EEPROM memory
    WREN = 1;    // Enable write operation
    GIE  = 1; 
    PEIE = 1; 
    EEIE = 1;     // Disable interrupts (to ensure the write completes)
    EECON2 = 0x55;          // Required sequence to write
    EECON2 = 0xAA;          
    WR = 1;      // Start write process
       // Re-enable interrupts
}

unsigned char EEPROM_Read(unsigned char address)
{
    EEADR = address;   
    EEPGD = 0;      
     

    RD = 1;           
    return EEDATA;     
}


void interrupt ISR(void)
{
    if(EEIF)
    {
        EEIF = 0;       // Clear flag
        WREN = 0;       // Disable write
        eeprom_done = 1;
    }
}

