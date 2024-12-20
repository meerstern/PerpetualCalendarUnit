EESchema Schematic File Version 4
LIBS:pc-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Perpetual Calendar"
Date "2024-07-05"
Rev "v1.2"
Comp "Crescent"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L XC6194BANNER-G:XC6194BANNER-G IC1
U 1 1 667EA757
P 6625 1025
F 0 "IC1" H 7175 1290 50  0000 C CNN
F 1 "XC6194BANNER-G" H 7175 1199 50  0000 C CNN
F 2 "IC:XC6194BANNERG" H 7575 1125 50  0001 L CNN
F 3 "https://www.torexsemi.com/file/XC6194/XC6194.pdf" H 7575 1025 50  0001 L CNN
F 4 "TOREX - XC6194BANNER-G - Power Load Distribution Switch, High Side, 1 Output, 6V, 0.19ohm, USP-B06, 8-Pin" H 7575 925 50  0001 L CNN "Description"
F 5 "0.33" H 7575 825 50  0001 L CNN "Height"
F 6 "Torex" H 7575 725 50  0001 L CNN "Manufacturer_Name"
F 7 "XC6194BANNER-G" H 7575 625 50  0001 L CNN "Manufacturer_Part_Number"
F 8 "865-XC6194BANNER-G" H 7575 525 50  0001 L CNN "Mouser Part Number"
F 9 "https://www.mouser.co.uk/ProductDetail/Torex-Semiconductor/XC6194BANNER-G?qs=BJlw7L4Cy7%2Fd%252BPO85O5%2FiA%3D%3D" H 7575 425 50  0001 L CNN "Mouser Price/Stock"
F 10 "" H 7575 325 50  0001 L CNN "Arrow Part Number"
F 11 "" H 7575 225 50  0001 L CNN "Arrow Price/Stock"
	1    6625 1025
	1    0    0    -1  
$EndComp
$Comp
L RTC:SD3077 U6
U 1 1 667EADFC
P 9825 4350
F 0 "U6" H 10075 4475 50  0000 C CNN
F 1 "SD3077" H 10075 4384 50  0000 C CNN
F 2 "Package_SO:SO-8_5.3x6.2mm_P1.27mm" H 9825 4350 50  0001 C CNN
F 3 "" H 9825 4350 50  0001 C CNN
	1    9825 4350
	1    0    0    -1  
$EndComp
$Comp
L MCU_RaspberryPi_and_Boards:RP2040 U3
U 1 1 667EC8A6
P 3950 5875
F 0 "U3" H 4100 3900 50  0000 C CNN
F 1 "RP2040" H 4150 3800 50  0000 C CNN
F 2 "MCU_RaspberryPi_and_Boards:RP2040-QFN-56" H 3200 5875 50  0001 C CNN
F 3 "" H 3200 5875 50  0001 C CNN
	1    3950 5875
	0    1    1    0   
$EndComp
$Comp
L Connector_Generic:Conn_01x24 J3
U 1 1 667EEC69
P 10950 1825
F 0 "J3" H 11030 1817 50  0000 L CNN
F 1 "LCD ST7302 122x250 ZJY213S0700TG01 " H 9625 500 50  0000 L CNN
F 2 "24pin0.8mm:24pin0.8mm" H 10950 1825 50  0001 C CNN
F 3 "~" H 10950 1825 50  0001 C CNN
	1    10950 1825
	1    0    0    -1  
$EndComp
Text Label 10525 725  0    50   ~ 0
CD2P
Text Label 10525 825  0    50   ~ 0
CD2N
Text Label 10525 1025 0    50   ~ 0
VGL
Text Label 10525 1125 0    50   ~ 0
VGH
Text Label 10525 1225 0    50   ~ 0
CD1P
Text Label 10525 1325 0    50   ~ 0
CD1N
Wire Wire Line
	10750 725  10525 725 
Wire Wire Line
	10525 825  10750 825 
Wire Wire Line
	10750 1025 10525 1025
NoConn ~ 10750 925 
NoConn ~ 10750 1425
NoConn ~ 10750 1525
NoConn ~ 10750 3025
Text Label 9975 1625 2    50   ~ 0
LCD_RSTB
Text Label 9975 1725 2    50   ~ 0
LCD_A0
Text Label 9975 1825 2    50   ~ 0
LCD_CSB
Text Label 9975 2025 2    50   ~ 0
LCD_MOSI
Text Label 10525 2125 0    50   ~ 0
VDDI
Text Label 10525 2225 0    50   ~ 0
VDDI
Text Label 10525 2325 0    50   ~ 0
GND
Text Label 10525 2425 0    50   ~ 0
VCCIO
Text Label 10525 2525 0    50   ~ 0
VMREF
Text Label 10525 2625 0    50   ~ 0
VSH
Text Label 10525 2725 0    50   ~ 0
VCOMH
Text Label 10525 2825 0    50   ~ 0
VSL
Text Label 10525 2925 0    50   ~ 0
AVDD
Wire Wire Line
	10750 2925 10525 2925
Wire Wire Line
	10750 2825 10525 2825
Wire Wire Line
	10525 2725 10750 2725
Wire Wire Line
	10750 2625 10525 2625
Wire Wire Line
	10525 2525 10750 2525
Wire Wire Line
	10750 2425 10525 2425
Wire Wire Line
	10525 2325 10750 2325
Wire Wire Line
	10750 2225 10525 2225
Wire Wire Line
	10525 2125 10750 2125
Wire Wire Line
	10750 2025 10275 2025
Wire Wire Line
	10275 1925 10750 1925
Wire Wire Line
	10750 1825 10275 1825
Wire Wire Line
	10275 1725 10750 1725
Wire Wire Line
	10750 1625 10275 1625
Wire Wire Line
	10750 1325 10525 1325
Wire Wire Line
	10525 1225 10750 1225
Wire Wire Line
	10750 1125 10525 1125
$Comp
L Device:C C30
U 1 1 667FE890
P 9025 1125
F 0 "C30" H 9140 1171 50  0000 L CNN
F 1 "1uF" H 9140 1080 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9063 975 50  0001 C CNN
F 3 "~" H 9025 1125 50  0001 C CNN
	1    9025 1125
	1    0    0    -1  
$EndComp
Text Label 9025 925  0    50   ~ 0
CD2P
Text Label 9025 1325 0    50   ~ 0
CD2N
Wire Wire Line
	9025 925  9025 975 
Wire Wire Line
	9025 1275 9025 1325
$Comp
L Device:C C25
U 1 1 667FF97D
P 8650 1125
F 0 "C25" H 8765 1171 50  0000 L CNN
F 1 "1uF" H 8765 1080 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8688 975 50  0001 C CNN
F 3 "~" H 8650 1125 50  0001 C CNN
	1    8650 1125
	1    0    0    -1  
$EndComp
Text Label 8650 1325 0    50   ~ 0
GND
Text Label 8650 925  0    50   ~ 0
VGL
Wire Wire Line
	8650 925  8650 975 
Wire Wire Line
	8650 1275 8650 1325
