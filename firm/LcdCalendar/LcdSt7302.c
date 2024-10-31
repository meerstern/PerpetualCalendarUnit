/*
 *  	LcdSt7302.c
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 * 
 *  For the ST7302 initialization sequence,  refer below link.
 *  https://github.com/zhcong/ST7302-for-arduino
 */

#include <stdlib.h>
#include <stdio.h>
#include <stdbool.h>
#include <math.h>
#include <string.h>

#include "pico/stdlib.h"
#include "soft_spi.h"
#include "LcdCalendar.h"
#include "LcdSt7302.h"


#define LCD_WIDTH	250
#define LCD_HIGHT	122

/* Command Table1 */
#define CMD_NOP                 0x00
#define CMD_SOFT_RESET          0x01
#define CMD_READ_ID             0x04
#define CMD_READ_STATUS         0x09
#define CMD_SLEEP_IN            0x10
#define CMD_SLEEP_OUT           0x11
#define CMD_PARTIAL_ON          0x12
#define CMD_PARTIAL_OFF         0x13
#define CMD_INVERSION_OFF       0x20
#define CMD_INVERSION_ON        0x21
#define CMD_DISP_OFF            0x28
#define CMD_DISP_ON             0x29
#define CMD_COL_ADDR_SET        0x2A
#define CMD_ROW_ADDR_SET        0x2B
#define CMD_MEM_WRITE           0x2C
#define CMD_MEM_READ            0x2E
#define CMD_TEARING_OFF         0x34
#define CMD_TEARING_ON          0x35
#define CMD_MEM_ACCESS_CTRL     0x36
#define CMD_VERTICAL_ADDR       0x37
#define CMD_HIGH_POWER_MODE     0x38
#define CMD_LOW_POWER_MODE      0x39
#define CMD_DATA_FORMAT_SEL     0x3A
#define CMD_WRITE_MEM_CNTI      0x3C
#define CMD_READ_MEM_CNTI       0x3E
#define CMD_TEAR_SCANLINE       0x44
#define CMD_READ_ID1            0xDA
#define CMD_READ_ID2            0xDB
#define CMD_READ_ID3            0xDC

/* Command Table2 */
#define CMD_GATE_TIMING         0x73
#define CMD_DUTY                0xB0
#define CMD_FIRST_GATE          0xB1
#define CMD_FRAME_RATE          0xB2
#define CMD_VCOM_EQ_EN          0xB3
#define CMD_UPDATE_GATE_EQ      0xB4
#define CMD_DESTRESS_GATE_EQ    0xB5
#define CMD_PANEL               0xB8
#define CMD_SOURCE              0xB9
#define CMD_CLEAR_RAM1          0xBA
#define CMD_CLEAR_RAM2          0xBB
#define CMD_GATE_VOLTAGE        0xC0
#define CMD_SOURCE_VOLTAGE1     0xC1
#define CMD_SOURCE_VOLTAGE2     0xC2
#define CMD_OSC_EN              0xC7
#define CMD_VCOMH_VOLTAGE       0xCB
#define CMD_ID1                 0xCC
#define CMD_ID2                 0xCD
#define CMD_ID3                 0xCE
#define CMD_BOOSTER_EN          0xD1
#define CMD_SOURCE_VOLTAGE_SEL  0xD6
#define CMD_NVM_LOAD            0xD7
#define CMD_SPI_INPUT_SEL       0xE4
#define CMD_NVM_READ            0xE9
#define CMD_NVM_LOAD_EN         0xEB
#define CMD_EXTB_CTRL           0xEC
#define CMD_NVM_WR_RD           0xF8
#define CMD_NVM_PRG             0xFA
#define CMD_NVM_READ_EN         0xFB
#define CMD_NVM_PRG_EN          0xFC

#define IsCMD                   1
#define IsPRM                   0

