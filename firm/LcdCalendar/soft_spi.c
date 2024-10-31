/*
 *  	soft_spi.c
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 *
 */
#include "pico/stdlib.h"
#include "soft_spi.h"


#define SCK(X) 		gpio_put(SOFT_SPI_CLK, X)
#define MOSI(X) 	gpio_put(SOFT_SPI_MOSI, X)
#define MISO()		gpio_get(SOFT_SPI_MISO)	


void SoftSpiInit()
{
	gpio_init(SOFT_SPI_CLK);
	gpio_init(SOFT_SPI_MOSI);
	gpio_init(SOFT_SPI_MISO);	
	
	gpio_set_dir(SOFT_SPI_CLK, GPIO_OUT);
	gpio_set_dir(SOFT_SPI_MOSI, GPIO_OUT);
	gpio_set_dir(SOFT_SPI_MISO, GPIO_IN);    
	
	gpio_put(SOFT_SPI_CLK, 0);
	gpio_put(SOFT_SPI_MOSI, 0);
	
}

uint8_t SoftSpiTransferByte(uint8_t wdata)
{
	uint8_t rdata=0;
	uint8_t tmpBit=0;
	uint8_t mask=0x80;
	
	SCK(0);
	do
	{
		if(wdata & mask)
		{
			MOSI(1);
		}
		else
		{
			MOSI(0);
		}
		//sleep_us(1);
		SCK(1);
		if(MISO())
		{
			rdata|=mask;
		}
		sleep_us(1);
		SCK(0);
		mask=mask>>1;
		sleep_us(1);
	}
	while(mask!=0x00);
	
	return rdata;	
}