$Comp
L Device:C C21
U 1 1 66801E7D
P 8300 1125
F 0 "C21" H 8415 1171 50  0000 L CNN
F 1 "1uF" H 8415 1080 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 975 50  0001 C CNN
F 3 "~" H 8300 1125 50  0001 C CNN
	1    8300 1125
	1    0    0    -1  
$EndComp
Text Label 8300 1325 0    50   ~ 0
GND
Text Label 8300 925  0    50   ~ 0
VGH
Wire Wire Line
	8300 925  8300 975 
Wire Wire Line
	8300 1275 8300 1325
$Comp
L Device:C C31
U 1 1 6680378C
P 9025 1700
F 0 "C31" H 9140 1746 50  0000 L CNN
F 1 "1uF" H 9140 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9063 1550 50  0001 C CNN
F 3 "~" H 9025 1700 50  0001 C CNN
	1    9025 1700
	1    0    0    -1  
$EndComp
Text Label 9025 1500 0    50   ~ 0
CD1P
Text Label 9025 1900 0    50   ~ 0
CD1N
Wire Wire Line
	9025 1500 9025 1550
Wire Wire Line
	9025 1850 9025 1900
$Comp
L Device:C C26
U 1 1 6680B200
P 8650 1700
F 0 "C26" H 8765 1746 50  0000 L CNN
F 1 "0.1uF" H 8765 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8688 1550 50  0001 C CNN
F 3 "~" H 8650 1700 50  0001 C CNN
	1    8650 1700
	1    0    0    -1  
$EndComp
Text Label 8650 1900 0    50   ~ 0
GND
Wire Wire Line
	8650 1500 8650 1550
Wire Wire Line
	8650 1850 8650 1900
Text Label 8650 1500 0    50   ~ 0
VDDI
$Comp
L Device:C C22
U 1 1 6680D330
P 8300 1700
F 0 "C22" H 8415 1746 50  0000 L CNN
F 1 "1uF" H 8415 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 1550 50  0001 C CNN
F 3 "~" H 8300 1700 50  0001 C CNN
	1    8300 1700
	1    0    0    -1  
$EndComp
Text Label 8300 1900 0    50   ~ 0
GND
Wire Wire Line
	8300 1500 8300 1550
Wire Wire Line
	8300 1850 8300 1900
Text Label 8300 1500 0    50   ~ 0
VCCIO
$Comp
L Device:C C32
U 1 1 6680EE63
P 9025 2250
F 0 "C32" H 9140 2296 50  0000 L CNN
F 1 "1uF" H 9140 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9063 2100 50  0001 C CNN
F 3 "~" H 9025 2250 50  0001 C CNN
	1    9025 2250
	1    0    0    -1  
$EndComp
Text Label 9025 2450 0    50   ~ 0
GND
Wire Wire Line
	9025 2050 9025 2100
Wire Wire Line
	9025 2400 9025 2450
Text Label 9025 2050 0    50   ~ 0
VMREF
$Comp
L Device:C C27
U 1 1 6681518A
P 8650 2250
F 0 "C27" H 8765 2296 50  0000 L CNN
F 1 "1uF" H 8765 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8688 2100 50  0001 C CNN
F 3 "~" H 8650 2250 50  0001 C CNN
	1    8650 2250
	1    0    0    -1  
$EndComp
Text Label 8650 2450 0    50   ~ 0
GND
Wire Wire Line
	8650 2050 8650 2100
Wire Wire Line
	8650 2400 8650 2450
Text Label 8650 2050 0    50   ~ 0
VSH
$Comp
L Device:C C23
U 1 1 66819AD9
P 8300 2250
F 0 "C23" H 8415 2296 50  0000 L CNN
F 1 "1uF" H 8415 2205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 2100 50  0001 C CNN
F 3 "~" H 8300 2250 50  0001 C CNN
	1    8300 2250
	1    0    0    -1  
$EndComp
Text Label 8300 2450 0    50   ~ 0
GND
Wire Wire Line
	8300 2050 8300 2100
Wire Wire Line
	8300 2400 8300 2450
Text Label 8300 2050 0    50   ~ 0
VCOMH
$Comp
L Device:C C33
U 1 1 6681EAD2
P 9025 2800
F 0 "C33" H 9140 2846 50  0000 L CNN
F 1 "1uF" H 9140 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 9063 2650 50  0001 C CNN
F 3 "~" H 9025 2800 50  0001 C CNN
	1    9025 2800
	1    0    0    -1  
$EndComp
Text Label 9025 3000 0    50   ~ 0
GND
Wire Wire Line
	9025 2600 9025 2650
Wire Wire Line
	9025 2950 9025 3000
Text Label 9025 2600 0    50   ~ 0
VSL
$Comp
L Device:C C28
U 1 1 66823158
P 8650 2800
F 0 "C28" H 8765 2846 50  0000 L CNN
F 1 "1uF" H 8765 2755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8688 2650 50  0001 C CNN
F 3 "~" H 8650 2800 50  0001 C CNN
	1    8650 2800
	1    0    0    -1  
$EndComp
Text Label 8650 3000 0    50   ~ 0
GND
Wire Wire Line
	8650 2600 8650 2650
Wire Wire Line
	8650 2950 8650 3000
Text Label 8650 2600 0    50   ~ 0
AVDD
$Comp
L typeC:TypeC16Pin J2
U 1 1 6682C40A
P 1600 2225
F 0 "J2" H 1967 2390 50  0000 C CNN
F 1 "TypeC16Pin" H 1967 2299 50  0000 C CNN
F 2 "TypeC:TypeC_16Pin" H 1600 2225 50  0001 C CNN
F 3 "" H 1600 2225 50  0001 C CNN
	1    1600 2225
	-1   0    0    -1  
$EndComp
$Comp
L Device:Battery_Cell BT2
U 1 1 6682D020
P 9325 4975
F 0 "BT2" H 9443 5071 50  0000 L CNN
F 1 "RTC CR1220" H 9175 4950 50  0000 L CNN
F 2 "CR1220_2895:2895" V 9325 5035 50  0001 C CNN
F 3 "~" V 9325 5035 50  0001 C CNN
	1    9325 4975
	1    0    0    -1  
$EndComp
Text Label 9475 5275 0    50   ~ 0
GND
$Comp
L power:GND #PWR0101
U 1 1 668429D7
P 9325 5350
F 0 "#PWR0101" H 9325 5100 50  0001 C CNN
F 1 "GND" H 9330 5177 50  0000 C CNN
F 2 "" H 9325 5350 50  0001 C CNN
F 3 "" H 9325 5350 50  0001 C CNN
	1    9325 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9325 4650 9325 4775
Wire Wire Line
	9325 5075 9325 5275
Wire Wire Line
	9725 4750 9675 4750
Wire Wire Line
	9675 4750 9675 5275
Wire Wire Line
	9675 5275 9325 5275
Connection ~ 9325 5275
Wire Wire Line
	9325 5275 9325 5350
$Comp
L Device:R R9
U 1 1 66845B07
P 9500 4650
F 0 "R9" H 9570 4696 50  0000 L CNN
F 1 "330" H 9570 4605 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 9430 4650 50  0001 C CNN
F 3 "~" H 9500 4650 50  0001 C CNN
	1    9500 4650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9725 4650 9650 4650