#define VAL_CLEAR_RAM_ON            0xE3
#define VAL_CLEAR_RAM_OFF           0x23
#define VAL_NVM_LOAD_NOT_TRIGGERD   0x02
#define VAL_NVM_LOAD_EN_VOL_EN_ID   0x68
#define VAL_BOOSTER_EN              0x01
#define VAL_GATE_VOLTAGE_P12V_N5V   0x80
#define VAL_SOURCE_VOLTAGE1_5V      0x28
#define VAL_SOURCE_VOLTAGE1_3_5V    0x14
#define VAL_SOURCE_VOLTAGE1_1_5V    0x00
#define VAL_SOURCE_VOLTAGE2_0V      0x00
#define VAL_VCOMH_VOLTAGE_4V        0x14
#define VAL_GATE_EQ_LEFT_EN         0xE5
#define VAL_GATE_EQ_2ND_PRM         0x66    //0x77
#define VAL_GATE_EQ_3RD_PRM         0xF1
#define VAL_GATE_EQ_4TH_PRM         0xFF
#define VAL_GATE_EQ_5TH_PRM         0xFF
#define VAL_GATE_EQ_6TH_PRM         0x4F
#define VAL_GATE_EQ_7TH_PRM         0xF1
#define VAL_GATE_EQ_8TH_PRM         0xFF
#define VAL_GATE_EQ_9TH_PRM         0xFF
#define VAL_GATE_EQ_10TH_PRM        0x4F
#define VAL_OSC_EN1                 0xA6
#define VAL_OSC_EN2                 0xE9
#define VAL_DUTY_250                0x64
#define VAL_MEM_ACCESS_MV           0x20
#define VAL_DATA_FORMAT_ON_3WIRE    0x11
#define VAL_SOURCE_CLEAR_OFF        0x23
#define VAL_PANEL_FRAME_TWO_LINE    0x09 
#define VAL_COL_ADDR1               0x05
#define VAL_COL_ADDR2               0x36
#define VAL_ROW_ADDR1               0x00
#define VAL_ROW_ADDR2               0xC7
#define VAL_SOURCE_CLEAR_ON         0xE3
#define VAL_COL_ADDR                0x19
#define VAL_ROW_ADDR                0x00  

uint8_t *lcdBuffer;
uint32_t lcdBufferSize;

uint16_t lcdByteWidth;
uint16_t lcdByteHight;


static void toggleLcdReset()
{
	gpio_put(PIN_RST, 0);
	sleep_ms(3);//10->3 For Clock Down	
	gpio_put(PIN_RST, 1);
	gpio_put(PIN_DC, 1);
	sleep_ms(30);//100->30 For Clock Down
}

static uint16_t calcByte(uint16_t x, uint16_t y)
{
	return (x-1)/2*3+(y/4)+(y/12)*(250+122-3);
}

static uint16_t calcBit(uint16_t x, uint16_t y)
{
	return ((x+1)%2)*(6-(y%4)*2)+((x)%2)*(7-(y%4)*2);
}

static uint8_t bitSet(uint8_t number, uint8_t n)
{
    return number | ((uint8_t)1 << n);
}

static uint8_t bitClear(uint8_t number, uint8_t n)
{
    return number & ~((uint8_t)1 << n);
}

static void writeSpiData(uint8_t data, bool isCmd )
{
	uint8_t wdata[1];
	wdata[0]=data;
	gpio_put(PIN_CS, 0);
    if(isCmd)
	    gpio_put(PIN_DC, 0);
	sleep_us(10);
	//spi_write_blocking(SPI_PORT,wdata,1);
	SoftSpiTransferByte(wdata[0]);
	sleep_us(50);
	gpio_put(PIN_CS, 1);
	gpio_put(PIN_DC, 1);
}

                   

