
/*
 *  	calendar.h
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 * 
 */


void GetWeekString(uint8_t week, char *str);
void GetMonthString(uint8_t month, char *str);
int check_ym(int y, int m);
int check_leap_year(int y);
int get_1st_dayofweek(int y, int m, const char d[]);
int8_t dayofweek(uint8_t year, uint8_t month, uint8_t day);
void GetCalendarString(uint8_t in_year, uint8_t in_month, uint8_t in_day, uint8_t line, char *str);