Wire Wire Line
	9350 4650 9325 4650
$Comp
L Device:C C34
U 1 1 6684DE6D
P 10950 4675
F 0 "C34" H 11065 4721 50  0000 L CNN
F 1 "0.1uF" H 11065 4630 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10988 4525 50  0001 C CNN
F 3 "~" H 10950 4675 50  0001 C CNN
	1    10950 4675
	1    0    0    -1  
$EndComp
Text Label 10425 4650 0    50   ~ 0
SCL
Text Label 10425 4750 0    50   ~ 0
SDA
$Comp
L Device:R R11
U 1 1 6684FA8B
P 10625 4000
F 0 "R11" H 10695 4046 50  0000 L CNN
F 1 "0" H 10695 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10555 4000 50  0001 C CNN
F 3 "~" H 10625 4000 50  0001 C CNN
	1    10625 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 668505C7
P 10950 4000
F 0 "R12" H 11020 4046 50  0000 L CNN
F 1 "0" H 11020 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10880 4000 50  0001 C CNN
F 3 "~" H 10950 4000 50  0001 C CNN
	1    10950 4000
	1    0    0    -1  
$EndComp
Text Label 10625 3775 0    50   ~ 0
BAT3.3
Text Label 10950 3775 0    50   ~ 0
MPU3.3
Wire Wire Line
	10950 3775 10950 3850
Wire Wire Line
	10625 3775 10625 3850
Wire Wire Line
	10625 4450 10625 4150
Wire Wire Line
	10950 4150 10950 4450
Wire Wire Line
	10425 4450 10625 4450
Connection ~ 10625 4450
Wire Wire Line
	10625 4450 10950 4450
$Comp
L power:GND #PWR0102
U 1 1 6686038D
P 10950 4900
F 0 "#PWR0102" H 10950 4650 50  0001 C CNN
F 1 "GND" H 10955 4727 50  0000 C CNN
F 2 "" H 10950 4900 50  0001 C CNN
F 3 "" H 10950 4900 50  0001 C CNN
	1    10950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10950 4450 10950 4525
Connection ~ 10950 4450
Wire Wire Line
	10950 4825 10950 4900
Text Label 10425 4550 0    50   ~ 0
RTC_INT
$Comp
L Device:C C3
U 1 1 66865304
P 2275 1375
F 0 "C3" H 2390 1421 50  0000 L CNN
F 1 "10uF" H 2390 1330 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2313 1225 50  0001 C CNN
F 3 "~" H 2275 1375 50  0001 C CNN
	1    2275 1375
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 6687C8FA
P 800 1300
F 0 "J1" H 880 1292 50  0000 L CNN
F 1 "POW" H 880 1201 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" H 800 1300 50  0001 C CNN
F 3 "~" H 800 1300 50  0001 C CNN
	1    800  1300
	-1   0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 668827E2
P 2475 950
F 0 "L1" V 2665 950 50  0000 C CNN
F 1 "100uH" V 2574 950 50  0000 C CNN
F 2 "Inductor_SMD:L_Taiyo-Yuden_MD-5050" H 2475 950 50  0001 C CNN
F 3 "~" H 2475 950 50  0001 C CNN
	1    2475 950 
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 66886AFE
P 1775 1775
F 0 "#PWR0103" H 1775 1525 50  0001 C CNN
F 1 "GND" H 1780 1602 50  0000 C CNN
F 2 "" H 1775 1775 50  0001 C CNN
F 3 "" H 1775 1775 50  0001 C CNN
	1    1775 1775
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1400 1150 1400
Wire Wire Line
	1150 1400 1150 1725
Wire Wire Line
	1150 1725 1775 1725
Wire Wire Line
	1775 1725 1775 1775
Connection ~ 1775 1725
Wire Wire Line
	1000 1300 1150 1300
Wire Wire Line
	1150 1300 1150 950 
Wire Wire Line
	2275 950  2275 1225
Wire Wire Line
	2275 1725 2275 1525
$Comp
L Device:C C5
U 1 1 668AAAE3
P 4050 1275
F 0 "C5" H 4165 1321 50  0000 L CNN
F 1 "10uF" H 4165 1230 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4088 1125 50  0001 C CNN
F 3 "~" H 4050 1275 50  0001 C CNN
	1    4050 1275
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 668ACFAD
P 4450 1600
F 0 "#PWR0104" H 4450 1350 50  0001 C CNN
F 1 "GND" H 4455 1427 50  0000 C CNN
F 2 "" H 4450 1600 50  0001 C CNN
F 3 "" H 4450 1600 50  0001 C CNN
	1    4450 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1050 4600 1125
Wire Wire Line
	4450 1500 4600 1500
Wire Wire Line
	4600 1500 4600 1425
Connection ~ 4450 1500
Wire Wire Line
	4450 1500 4450 1600
Text Label 5800 850  0    50   ~ 0
BAT3.3
$Comp
L Device:C C10
U 1 1 668C9F69
P 6175 1200
F 0 "C10" H 5950 1250 50  0000 L CNN
F 1 "0.1uF" H 5950 1100 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6213 1050 50  0001 C CNN
F 3 "~" H 6175 1200 50  0001 C CNN
	1    6175 1200
	1    0    0    -1  
$EndComp
Text Label 6175 875  0    50   ~ 0
BAT3.3
$Comp
L power:GND #PWR0105
U 1 1 668CC4F9
P 6175 1500
F 0 "#PWR0105" H 6175 1250 50  0001 C CNN
F 1 "GND" H 6180 1327 50  0000 C CNN
F 2 "" H 6175 1500 50  0001 C CNN
F 3 "" H 6175 1500 50  0001 C CNN
	1    6175 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6175 875  6175 1025
Wire Wire Line
	6175 1350 6175 1425
Wire Wire Line
	6625 1025 6175 1025
Connection ~ 6175 1025
Wire Wire Line
	6175 1025 6175 1050
Wire Wire Line
	6625 1425 6175 1425
Connection ~ 6175 1425
Wire Wire Line
	6175 1425 6175 1500
$Comp
L Device:R R10
U 1 1 668D9C82
P 10275 4000
F 0 "R10" H 10345 4046 50  0000 L CNN
F 1 "100k" H 10345 3955 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10205 4000 50  0001 C CNN
F 3 "~" H 10275 4000 50  0001 C CNN
	1    10275 4000
	1    0    0    -1  
$EndComp
Text Label 10275 3775 0    50   ~ 0
BAT3.3
Text Label 10275 4250 0    50   ~ 0
RTC_INT
Wire Wire Line
	10275 3775 10275 3850
Wire Wire Line
	10275 4150 10275 4250
Text Label 6625 1225 2    50   ~ 0
RTC_INT
Text Label 7850 1125 0    50   ~ 0
SHDN
Text Label 7725 1325 0    50   ~ 0
GND
Text Label 7725 1025 0    50   ~ 0
GND
Wire Wire Line
	7725 1125 7850 1125
