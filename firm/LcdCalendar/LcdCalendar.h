/*
 *  	LcdCalendar.h
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 * 
 */
// SPI Defines
// We are going to use SPI 0, and allocate it to the following GPIO pins
// Pins can be changed, see the GPIO function select table in the datasheet for information on GPIO assignments
#define SPI_PORT spi0
// #define PIN_MISO 16
// #define PIN_CS   17
// #define PIN_SCK  18
// #define PIN_MOSI 19
// #define PIN_RST  15
// #define PIN_DC   14

// #define PIN_MISO 16
#define PIN_CS   17
// #define PIN_SCK  18
// #define PIN_MOSI 19
#define PIN_RST  21
#define PIN_DC   20


#define PIN_RTCINT      10  //Push Center SW 
#define PIN_SW_UP       11
#define PIN_SW_DOWN     14
#define PIN_SW_LEFT     13
#define PIN_SW_RIGHT    12
#define PIN_SHDN        16


// I2C defines
// This example will use I2C0 on GPIO8 (SDA) and GPIO9 (SCL) running at 400KHz.
// Pins can be changed, see the GPIO function select table in the datasheet for information on GPIO assignments
#define I2C_PORT i2c0
#define I2C_SDA 4
#define I2C_SCL 5

#define USE_RTC_SD30XX



