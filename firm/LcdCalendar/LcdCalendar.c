/*
 *  	LcdCalendar.c
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 * 
 */


#include <stdio.h>
#include <string.h>
#include <stdbool.h>
#include "pico/stdlib.h"
#include "hardware/spi.h"
#include "hardware/i2c.h"
#include "hardware/timer.h"
#include "hardware/watchdog.h"
#include "LcdSt7302.h"
#include "calendar.h"
#include "LcdCalendar.h"
#include "rtc_sd30XX.h"
#include "soft_spi.h"
#include "ugui.h"

#define LINE_OFFSET			12
#define SLEEP_COUNT_MAX		10	//After user sw 10sec, go to sleep 
#define EDIT_MODE_COUNT_MAX	3	//Enter Edit Mode


UG_GUI gui;


enum{
	EDIT_NUM_YEAR,
	EDIT_NUM_MONTH,
	EDIT_NUM_DAY,
	EDIT_NUM_HOUR,
	EDIT_NUM_MIN,
	EDIT_NUM_SEC,
	EDIT_NUM_MAX
};

volatile bool EventFlg = false;
volatile bool initialUpdate = true;
volatile bool enterSleep = false;
volatile bool editMode = false;

volatile uint8_t editPart = EDIT_NUM_YEAR;

volatile uint8_t rtc_int_old = 0;
volatile uint8_t sw_up_old = 0;
volatile uint8_t sw_down_old = 0;
volatile uint8_t sw_left_old = 0;
volatile uint8_t sw_right_old = 0;

volatile uint16_t sleepCount = 0;
volatile uint16_t editModeCount = 0;

volatile int16_t offset_month = 0;
volatile int16_t offset_year = 0;

uint8_t rtc_y;
uint8_t rtc_mon;
uint8_t rtc_d;
uint8_t rtc_h;
uint8_t rtc_min;
uint8_t rtc_s;
uint8_t rtc_w;

uint8_t edit_y=24;
uint8_t edit_mon=10;
uint8_t edit_d=1;
uint8_t edit_w=0;
uint8_t edit_h=10;
uint8_t edit_min=0;
uint8_t edit_s=0;


bool repeating_timer_callback(struct repeating_timer *t)
{  
	// Check Sleep Count
	sleepCount++;
	if( sleepCount > SLEEP_COUNT_MAX )
	{
		//Undo & Set Today
		offset_month = rtc_mon;
		offset_year = rtc_y;
		initialUpdate = true;		
		enterSleep = true;
	}

	//Check Edit Count	
	if( gpio_get(PIN_SW_LEFT)==0 || gpio_get(PIN_SW_RIGHT)==0)
		editModeCount++;
	else
		editModeCount=0;

	if( editModeCount > EDIT_MODE_COUNT_MAX )
		editMode = true;

    return true;
}

