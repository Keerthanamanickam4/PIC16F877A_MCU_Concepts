#include<pic.h>


#define led RB0
void delay();
void main()
{
	TRISB=0X00;
	RB0=1;
	delay();
	RB0=0;
	delay();
	}
	void delay()
	{
		int i;
		for(i=0;i<10000;i++);
	}