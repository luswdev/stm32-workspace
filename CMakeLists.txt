cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_COMPILER    "/opt/gcc-arm-none-eabi-x86_64-linux/bin/arm-none-eabi-gcc")
set(CMAKE_CXX_COMPILER  "/opt/gcc-arm-none-eabi-x86_64-linux/bin/arm-none-eabi-g++")
set(CMAKE_ASM_COMPILER  "/opt/gcc-arm-none-eabi-x86_64-linux/bin/arm-none-eabi-g++")

set(CMAKE_C_FLAGS
    "-Wall -fno-common -O0 -g -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 --specs=nosys.specs"
)
set(CMAKE_CXX_FLAGS
    "-Wall -fno-common -O0 -g -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 --specs=nosys.specs"
)
set(CMAKE_ASM_FLAGS
    "-Wall -fno-common -O0 -g -mthumb -mcpu=cortex-m4 -mfloat-abi=hard -mfpu=fpv4-sp-d16 --specs=nosys.specs"
)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${CMAKE_CURRENT_LIST_DIR}/libs/linker/STM32F429ZI_FLASH.ld")

enable_language(ASM)

project(stm32-framework)

aux_source_directory(${CMAKE_CURRENT_LIST_DIR}/app/src app)
aux_source_directory(${CMAKE_CURRENT_LIST_DIR}/libs/CMSIS/src CMSIS)
aux_source_directory(${CMAKE_CURRENT_LIST_DIR}/libs/STM32/src STM32)

add_library(startup OBJECT ${CMAKE_CURRENT_LIST_DIR}/libs/startup/startup.s)

include_directories(
    ${CMAKE_CURRENT_LIST_DIR}/app/inc
    ${CMAKE_CURRENT_LIST_DIR}/libs/CMSIS/inc
    ${CMAKE_CURRENT_LIST_DIR}/libs/STM32/inc
)

add_executable(
    ${PROJECT_NAME}.elf
    ${app}
    ${CMSIS}
    ${STM32}
)

target_link_libraries(
    ${PROJECT_NAME}.elf
)

add_custom_command(
    TARGET ${PROJECT_NAME}.elf
    POST_BUILD
    COMMAND ${CMAKE_OBJCOPY} ARGS -Obinary ${PROJECT_NAME}.elf ${PROJECT_NAME}.bin
)