void checkUserInput()
{
	bool hasInput = false;
	uint8_t rtc_int = gpio_get(PIN_RTCINT);
	uint8_t sw_up = gpio_get(PIN_SW_UP);
	uint8_t sw_down = gpio_get(PIN_SW_DOWN);
	uint8_t sw_right = gpio_get(PIN_SW_RIGHT);
	uint8_t sw_left = gpio_get(PIN_SW_LEFT);
	
	if( rtc_int_old == 0 &&  rtc_int == 1 )
	{
		if(editMode)
		{
			//Set RTC
			SetRtcDate(edit_y, edit_mon, edit_d);
			SetRtcTime(edit_h, edit_min, edit_s);
			SetRtcWeek(edit_w);
			editMode = false;
		}
		else
		{
			offset_month = rtc_mon;
			offset_year = rtc_y;
		}
		
		hasInput = true;
	}
		
	
	if( sw_down_old == 0 && sw_down == 1 )
	{
		if(editMode)
		{
			switch(editPart)
			{
				case EDIT_NUM_YEAR:
					edit_y++;
					break;
				case EDIT_NUM_MONTH:
					if(edit_mon<12)
						edit_mon++;	
					else
						edit_mon=1;	
					break;
				case EDIT_NUM_DAY:
					if(edit_d<31)
						edit_d++;
					else
						edit_d=1;
					break;
				case EDIT_NUM_HOUR:
					if(edit_h<23)
						edit_h++;
					else
						edit_h=0;
					break;
				case EDIT_NUM_MIN:
					if(edit_min<59)
						edit_min++;
					else
						edit_min=0;
					break;
				case EDIT_NUM_SEC:
					if(edit_s<59)
						edit_s++;
					else
						edit_s=0;
					break;
				default:
					break;
			}

		}
		else
		{
			offset_month++;
			if( offset_month > 12 )
			{
				offset_month = 1;
				offset_year++;
			}
		}
		hasInput = true;
	}
		

	if( sw_up_old == 0 && sw_up ==1 )
	{
		if(editMode)
		{
			switch(editPart)
			{

				case EDIT_NUM_YEAR:
					edit_y--;
					break;
				case EDIT_NUM_MONTH:
					if(edit_mon>1)
						edit_mon--;	
					else
						edit_mon=12;	
					break;
				case EDIT_NUM_DAY:
					if(edit_d>1)
						edit_d--;
					else
						edit_d=31;
					break;
				case EDIT_NUM_HOUR:
					if(edit_h>1)
						edit_h--;
					else
						edit_h=23;	
					break;
				case EDIT_NUM_MIN:
					if(edit_min>1)
						edit_min--;
					else
						edit_min=59;
					break;
				case EDIT_NUM_SEC:
					if(edit_s>1)
						edit_s--;
					else
						edit_s=59;
					break;
				default:
					break;
			}

		}
		else
		{
			offset_month--;
			if( offset_month <= 0 )
			{
				offset_month = 12;
				offset_year--;
			}
		}
		hasInput = true;
	}
		

	if( sw_left_old == 0 && sw_left == 1 )
	{
		if( editMode && editPart > 0)
		{
			editPart--;
		}
		hasInput = true;
	}
		

	if(	sw_right_old == 0 && sw_right == 1)
	{
		if( editMode && editPart < EDIT_NUM_SEC)
		{
			editPart++;
		}
		hasInput = true;
	}
		

	if( hasInput == true )
	{
		sleepCount = 0;
		initialUpdate = true;
	}
	rtc_int_old = rtc_int;
	sw_up_old = sw_up;
	sw_down_old = sw_down;
	sw_left_old = sw_left;
	sw_right_old = sw_right;
}


void pset(UG_S16 x, UG_S16 y, UG_COLOR col)
{
	uint16_t c = col;
	if( c!=0 )
		c = 1;
	LcdSetPoint(x, y, c);
}