Text Label 6625 1325 2    50   ~ 0
PG
Text Label 1700 2325 0    50   ~ 0
GND
Text Label 1700 3425 0    50   ~ 0
GND
Text Label 1700 3525 0    50   ~ 0
GND
$Comp
L Device:R R3
U 1 1 669092C7
P 2250 2625
F 0 "R3" V 2150 2625 50  0000 C CNN
F 1 "5.1k" V 2250 2625 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 2625 50  0001 C CNN
F 3 "~" H 2250 2625 50  0001 C CNN
	1    2250 2625
	0    -1   -1   0   
$EndComp
$Comp
L Device:Fuse F1
U 1 1 66909EDD
P 2975 2425
F 0 "F1" V 2778 2425 50  0000 C CNN
F 1 "Fuse" V 2869 2425 50  0000 C CNN
F 2 "Fuse:Fuse_0603_1608Metric" V 2905 2425 50  0001 C CNN
F 3 "~" H 2975 2425 50  0001 C CNN
	1    2975 2425
	0    1    1    0   
$EndComp
$Comp
L Regulator_Linear:LD3985M33R_SOT23 U2
U 1 1 6690ABA3
P 3750 2525
F 0 "U2" H 3750 2867 50  0000 C CNN
F 1 "LD3985M33R_SOT23" H 3750 2776 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3750 2850 50  0001 C CIN
F 3 "http://www.st.com/internet/com/TECHNICAL_RESOURCES/TECHNICAL_LITERATURE/DATASHEET/CD00003395.pdf" H 3750 2525 50  0001 C CNN
	1    3750 2525
	1    0    0    -1  
$EndComp
Text Label 1900 2725 0    50   ~ 0
DM
Wire Wire Line
	1700 2725 1800 2725
Wire Wire Line
	1700 2925 1800 2925
Wire Wire Line
	1800 2925 1800 2725
Connection ~ 1800 2725
Wire Wire Line
	1800 2725 1900 2725
Text Label 1900 3025 0    50   ~ 0
DP
Wire Wire Line
	1700 3025 1850 3025
Wire Wire Line
	1700 2825 1850 2825
Wire Wire Line
	1850 2825 1850 3025
Connection ~ 1850 3025
Wire Wire Line
	1850 3025 1900 3025
NoConn ~ 1700 2525
NoConn ~ 1700 3125
$Comp
L Device:R R4
U 1 1 66936DDB
P 2250 3225
F 0 "R4" V 2150 3225 50  0000 C CNN
F 1 "5.1k" V 2250 3225 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2180 3225 50  0001 C CNN
F 3 "~" H 2250 3225 50  0001 C CNN
	1    2250 3225
	0    -1   -1   0   
$EndComp
Text Label 2500 2625 0    50   ~ 0
GND
Wire Wire Line
	1700 2625 2100 2625
Wire Wire Line
	2400 2625 2500 2625
Wire Wire Line
	1700 3225 2100 3225
Text Label 2500 3225 0    50   ~ 0
GND
Wire Wire Line
	2400 3225 2500 3225
Wire Wire Line
	1700 3325 2750 3325
Wire Wire Line
	2750 3325 2750 2425
Wire Wire Line
	2750 2425 1700 2425
$Comp
L Device:C C4
U 1 1 669598C5
P 3250 2725
F 0 "C4" H 3365 2771 50  0000 L CNN
F 1 "10uF" H 3365 2680 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3288 2575 50  0001 C CNN
F 3 "~" H 3250 2725 50  0001 C CNN
	1    3250 2725
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 6695ABE8
P 4250 2725
F 0 "C6" H 4025 2775 50  0000 L CNN
F 1 "0.01uF" H 3950 2625 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4288 2575 50  0001 C CNN
F 3 "~" H 4250 2725 50  0001 C CNN
	1    4250 2725
	1    0    0    -1  
$EndComp
$Comp
L Device:C C8
U 1 1 66960B24
P 4475 2725
F 0 "C8" H 4590 2771 50  0000 L CNN
F 1 "10uF" H 4590 2680 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4513 2575 50  0001 C CNN
F 3 "~" H 4475 2725 50  0001 C CNN
	1    4475 2725
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 66961FAA
P 3750 3100
F 0 "#PWR0106" H 3750 2850 50  0001 C CNN
F 1 "GND" H 3755 2927 50  0000 C CNN
F 2 "" H 3750 3100 50  0001 C CNN
F 3 "" H 3750 3100 50  0001 C CNN
	1    3750 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2825 2425 2750 2425
Connection ~ 2750 2425
Wire Wire Line
	3125 2425 3250 2425
Wire Wire Line
	3450 2525 3350 2525
Wire Wire Line
	3350 2525 3350 2425
Connection ~ 3350 2425
Wire Wire Line
	3350 2425 3450 2425
Wire Wire Line
	3250 2575 3250 2425
Connection ~ 3250 2425
Wire Wire Line
	3250 2425 3350 2425
Wire Wire Line
	3250 2875 3250 3050
Wire Wire Line
	3250 3050 3750 3050
Wire Wire Line
	3750 3050 3750 3000
Wire Wire Line
	3750 3050 3750 3100
Connection ~ 3750 3050
Wire Wire Line
	4050 2525 4250 2525
Wire Wire Line
	4250 2525 4250 2575
Wire Wire Line
	4050 2425 4475 2425
Wire Wire Line
	4475 2425 4475 2525
Wire Wire Line
	3750 3000 4250 3000
Wire Wire Line
	4250 3000 4250 2875
Connection ~ 3750 3000
Wire Wire Line
	3750 3000 3750 2825
Wire Wire Line
	4250 3000 4475 3000
Wire Wire Line
	4475 3000 4475 2875
Connection ~ 4250 3000
Connection ~ 4475 2425
Wire Wire Line
	4475 2425 4600 2425
Text Label 5700 2225 0    50   ~ 0
MPU3.3
Wire Wire Line
	5650 2225 5700 2225
$Comp
L joystick_SKRHAAE010:SKRHAAE010 U4
U 1 1 66A023EA
P 4950 3650
F 0 "U4" H 4950 4087 60  0000 C CNN
F 1 "SKRHAAE010" H 4950 3981 60  0000 C CNN
F 2 "Joystick:SKRHAAE010" H 4950 3650 60  0001 C CNN
F 3 "" H 4950 3650 60  0000 C CNN
	1    4950 3650
	1    0    0    -1  
$EndComp
$Comp
L Memory_Flash:W25Q32JVZP U5
U 1 1 66A08ED2
P 7800 4250
F 0 "U5" H 7525 4750 50  0000 C CNN
F 1 "W25Q16JVUX" H 7475 4625 50  0000 C CNN
F 2 "Package_SON:SON-8-1EP_3x2mm_P0.5mm_EP1.4x1.6mm" H 7800 4250 50  0001 C CNN
F 3 "http://www.winbond.com/resource-files/w25q32jv%20revg%2003272018%20plus.pdf" H 7800 4250 50  0001 C CNN
	1    7800 4250
	1    0    0    -1  
