/*
 *  	soft_spi.h
 *
 *  Copyright (c) 2024
 *  K.Watanabe, Crescentt
 *  Released under the MIT license
 *  http://opensource.org/licenses/mit-license.php
 *
 */

#define SOFT_SPI_CLK	18
#define SOFT_SPI_MOSI	19
#define SOFT_SPI_MISO	22


void SoftSpiInit();
uint8_t SoftSpiTransferByte(uint8_t wdata);