int main()
{
	set_sys_clock_khz(36000, true);//Clock down to 36MHz
	stdio_init_all();

	// I2C Initialisation. Using it at 100Khz.
    i2c_init(I2C_PORT, 100*1000);
    
    gpio_set_function(I2C_SDA, GPIO_FUNC_I2C);
    gpio_set_function(I2C_SCL, GPIO_FUNC_I2C);
    gpio_pull_up(I2C_SDA);
    gpio_pull_up(I2C_SCL);
 
    // Chip select is active-low
    gpio_init(PIN_CS);
	gpio_set_dir(PIN_CS, GPIO_OUT);
    gpio_put(PIN_CS, 1);
	
	gpio_init(PIN_RST);
	gpio_set_dir(PIN_RST, GPIO_OUT);
    gpio_put(PIN_RST, 0);
	gpio_init(PIN_DC);
	gpio_set_dir(PIN_DC, GPIO_OUT);
    gpio_put(PIN_DC, 1);


	//Joystick IO Settings
	gpio_init(PIN_RTCINT);
	gpio_set_dir(PIN_RTCINT, GPIO_IN);
	gpio_pull_up(PIN_RTCINT);

	
	gpio_init(PIN_SW_UP);
	gpio_set_dir(PIN_SW_UP, GPIO_IN);
	gpio_pull_up(PIN_SW_UP);

	
	gpio_init(PIN_SW_DOWN);
	gpio_set_dir(PIN_SW_DOWN, GPIO_IN);
	gpio_pull_up(PIN_SW_DOWN);

	
	gpio_init(PIN_SW_LEFT);
	gpio_set_dir(PIN_SW_LEFT, GPIO_IN);
	gpio_pull_up(PIN_SW_LEFT);

	gpio_init(PIN_SW_RIGHT);
	gpio_set_dir(PIN_SW_RIGHT, GPIO_IN);
	gpio_pull_up(PIN_SW_RIGHT);

	//XC6194 Load Switch Settings
	gpio_init(PIN_SHDN);
	gpio_set_dir(PIN_SHDN, GPIO_OUT);
    gpio_put(PIN_SHDN, 0);

	SoftSpiInit();

	DisableRtcIntPin();
	EnableRtcI2CInVbat();
	EnableRtcIntPin();
	
	InitLcdSt7302();
	UG_Init(&gui, pset, 250, 122);
  	UG_FillScreen(C_WHITE);
	UG_SelectGUI(&gui);

	struct repeating_timer timer;
    add_repeating_timer_ms(1000, repeating_timer_callback, NULL, &timer);
	
	if( gpio_get(PIN_RTCINT) == 0 )	//Still RTCINT is low unless Rtc Interrupt Reset -> User Input
	{
		enterSleep = false;
	}
	else
	{
		enterSleep = true;
	}

	checkUserInput();
	GetRtcDateTime(&rtc_y,&rtc_mon,&rtc_d,&rtc_h,&rtc_min,&rtc_s);
	offset_month = rtc_mon;
	offset_year = rtc_y;
		
	while (true)
	{
		
		checkUserInput();

		if( initialUpdate == true || editMode == true )
		{
			if(initialUpdate==true)
				LcdClear();
			LcdEnableInversion(false);
			GetRtcDateTime(&rtc_y, &rtc_mon, &rtc_d, &rtc_h, &rtc_min, &rtc_s);
			GetRtcWeek(&rtc_w);

	
			char dateTime[60]={'\0'}; 
			char dateWeek[60]={'\0'}; 
			char dateMonth[60]={'\0'};
			char dateLine0[60]={'\0'};
			char dateLine1[60]={'\0'};
			char dateLine2[60]={'\0'};
			char dateLine3[60]={'\0'};
			char dateLine4[60]={'\0'};
			char dateLine5[60]={'\0'};
			char dateTmp[60]={'\0'};
			char str3[] = " sun mon tue wed thr fri sat";
					
			if(editMode)
			{
				edit_w = dayofweek(edit_y, edit_mon, edit_d);
				
				if( edit_w != -1 )
					GetWeekString(edit_w, dateWeek);
				
				switch (editPart)
				{
					case EDIT_NUM_YEAR:
						sprintf(dateTime,"[20%2d]/%2d/%2d %02d:%02d:%02d", edit_y, edit_mon, edit_d, edit_h, edit_min, edit_s); 
						break;
					case EDIT_NUM_MONTH:
						sprintf(dateTime,"20%2d/[%2d]/%2d %02d:%02d:%02d", edit_y, edit_mon, edit_d, edit_h, edit_min, edit_s); 
						break;					
					case EDIT_NUM_DAY:
						sprintf(dateTime,"20%2d/%2d/[%2d] %02d:%02d:%02d", edit_y, edit_mon, edit_d, edit_h, edit_min, edit_s); 
						break;
					case EDIT_NUM_HOUR:
						sprintf(dateTime,"20%2d/%2d/%2d [%02d]:%02d:%02d", edit_y, edit_mon, edit_d, edit_h, edit_min, edit_s); 
						break;
					case EDIT_NUM_MIN:
						sprintf(dateTime,"20%2d/%2d/%2d %02d:[%02d]:%02d", edit_y, edit_mon, edit_d, edit_h, edit_min, edit_s); 
						break;
					case EDIT_NUM_SEC:
						sprintf(dateTime,"20%2d/%2d/%2d %02d:%02d:[%02d]", edit_y, edit_mon, edit_d, edit_h, edit_min, edit_s); 
						break;
					default:
						break;
				}
			}
			else
			{
				GetWeekString(rtc_w, dateWeek);
				//sprintf(dateTime,"20%2d/%2d/%2d (%s) %02d:%02d:%02d",rtc_y,rtc_mon,rtc_d,dateWeek,(int)rtc_h,(int)rtc_min,(int)rtc_s);
				sprintf(dateTime,"20%2d/%2d/%2d (%s) %02d:%02d         ",rtc_y,rtc_mon,rtc_d,dateWeek,(int)rtc_h,(int)rtc_min); 
			}


			UG_FontSelect(&FONT_8X12);
			if(editMode)
				UG_PutString(4,6,dateTime);
			else
				UG_PutString(24,6,dateTime);

			if( offset_month == rtc_mon && offset_year == rtc_y )
			{
				GetMonthString(rtc_mon, dateMonth);
				GetCalendarString(rtc_y, rtc_mon, rtc_d, 0, dateLine0);
				GetCalendarString(rtc_y, rtc_mon, rtc_d, 1, dateLine1);
				GetCalendarString(rtc_y, rtc_mon, rtc_d, 2, dateLine2);
				GetCalendarString(rtc_y, rtc_mon, rtc_d, 3, dateLine3);
				GetCalendarString(rtc_y, rtc_mon, rtc_d, 4, dateLine4);
				GetCalendarString(rtc_y, rtc_mon, rtc_d, 5, dateLine5);
				UG_FontSelect(&FONT_7X12);
				if( 3<=rtc_mon && rtc_mon<=7 )
					UG_PutString(104,22,dateMonth);
				else
					UG_PutString(90,22,dateMonth);				
			}
			else
			{				
				GetMonthString(offset_month, dateMonth);
				sprintf(dateTmp,"20%2d/%s",offset_year, dateMonth);
				strcpy(dateMonth,dateTmp); 
				GetCalendarString(offset_year, offset_month, 0, 0, dateLine0);
				GetCalendarString(offset_year, offset_month, 0, 1, dateLine1);
				GetCalendarString(offset_year, offset_month, 0, 2, dateLine2);
				GetCalendarString(offset_year, offset_month, 0, 3, dateLine3);
				GetCalendarString(offset_year, offset_month, 0, 4, dateLine4);
				GetCalendarString(offset_year, offset_month, 0, 5, dateLine5);
				UG_FontSelect(&FONT_7X12);
				UG_PutString(80,22,dateMonth);
			}


			UG_FontSelect(&FONT_7X12);
			UG_PutString(10,36,str3);
			UG_PutString(10,36+1*LINE_OFFSET,dateLine0);
			UG_PutString(10,36+2*LINE_OFFSET,dateLine1);
			UG_PutString(10,36+3*LINE_OFFSET,dateLine2);
			UG_PutString(10,36+4*LINE_OFFSET,dateLine3);
			UG_PutString(10,36+5*LINE_OFFSET,dateLine4);
			UG_PutString(10,36+6*LINE_OFFSET,dateLine5);

			LcdUpdate();
			//sleep_ms(1);
			LcdDispEnable(true);
			initialUpdate = false;
		}
								
		if( enterSleep == true )
		{
			if( gpio_get(PIN_RTCINT) == 0 )
			{
				DisableRtcIntPin();
				EnableRtcIntPin();		
				if( gpio_get(PIN_RTCINT) == 0 )
					watchdog_reboot(0,0,0);//Reboot
			}

			LcdEnableLowPowerMode(true);


			//Change LCD IO Direction for MPU Shutdown to avoid from LCD Reset
			gpio_init(PIN_RST);
			gpio_set_dir(PIN_RST, GPIO_IN);
			sleep_ms(1);
			gpio_put(PIN_SHDN, 1);//MPU Power Shutdown for Battery
			sleep_ms(10);
			
			//For USB Power Use
			while(gpio_get(PIN_RTCINT) == 1);
			watchdog_reboot(0,0,0);//Reboot
		}
		
		sleep_ms(10);
					
	}

    return 0;
}