$EndComp
Text Label 5550 3650 0    50   ~ 0
GND
Text Label 7300 4150 2    50   ~ 0
QSPI_CS
Text Label 7300 4350 2    50   ~ 0
QSPI_CLK
Text Label 8300 4050 0    50   ~ 0
QSPI_SD0
Text Label 8300 4150 0    50   ~ 0
QSPI_SD1
Text Label 8300 4350 0    50   ~ 0
QSPI_SD2
Text Label 8300 4450 0    50   ~ 0
QSPI_SD3
$Comp
L Device:C C29
U 1 1 66A1FCEC
P 8800 4225
F 0 "C29" H 8915 4271 50  0000 L CNN
F 1 "0.1uF" H 8915 4180 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8838 4075 50  0001 C CNN
F 3 "~" H 8800 4225 50  0001 C CNN
	1    8800 4225
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0107
U 1 1 66A2085A
P 7800 4825
F 0 "#PWR0107" H 7800 4575 50  0001 C CNN
F 1 "GND" H 7805 4652 50  0000 C CNN
F 2 "" H 7800 4825 50  0001 C CNN
F 3 "" H 7800 4825 50  0001 C CNN
	1    7800 4825
	1    0    0    -1  
$EndComp
Text Label 7800 3750 0    50   ~ 0
MPU3.3
Wire Wire Line
	7800 3750 7800 3800
Wire Wire Line
	7800 3800 8800 3800
Wire Wire Line
	8800 3800 8800 4075
Connection ~ 7800 3800
Wire Wire Line
	7800 3800 7800 3850
Wire Wire Line
	8800 4375 8800 4725
Wire Wire Line
	8800 4725 7900 4725
Wire Wire Line
	7800 4725 7800 4650
Wire Wire Line
	7800 4725 7800 4825
Connection ~ 7800 4725
Wire Wire Line
	7900 4650 7900 4725
Connection ~ 7900 4725
Wire Wire Line
	7900 4725 7800 4725
Text Label 5200 4625 1    50   ~ 0
QSPI_CS
Text Label 4600 4625 1    50   ~ 0
QSPI_CLK
Text Label 5050 4625 1    50   ~ 0
QSPI_SD0
Text Label 4950 4625 1    50   ~ 0
QSPI_SD1
Text Label 4850 4625 1    50   ~ 0
QSPI_SD2
Text Label 4750 4625 1    50   ~ 0
QSPI_SD3
$Comp
L Device:Crystal_GND3 Y1
U 1 1 66A7CB53
P 7900 5750
F 0 "Y1" H 7900 6018 50  0000 C CNN
F 1 "Crystal_GND3" H 7900 5927 50  0000 C CNN
F 2 "FA238V:FA238V" H 7900 5750 50  0001 C CNN
F 3 "~" H 7900 5750 50  0001 C CNN
	1    7900 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C20
U 1 1 66A7D299
P 7475 6050
F 0 "C20" H 7590 6096 50  0000 L CNN
F 1 "8p" H 7590 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7513 5900 50  0001 C CNN
F 3 "~" H 7475 6050 50  0001 C CNN
	1    7475 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C24
U 1 1 66A7E497
P 8300 6050
F 0 "C24" H 8415 6096 50  0000 L CNN
F 1 "8p" H 8415 6005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8338 5900 50  0001 C CNN
F 3 "~" H 8300 6050 50  0001 C CNN
	1    8300 6050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 66A84EC1
P 7900 6300
F 0 "#PWR0108" H 7900 6050 50  0001 C CNN
F 1 "GND" H 7905 6127 50  0000 C CNN
F 2 "" H 7900 6300 50  0001 C CNN
F 3 "" H 7900 6300 50  0001 C CNN
	1    7900 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 6300 7900 6275
Wire Wire Line
	7900 6275 7475 6275
Wire Wire Line
	7475 6275 7475 6200
Wire Wire Line
	7900 6275 8300 6275
Wire Wire Line
	8300 6275 8300 6200
Connection ~ 7900 6275
Wire Wire Line
	8300 5900 8300 5750
Wire Wire Line
	8300 5750 8050 5750
Wire Wire Line
	7750 5750 7475 5750
Wire Wire Line
	7475 5750 7475 5900
Wire Wire Line
	7900 5950 7900 6275
$Comp
L Device:R R8
U 1 1 66AA95E1
P 8525 5750
F 0 "R8" V 8732 5750 50  0000 C CNN
F 1 "1k" V 8641 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8455 5750 50  0001 C CNN
F 3 "~" H 8525 5750 50  0001 C CNN
	1    8525 5750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8300 5750 8375 5750
Connection ~ 8300 5750
Wire Wire Line
	8675 5750 8800 5750
Text Label 8800 5750 0    50   ~ 0
XOUT
Text Label 7475 5750 0    50   ~ 0
XIN
Text Label 3850 4625 1    50   ~ 0
XIN
Text Label 3650 4625 1    50   ~ 0
XOUT
$Comp
L Switch:SW_Push SW1
U 1 1 66ABD07F
P 1275 4725
F 0 "SW1" H 1275 5010 50  0000 C CNN
F 1 "RST" H 1275 4919 50  0000 C CNN
F 2 "SMD_PUSHSWITCH:SKRPACE010" H 1275 4925 50  0001 C CNN
F 3 "~" H 1275 4925 50  0001 C CNN
	1    1275 4725
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 66ABEFD7
P 1275 5050
F 0 "C1" V 1023 5050 50  0000 C CNN
F 1 "0.1u" V 1114 5050 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1313 4900 50  0001 C CNN
F 3 "~" H 1275 5050 50  0001 C CNN
	1    1275 5050
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW2
U 1 1 66ACFA54
P 1275 5575
F 0 "SW2" H 1275 5860 50  0000 C CNN
F 1 "BOOT" H 1275 5769 50  0000 C CNN
F 2 "SMD_PUSHSWITCH:SKRPACE010" H 1275 5775 50  0001 C CNN
F 3 "~" H 1275 5775 50  0001 C CNN
	1    1275 5575
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 66ACFA5A
P 1275 5900
F 0 "C2" V 1023 5900 50  0000 C CNN
F 1 "0.1u" V 1114 5900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 1313 5750 50  0001 C CNN
F 3 "~" H 1275 5900 50  0001 C CNN
	1    1275 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R R1
U 1 1 66ADB518
P 850 5775
F 0 "R1" V 750 5775 50  0000 C CNN
F 1 "1k" V 850 5775 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 780 5775 50  0001 C CNN
F 3 "~" H 850 5775 50  0001 C CNN
	1    850  5775
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 66AE39D9
P 850 6150
F 0 "R2" V 750 6150 50  0000 C CNN
F 1 "10k" V 850 6150 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 780 6150 50  0001 C CNN
F 3 "~" H 850 6150 50  0001 C CNN
	1    850  6150
	0    -1   -1   0   
$EndComp
Text Label 600  5975 1    50   ~ 0
QSPI_CS
Text Label 3150 4625 1    50   ~ 0
RUN
Text Label 975  4900 2    50   ~ 0
RUN
Text Label 1600 4925 0    50   ~ 0
GND
Wire Wire Line
	1075 4725 1025 4725
