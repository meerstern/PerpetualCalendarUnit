# Generated Cmake Pico project file

cmake_minimum_required(VERSION 3.13)
set(CMAKE_BUILD_TYPE "Debug")
set(OPTIMIZATION_FLAG 1)
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialise pico_sdk from installed location
# (note this can come from environment, CMake cache etc)
#set(PICO_SDK_PATH "/mnt/d/31_WS/Pico/pico-sdk")
set(PICO_SDK_PATH "/home/mond/pico-sdk")

# Pull in Raspberry Pi Pico SDK (must be before project)
include(pico_sdk_import.cmake)

project(LcdCalendar C CXX ASM)

# Initialise the Raspberry Pi Pico SDK
pico_sdk_init()

# Add executable. Default name is the project name, version 0.1

add_executable(LcdCalendar )

target_sources(LcdCalendar PUBLIC
                ${CMAKE_CURRENT_LIST_DIR}/LcdCalendar.c 
                ${CMAKE_CURRENT_LIST_DIR}/calendar.c
                ${CMAKE_CURRENT_LIST_DIR}/LcdSt7302.c
		${CMAKE_CURRENT_LIST_DIR}/soft_spi.c
		${CMAKE_CURRENT_LIST_DIR}/rtc_sd30XX.c
                ${CMAKE_CURRENT_LIST_DIR}/ugui.c
        )

pico_set_program_name(LcdCalendar "LcdCalendar")
pico_set_program_version(LcdCalendar "0.1")

pico_enable_stdio_uart(LcdCalendar 0)
pico_enable_stdio_usb(LcdCalendar 1)

# Add the standard library to the build
target_link_libraries(LcdCalendar pico_stdlib)

# Add any user requested libraries
target_link_libraries(LcdCalendar
        hardware_spi
        hardware_i2c
        hardware_timer
        hardware_watchdog
        )
target_link_options(LcdCalendar PRIVATE "LINKER:--print-memory-usage")
pico_add_extra_outputs(LcdCalendar)

