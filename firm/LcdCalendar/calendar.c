
/*
 *  	calendar.c
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 * 
 */
#include <stdio.h>
#include <string.h>
#include <time.h>
#include "calendar.h"


#define BASEYEAR 2000
const char DAYS[12] = {31,28,31,30,31,30,31,31,30,31,30,31};
const char DAYS_LEAP[12] = {31,29,31,30,31,30,31,31,30,31,30,31};

void GetWeekString(uint8_t week, char *str)
{
	switch(week)
	{
		case 0:
			strcpy(str,"sun");
			break;
		case 1:
			strcpy(str,"mon");
			break;
		case 2:
			strcpy(str,"tue");
			break;
		case 3:
			strcpy(str,"wed");
			break;
		case 4:
			strcpy(str,"thr");
			break;
		case 5:
			strcpy(str,"fri");
			break;
		case 6:
			strcpy(str,"sat");
			break;
		default:
			break;
	}
	
}

void GetMonthString(uint8_t month, char *str)
{
	switch(month)
	{
		case 1:
			strcpy(str,"January      ");
			break;
		case 2:
			strcpy(str,"February     ");
			break;
		case 3:
			strcpy(str,"March        ");
			break;
		case 4:
			strcpy(str,"April        ");
			break;
		case 5:
			strcpy(str,"May          ");
			break;
		case 6:
			strcpy(str,"June         ");
			break;
		case 7:
			strcpy(str,"July         ");
			break;
		case 8:
			strcpy(str,"August       ");
			break;
		case 9:
			strcpy(str,"September    ");
			break;
		case 10:
			strcpy(str,"October      ");
			break;
		case 11:
			strcpy(str,"November     ");
			break;
		case 12:
			strcpy(str,"December     ");
			break;
		default:
			break;
	}
	
}

int check_ym(int y, int m)
{
    if (y < 2000 || m < 1 || m > 12) 
	{
        return -1;
    }    
	return 0;
}

int check_leap_year(int y)
{
    int leap = 0;
    
    if (y % 4 == 0) 
	{
        if (y % 100 == 0) 
		{
            if (y % 400 == 0) 
			{
                leap = 1;
			}
        } 
		else
		{
            leap = 1;
        }
    }
    
    return leap;
}

int get_1st_dayofweek(int y, int m, const char d[])
{
    int dayOfWeek = 0; //0:saturday
    
    dayOfWeek = (y - BASEYEAR);
    
	//Leap Year
    for (int i = BASEYEAR; i < y; i++) {
        dayOfWeek += check_leap_year(i);
    }

    for (int j = 0; j < m-1; j++) {
        dayOfWeek += d[j];
    }
    
    dayOfWeek %= 7;
    
    return dayOfWeek;
}

int8_t dayofweek(uint8_t year, uint8_t month, uint8_t day)
{
    struct tm  t;

    t.tm_year  = (int)year - 1900 + 2000;
    t.tm_mon   = month - 1;
    t.tm_mday  = day;
    t.tm_hour  = 0;
    t.tm_min   = 0;
    t.tm_sec   = 0;
    t.tm_isdst = 0;

    if (mktime(&t) == -1)
        return -1;
    return (t.tm_wday);
}

void GetCalendarString(uint8_t in_year, uint8_t in_month, uint8_t in_day, uint8_t line, char *str)
{
    int year,month;
	const char *days;
    int firstDay = 0;
	int lineIndex = 0;
	char strBuff[60]={'\0'};
	
	year = in_year+2000;
	month = in_month;

    if (check_ym(year, month) != 0) {
        //printf("year or month have an error.\n");
        return ;
    }
    
    if (check_leap_year(year) > 0) {
        days = DAYS_LEAP;
    } else {
        days = DAYS;
    }
    
    firstDay = get_1st_dayofweek(year, month, days);
    
	if(line==0)
	{
		for(int i = 0; i < (firstDay + 6) % 7; i++)
		{ 
			//printf("    ");
			strcat(strBuff, "    ");
		}
		strcpy(str,strBuff);
	}
   

    for(int i = 1; i <= days[month-1]; i++)
	{
        if(line==lineIndex)
		{
			//printf(" %2d ", i);
			if(i==in_day)
				sprintf(strBuff,"%s[%2d]",strBuff,i);
			else
				sprintf(strBuff,"%s %2d ",strBuff,i);
		}
			
        
        if(firstDay == 0)
		{
            //printf("\n");
			lineIndex++;
        }
        firstDay = (firstDay + 1) % 7;
    }
	//printf("\n");
    strcpy(str,strBuff);
    return;
}