Wire Wire Line
	1025 4725 1025 4900
Wire Wire Line
	1025 4900 975  4900
Wire Wire Line
	1025 4900 1025 5050
Wire Wire Line
	1025 5050 1125 5050
Connection ~ 1025 4900
Wire Wire Line
	1475 4725 1550 4725
Wire Wire Line
	1550 4725 1550 4925
Wire Wire Line
	1550 4925 1600 4925
Wire Wire Line
	1550 4925 1550 5050
Wire Wire Line
	1550 5050 1425 5050
Connection ~ 1550 4925
Text Label 1550 5775 0    50   ~ 0
GND
Text Label 1050 6150 0    50   ~ 0
MPU3.3
Wire Wire Line
	1475 5575 1525 5575
Wire Wire Line
	1525 5575 1525 5775
Wire Wire Line
	1525 5775 1550 5775
Wire Wire Line
	1525 5775 1525 5900
Wire Wire Line
	1525 5900 1425 5900
Connection ~ 1525 5775
Wire Wire Line
	1075 5575 1050 5575
Wire Wire Line
	1050 5575 1050 5775
Wire Wire Line
	1050 5900 1125 5900
Wire Wire Line
	1000 5775 1050 5775
Connection ~ 1050 5775
Wire Wire Line
	1050 5775 1050 5900
Wire Wire Line
	700  5775 650  5775
Wire Wire Line
	650  5775 650  5975
Wire Wire Line
	650  5975 600  5975
Wire Wire Line
	650  5975 650  6150
Wire Wire Line
	650  6150 700  6150
Connection ~ 650  5975
Wire Wire Line
	1000 6150 1050 6150
Text Label 1950 5875 2    50   ~ 0
GND
Text Label 1950 5375 2    50   ~ 0
GND
$Comp
L Device:R R6
U 1 1 66B72A8C
P 5550 7350
F 0 "R6" V 5450 7350 50  0000 C CNN
F 1 "27" V 5550 7350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5480 7350 50  0001 C CNN
F 3 "~" H 5550 7350 50  0001 C CNN
	1    5550 7350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 66B7560B
P 5650 7350
F 0 "R7" V 5550 7350 50  0000 C CNN
F 1 "27" V 5650 7350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5580 7350 50  0001 C CNN
F 3 "~" H 5650 7350 50  0001 C CNN
	1    5650 7350
	-1   0    0    1   
$EndComp
Text Label 5550 7575 3    50   ~ 0
DM
Text Label 5650 7575 3    50   ~ 0
DP
Wire Wire Line
	5550 7125 5550 7200
Wire Wire Line
	5550 7500 5550 7575
Wire Wire Line
	5650 7500 5650 7575
Wire Wire Line
	5650 7200 5650 7125
$Comp
L Device:C C17
U 1 1 66BB0EFA
P 6775 5025
F 0 "C17" H 6890 5071 50  0000 L CNN
F 1 "0.1u" H 6890 4980 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6813 4875 50  0001 C CNN
F 3 "~" H 6775 5025 50  0001 C CNN
	1    6775 5025
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 66BB1EBE
P 6425 5025
F 0 "C14" H 6540 5071 50  0000 L CNN
F 1 "0.1u" H 6540 4980 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6463 4875 50  0001 C CNN
F 3 "~" H 6425 5025 50  0001 C CNN
	1    6425 5025
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5175 6100 5175
Wire Wire Line
	6100 5175 6100 5075
Wire Wire Line
	6100 5075 5950 5075
Wire Wire Line
	6100 5075 6100 4800
Wire Wire Line
	6100 4800 6250 4800
Wire Wire Line
	6425 4800 6425 4875
Connection ~ 6100 5075
Wire Wire Line
	6425 4800 6775 4800
Connection ~ 6425 4800
Wire Wire Line
	6775 4800 6775 4875
Connection ~ 6775 4800
Wire Wire Line
	6775 5175 6775 5200
Wire Wire Line
	6775 5200 6425 5200
Wire Wire Line
	6425 5200 6425 5175
Connection ~ 6775 5200
$Comp
L power:+1V1 #PWR0109
U 1 1 66C26558
P 7150 4750
F 0 "#PWR0109" H 7150 4600 50  0001 C CNN
F 1 "+1V1" H 7165 4923 50  0000 C CNN
F 2 "" H 7150 4750 50  0001 C CNN
F 3 "" H 7150 4750 50  0001 C CNN
	1    7150 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 66C2655E
P 7150 5025
F 0 "C19" H 7265 5071 50  0000 L CNN
F 1 "2.2u" H 7265 4980 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7188 4875 50  0001 C CNN
F 3 "~" H 7150 5025 50  0001 C CNN
	1    7150 5025
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 66C26564
P 7150 5225
F 0 "#PWR0110" H 7150 4975 50  0001 C CNN
F 1 "GND" H 7155 5052 50  0000 C CNN
F 2 "" H 7150 5225 50  0001 C CNN
F 3 "" H 7150 5225 50  0001 C CNN
	1    7150 5225
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 5175 7150 5200
Connection ~ 7150 5200
Wire Wire Line
	7150 5200 7150 5225
Wire Wire Line
	6775 5200 7150 5200
Wire Wire Line
	7150 4750 7150 4800
Wire Wire Line
	6775 4800 7150 4800
Connection ~ 7150 4800
Wire Wire Line
	7150 4800 7150 4875
Wire Wire Line
	5950 5375 6250 5375
Wire Wire Line
	6250 5375 6250 4800
Connection ~ 6250 4800
Wire Wire Line
	6250 4800 6425 4800
$Comp
L Device:C C12
U 1 1 66CA06D4
P 6250 5700
F 0 "C12" H 6365 5746 50  0000 L CNN
F 1 "0.1u" H 6365 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6288 5550 50  0001 C CNN
F 3 "~" H 6250 5700 50  0001 C CNN
	1    6250 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 66CA1C28
P 6600 5700
F 0 "C15" H 6715 5746 50  0000 L CNN
F 1 "0.1u" H 6715 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6638 5550 50  0001 C CNN
F 3 "~" H 6600 5700 50  0001 C CNN
	1    6600 5700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C18
U 1 1 66CCF86D
P 6975 5700
F 0 "C18" H 7090 5746 50  0000 L CNN
F 1 "0.1u" H 7090 5655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7013 5550 50  0001 C CNN
F 3 "~" H 6975 5700 50  0001 C CNN
	1    6975 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 66CF2CB6
P 6975 5900
F 0 "#PWR0111" H 6975 5650 50  0001 C CNN
F 1 "GND" H 6980 5727 50  0000 C CNN
F 2 "" H 6975 5900 50  0001 C CNN
F 3 "" H 6975 5900 50  0001 C CNN
	1    6975 5900
	1    0    0    -1  
$EndComp
Text Label 6975 5525 0    50   ~ 0
MPU3.3
Wire Wire Line
	5950 5525 6250 5525
Wire Wire Line
	6975 5525 6975 5550
Wire Wire Line
	6600 5550 6600 5525
Connection ~ 6600 5525
Wire Wire Line
	6600 5525 6975 5525
