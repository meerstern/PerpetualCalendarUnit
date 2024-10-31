/*
 *  	LcdSt7302.h
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 * 
 *  For the ST7302 initialization sequence,  refer below link.
 *  https://github.com/zhcong/ST7302-for-arduino
 */

void InitLcdSt7302();
void LcdClear();
void LcdDispEnable(bool en);
void LcdEnableInversion(bool inv);
void LcdEnableLowPowerMode(bool low);
void LcdSetPoint(uint16_t x, uint16_t y, bool bit);
void LcdUpdate();