static void setLcdParam()
{
    //Start up
    writeSpiData(CMD_HIGH_POWER_MODE, IsCMD);
    //Load NVM Settings
    writeSpiData(CMD_NVM_LOAD_EN, IsCMD);
    writeSpiData(VAL_NVM_LOAD_NOT_TRIGGERD, IsPRM);
    //NVM Load control
    writeSpiData(CMD_NVM_LOAD, IsCMD);
    writeSpiData(VAL_NVM_LOAD_EN_VOL_EN_ID, IsPRM);
    //Booster Settings
    writeSpiData(CMD_BOOSTER_EN, IsCMD);
    writeSpiData(VAL_BOOSTER_EN, IsPRM);
    //Gate Voltage
    writeSpiData(CMD_GATE_VOLTAGE, IsCMD);
    writeSpiData(VAL_GATE_VOLTAGE_P12V_N5V, IsPRM);
    //Source Voltage1
    writeSpiData(CMD_SOURCE_VOLTAGE1, IsCMD);
    writeSpiData(VAL_SOURCE_VOLTAGE1_5V, IsPRM);//#1
    writeSpiData(VAL_SOURCE_VOLTAGE1_5V, IsPRM);//#2
    writeSpiData(VAL_SOURCE_VOLTAGE1_5V, IsPRM);//#3
    writeSpiData(VAL_SOURCE_VOLTAGE1_5V, IsPRM);//#4
    writeSpiData(VAL_SOURCE_VOLTAGE1_3_5V, IsPRM);//#5
    writeSpiData(VAL_SOURCE_VOLTAGE1_1_5V, IsPRM);//#6
    //Soruce Voltage2
    writeSpiData(CMD_SOURCE_VOLTAGE2, IsCMD);
    writeSpiData(VAL_SOURCE_VOLTAGE2_0V, IsPRM);//#1
    writeSpiData(VAL_SOURCE_VOLTAGE2_0V, IsPRM);//#2
    writeSpiData(VAL_SOURCE_VOLTAGE2_0V, IsPRM);//#3
    writeSpiData(VAL_SOURCE_VOLTAGE2_0V, IsPRM);//#4
    //VCOMH
    writeSpiData(CMD_VCOMH_VOLTAGE, IsCMD);
    writeSpiData(VAL_VCOMH_VOLTAGE_4V, IsPRM);
    //Gate EQ
    writeSpiData(CMD_UPDATE_GATE_EQ, IsCMD);
    writeSpiData(VAL_GATE_EQ_LEFT_EN, IsPRM);//#1
    writeSpiData(VAL_GATE_EQ_2ND_PRM, IsPRM);//#2
    writeSpiData(VAL_GATE_EQ_3RD_PRM, IsPRM);//#3
    writeSpiData(VAL_GATE_EQ_4TH_PRM, IsPRM);//#4
    writeSpiData(VAL_GATE_EQ_5TH_PRM, IsPRM);//#5
    writeSpiData(VAL_GATE_EQ_6TH_PRM, IsPRM);//#6
    writeSpiData(VAL_GATE_EQ_7TH_PRM, IsPRM);//#7
    writeSpiData(VAL_GATE_EQ_8TH_PRM, IsPRM);//#8
    writeSpiData(VAL_GATE_EQ_9TH_PRM, IsPRM);//#9
    writeSpiData(VAL_GATE_EQ_10TH_PRM, IsPRM);//#10
    //Sleep out
    writeSpiData(CMD_SLEEP_OUT, IsCMD);
    sleep_ms(30);//100->30 For Clock Down
    //Osc Setting
    writeSpiData(CMD_OSC_EN, IsCMD);
    writeSpiData(VAL_OSC_EN1, IsPRM);
    writeSpiData(VAL_OSC_EN2, IsPRM);
    //Duty Setting
    writeSpiData(CMD_DUTY, IsCMD);
    writeSpiData(VAL_DUTY_250, IsPRM);
    //Frame Rate
    writeSpiData(CMD_FRAME_RATE, IsCMD);
    writeSpiData(0, IsPRM);
    writeSpiData(0, IsPRM);

    //Memory Data Access
    writeSpiData(CMD_MEM_ACCESS_CTRL, IsCMD);
    writeSpiData(VAL_MEM_ACCESS_MV, IsPRM);
    //Data Format
    writeSpiData(CMD_DATA_FORMAT_SEL, IsCMD);
    writeSpiData(VAL_DATA_FORMAT_ON_3WIRE, IsPRM);               
    //Source Setting
    writeSpiData(CMD_SOURCE, IsCMD);
    writeSpiData(VAL_SOURCE_CLEAR_OFF, IsPRM);  
    //Panel Setting
    writeSpiData(CMD_PANEL, IsCMD);
    writeSpiData(VAL_PANEL_FRAME_TWO_LINE, IsPRM);
    //
    writeSpiData(0xD0, IsCMD);
    writeSpiData(0x1F, IsPRM);  
    //Disp on
    writeSpiData(CMD_DISP_ON, IsCMD);
    //Source Setting
    writeSpiData(CMD_SOURCE, IsCMD);
    writeSpiData(VAL_SOURCE_CLEAR_ON, IsPRM);  
    sleep_ms(10);//30->10 For Clock Down
    //Source Setting
    writeSpiData(CMD_SOURCE, IsCMD);
    writeSpiData(VAL_SOURCE_CLEAR_OFF, IsPRM);  
    //
    writeSpiData(0x72, IsCMD);
    writeSpiData(0x00, IsPRM);  
    //Low Power Mode
    writeSpiData(CMD_LOW_POWER_MODE, IsCMD);
    sleep_ms(10);//30->10 For Clock Down
}