Wire Wire Line
	6250 5550 6250 5525
Connection ~ 6250 5525
Wire Wire Line
	6250 5525 6600 5525
Wire Wire Line
	6250 5850 6250 5875
Wire Wire Line
	6250 5875 6600 5875
Wire Wire Line
	6975 5875 6975 5900
Wire Wire Line
	6975 5875 6975 5850
Connection ~ 6975 5875
Wire Wire Line
	6600 5850 6600 5875
Connection ~ 6600 5875
Wire Wire Line
	6600 5875 6975 5875
$Comp
L Device:C C11
U 1 1 66D7C9D5
P 6000 6800
F 0 "C11" H 6115 6846 50  0000 L CNN
F 1 "0.1u" H 6115 6755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6038 6650 50  0001 C CNN
F 3 "~" H 6000 6800 50  0001 C CNN
	1    6000 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C13
U 1 1 66D7C9DB
P 6350 6800
F 0 "C13" H 6465 6846 50  0000 L CNN
F 1 "0.1u" H 6465 6755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 6388 6650 50  0001 C CNN
F 3 "~" H 6350 6800 50  0001 C CNN
	1    6350 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 66D7C9E7
P 6725 7000
F 0 "#PWR0112" H 6725 6750 50  0001 C CNN
F 1 "GND" H 6730 6827 50  0000 C CNN
F 2 "" H 6725 7000 50  0001 C CNN
F 3 "" H 6725 7000 50  0001 C CNN
	1    6725 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 6950 6000 6975
Wire Wire Line
	6000 6975 6350 6975
Wire Wire Line
	6725 6975 6725 7000
Wire Wire Line
	6350 6950 6350 6975
Connection ~ 6350 6975
Wire Wire Line
	6350 6975 6725 6975
Wire Wire Line
	5950 5725 6100 5725
Wire Wire Line
	6100 5725 6100 5825
Wire Wire Line
	6100 6525 6000 6525
Wire Wire Line
	5950 6375 6100 6375
Connection ~ 6100 6375
Wire Wire Line
	6100 6375 6100 6525
Wire Wire Line
	5950 6225 6100 6225
Connection ~ 6100 6225
Wire Wire Line
	6100 6225 6100 6375
Wire Wire Line
	5950 6125 6100 6125
Connection ~ 6100 6125
Wire Wire Line
	6100 6125 6100 6225
Wire Wire Line
	5950 6025 6100 6025
Connection ~ 6100 6025
Wire Wire Line
	6100 6025 6100 6125
Wire Wire Line
	5950 5925 6100 5925
Connection ~ 6100 5925
Wire Wire Line
	6100 5925 6100 6025
Wire Wire Line
	5950 5825 6100 5825
Connection ~ 6100 5825
Wire Wire Line
	6100 5825 6100 5925
Wire Wire Line
	6100 6525 6350 6525
Connection ~ 6100 6525
Wire Wire Line
	6350 6650 6350 6525
Connection ~ 6350 6525
Wire Wire Line
	6350 6525 6725 6525
Wire Wire Line
	6000 6650 6000 6525
Connection ~ 6000 6525
Wire Wire Line
	6000 6525 5950 6525
Text Label 6725 6525 0    50   ~ 0
MPU3.3
NoConn ~ 2600 4625
NoConn ~ 2700 4625
Text Label 3350 7125 3    50   ~ 0
LCD_MOSI
Text Label 3450 7125 3    50   ~ 0
LCD_CLK
Text Label 3150 7125 3    50   ~ 0
LCD_RSTB
Text Label 3250 7125 3    50   ~ 0
LCD_A0
Text Label 3550 7125 3    50   ~ 0
LCD_CSB
Text Label 4750 7125 3    50   ~ 0
SCL
Text Label 4850 7125 3    50   ~ 0
SDA
Text Label 4350 3650 2    50   ~ 0
RTC_INT
Text Label 4350 3500 2    50   ~ 0
SW_UP
Text Label 4350 3800 2    50   ~ 0
SW_LEFT
Text Label 5550 3500 0    50   ~ 0
SW_RIGHT
Text Label 5550 3800 0    50   ~ 0
SW_DOWN
Text Label 4150 7125 3    50   ~ 0
SW_UP
Text Label 3950 7125 3    50   ~ 0
SW_LEFT
Text Label 4250 7125 3    50   ~ 0
RTC_INT
Text Label 3850 7125 3    50   ~ 0
SW_RIGHT
Text Label 4050 7125 3    50   ~ 0
SW_DOWN
Text Label 1875 950  0    50   ~ 0
BAT
Text Label 2550 7575 0    50   ~ 0
BAT
$Comp
L Device:R R5
U 1 1 66FBD656
P 2550 7325
F 0 "R5" V 2450 7325 50  0000 C CNN
F 1 "10k" V 2550 7325 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2480 7325 50  0001 C CNN
F 3 "~" H 2550 7325 50  0001 C CNN
	1    2550 7325
	-1   0    0    1   
$EndComp
Wire Wire Line
	2550 7475 2550 7575
Wire Wire Line
	2550 7125 2550 7175
$Comp
L Connector_Generic:Conn_01x03 U1
U 1 1 67081682
P 3350 750
F 0 "U1" V 3475 900 50  0000 L CNN
F 1 "HT7733A/XC9111A331" V 3475 -150 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3350 750 50  0001 C CNN
F 3 "~" H 3350 750 50  0001 C CNN
	1    3350 750 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3450 950  3450 1050
Wire Wire Line
	3450 1050 3875 1050
Text Label 3250 950  3    50   ~ 0
GND
Wire Wire Line
	3000 950  3000 1375
Wire Wire Line
	3000 1375 3350 1375
Wire Wire Line
	2625 950  3000 950 
Wire Wire Line
	3350 950  3350 1375
Connection ~ 3350 1375
Wire Wire Line
	3875 1375 3875 1050
Connection ~ 3875 1050
Wire Wire Line
	3875 1050 4050 1050
$Comp
L Device:D_Schottky D1
U 1 1 67199129
P 3625 1375
F 0 "D1" H 3625 1159 50  0000 C CNN
F 1 "D_Schottky" H 3625 1250 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" H 3625 1375 50  0001 C CNN
F 3 "~" H 3625 1375 50  0001 C CNN
	1    3625 1375
	-1   0    0    1   
$EndComp
Wire Wire Line
	3775 1375 3875 1375
Wire Wire Line
	3350 1375 3475 1375
$Comp
L Device:CP C9
U 1 1 67219B0F
P 4600 1275
F 0 "C9" H 4718 1321 50  0000 L CNN
F 1 "10u" H 4718 1230 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_6.3x3" H 4638 1125 50  0001 C CNN
F 3 "~" H 4600 1275 50  0001 C CNN
	1    4600 1275
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1125 4050 1050
Connection ~ 4050 1050
Wire Wire Line
	4050 1425 4050 1500
Wire Wire Line
	4050 1500 4450 1500
Connection ~ 2275 950 
Wire Wire Line
	2275 950  2325 950 
Wire Wire Line
	1775 1725 2275 1725
Text Label 3650 7125 3    50   ~ 0
SHDN
Text Label 3750 7125 3    50   ~ 0
PG
NoConn ~ 5250 7125
NoConn ~ 5150 7125
NoConn ~ 5050 7125
NoConn ~ 4950 7125
NoConn ~ 4650 7125
NoConn ~ 4550 7125
NoConn ~ 4450 7125
NoConn ~ 4350 7125
NoConn ~ 2250 7125
NoConn ~ 2350 7125
NoConn ~ 2450 7125
NoConn ~ 2750 7125
NoConn ~ 2850 7125
NoConn ~ 2950 7125
NoConn ~ 3050 7125
Wire Wire Line
	4050 1050 4600 1050
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 66892882
P 10325 6050
F 0 "J4" H 10405 6042 50  0000 L CNN
F 1 "Grove" H 10405 5951 50  0000 L CNN
F 2 "GroveCon:GROVE" H 10325 6050 50  0001 C CNN
F 3 "~" H 10325 6050 50  0001 C CNN
	1    10325 6050
	1    0    0    -1  
$EndComp
Text Label 10125 5950 2    50   ~ 0
SCL
Text Label 10125 6050 2    50   ~ 0
SDA
Text Label 10125 6150 2    50   ~ 0
MPU3.3
Text Label 10125 6250 2    50   ~ 0
GND
$Comp
L LDSW_SiP32431:LDSW_SiP32431 U7
U 1 1 6696CE16
P 5450 2175
F 0 "U7" H 5775 2350 50  0000 C CNN
F 1 "LDSW_SiP32431" H 5775 2259 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5450 2175 118 0001 C CNN
F 3 "" H 5450 2175 118 0000 C CNN
	1    5450 2175
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4475 2525 5825 2525
Wire Wire Line
	5825 2525 5825 2425
Wire Wire Line
	5825 2425 5650 2425
Connection ~ 4475 2525
Wire Wire Line
	4475 2525 4475 2575
Text Label 5650 2325 0    50   ~ 0
GND
Text Label 4600 2325 2    50   ~ 0
GND
Text Notes 10975 4200 0    50   ~ 0
NM
Text Label 7850 1225 0    50   ~ 0
MPU3.3
Text Label 5750 950  0    50   ~ 0
GND
Wire Wire Line
	5850 1050 5750 1050
Text Label 4700 950  2    50   ~ 0
GND
$Comp
L LDSW_SiP32431:LDSW_SiP32431 U8
U 1 1 66BD72B5
P 5550 800
F 0 "U8" H 5875 975 50  0000 C CNN
F 1 "LDSW_SiP32431" H 5875 884 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5550 800 118 0001 C CNN
F 3 "" H 5550 800 118 0000 C CNN
	1    5550 800 
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5750 850  5800 850 
Wire Wire Line
	7725 1225 7850 1225
Wire Wire Line
	4600 1050 4675 1050
Connection ~ 4600 1050
Wire Wire Line
	4675 1050 4675 1150
Wire Wire Line
	4675 1150 5850 1150
Wire Wire Line
	5850 1150 5850 1050
Connection ~ 4675 1050
Wire Wire Line
	4675 1050 4700 1050
Text Label 6550 1775 0    50   ~ 0
BAT3.3
Text Label 7225 1775 0    50   ~ 0
VDDI
Wire Wire Line
	6550 1775 7225 1775
Text Label 7375 2000 0    50   ~ 0
LCD_RSTB
$Comp
L Device:R R13
U 1 1 6696A15E
P 7025 2000
F 0 "R13" V 6925 2000 50  0000 C CNN
F 1 "10k" V 7025 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6955 2000 50  0001 C CNN
F 3 "~" H 7025 2000 50  0001 C CNN
	1    7025 2000
	0    -1   -1   0   
$EndComp
Text Label 6550 2000 0    50   ~ 0
BAT3.3
Wire Wire Line
	7175 2000 7300 2000
Wire Wire Line
	6875 2000 6550 2000
$Comp
L Device:C C7
U 1 1 66A6B863
P 7300 2225
F 0 "C7" H 7415 2271 50  0000 L CNN
F 1 "0.1uF" H 7415 2180 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 7338 2075 50  0001 C CNN
F 3 "~" H 7300 2225 50  0001 C CNN
	1    7300 2225
	1    0    0    -1  
$EndComp
Text Label 7300 2425 0    50   ~ 0
GND
Wire Wire Line
	7300 2375 7300 2425
Wire Wire Line
	7300 2075 7300 2000
Connection ~ 7300 2000
Wire Wire Line
	7300 2000 7375 2000
Text Notes 2700 7425 0    50   ~ 0
NM
Wire Wire Line
	1150 950  2275 950 
$Comp
L Device:R R14
U 1 1 669A5E16
P 7025 2800
F 0 "R14" V 6925 2800 50  0000 C CNN
F 1 "0" V 7025 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6955 2800 50  0001 C CNN
F 3 "~" H 7025 2800 50  0001 C CNN
	1    7025 2800
	0    -1   -1   0   
$EndComp
Text Notes 7125 3000 0    50   ~ 0
NM
Text Label 7275 2800 0    50   ~ 0
PG
Text Label 6775 2800 2    50   ~ 0
RUN
Wire Wire Line
	6775 2800 6875 2800
Wire Wire Line
	7175 2800 7275 2800
$Comp
L Device:R R15
U 1 1 66CA5B48
P 10125 1625
F 0 "R15" V 10150 1450 50  0000 C CNN
F 1 "1k" V 10125 1625 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10055 1625 50  0001 C CNN
F 3 "~" H 10125 1625 50  0001 C CNN
	1    10125 1625
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R16
U 1 1 66CD487F
P 10125 1725
F 0 "R16" V 10150 1550 50  0000 C CNN
F 1 "1k" V 10125 1725 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10055 1725 50  0001 C CNN
F 3 "~" H 10125 1725 50  0001 C CNN
	1    10125 1725
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R17
U 1 1 66D1666B
P 10125 1825
F 0 "R17" V 10150 1650 50  0000 C CNN
F 1 "1k" V 10125 1825 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10055 1825 50  0001 C CNN
F 3 "~" H 10125 1825 50  0001 C CNN
	1    10125 1825
	0    -1   -1   0   
$EndComp
Text Label 9975 1925 2    50   ~ 0
LCD_CLK
$Comp
L Device:R R18
U 1 1 66D81B1E
P 10125 1925
F 0 "R18" V 10150 1750 50  0000 C CNN
F 1 "1k" V 10125 1925 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10055 1925 50  0001 C CNN
F 3 "~" H 10125 1925 50  0001 C CNN
	1    10125 1925
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R19
U 1 1 66D98DBB
P 10125 2025
F 0 "R19" V 10150 1850 50  0000 C CNN
F 1 "1k" V 10125 2025 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 10055 2025 50  0001 C CNN
F 3 "~" H 10125 2025 50  0001 C CNN
	1    10125 2025
	0    -1   -1   0   
$EndComp
Text Notes 1350 6025 0    50   ~ 0
NM
$EndSCHEMATC