void InitLcdSt7302()
{
    lcdByteWidth = ceil(LCD_WIDTH / 8) * 8;
	lcdByteHight = ceil(LCD_HIGHT / 12.0) * 12;
	lcdBufferSize= ceil(lcdByteHight * lcdByteWidth / 8);
	lcdBuffer = (uint8_t*)malloc(lcdBufferSize);
	printf("Lcd Buffer Malloc Size:%d\r\n",lcdBufferSize);
	
	if(lcdBuffer==NULL)
	{
		printf("Malloc ERR! Stop!\r\n");
		while(1);
	}

    toggleLcdReset();
    setLcdParam();
    LcdClear();
}

void LcdClear()
{
    writeSpiData(CMD_SOURCE, IsCMD);
    writeSpiData(VAL_CLEAR_RAM_ON, IsPRM);
    sleep_ms(10);//30->10 For Clock Down
    writeSpiData(CMD_SOURCE, IsCMD);
    writeSpiData(VAL_CLEAR_RAM_OFF, IsPRM);
    memset(lcdBuffer, 0, lcdBufferSize);
}

void LcdDispEnable(bool en)
{
    if(en)
        writeSpiData(CMD_DISP_ON, IsCMD);
    else
        writeSpiData(CMD_DISP_OFF, IsCMD);
}

void LcdEnableInversion(bool inv)
{
    if(inv)
        writeSpiData(CMD_INVERSION_ON, IsCMD);
    else
        writeSpiData(CMD_INVERSION_OFF, IsCMD);
}

void LcdEnableLowPowerMode(bool low)
{
    if(low)
        writeSpiData(CMD_LOW_POWER_MODE, IsCMD);
    else
        writeSpiData(CMD_HIGH_POWER_MODE, IsCMD);
}

void LcdSetPoint(uint16_t x, uint16_t y, bool bit)
{
    uint16_t byteNum = calcByte(x,y);
    uint16_t bitNum = calcBit(x,y);

    if(bit)
        lcdBuffer[byteNum] = bitSet(lcdBuffer[byteNum], bitNum);
    else
        lcdBuffer[byteNum] = bitClear(lcdBuffer[byteNum], bitNum);
}

void LcdUpdate()
{
    uint32_t i = 0;
    //Column Address Setting
    writeSpiData(CMD_COL_ADDR_SET, IsCMD);
    writeSpiData(VAL_COL_ADDR, IsPRM);  
    writeSpiData(VAL_COL_ADDR + lcdByteHight/12, IsPRM);  
    //Row Address Setting
    writeSpiData(CMD_ROW_ADDR_SET, IsCMD);
    writeSpiData(VAL_ROW_ADDR, IsPRM);  
    writeSpiData(lcdByteWidth/2 - 1, IsPRM); 
    //Start Write
    writeSpiData(CMD_MEM_WRITE, IsCMD);
	gpio_put(PIN_CS, 0);
	gpio_put(PIN_DC, 1);
	sleep_us(10);
	for ( i = 0; i < lcdBufferSize; i++)
	{
        SoftSpiTransferByte(lcdBuffer[i]);
	}
	sleep_us(50);
	gpio_put(PIN_CS, 1);
    gpio_put(PIN_DC, 1);
}

