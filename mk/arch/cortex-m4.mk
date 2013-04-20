
CC       := $(TOOLCHAIN)gcc
CXX      := $(TOOLCHAIN)g++
LD       := $(TOOLCHAIN)ld
AR       := $(TOOLCHAIN)ar
RANLIB   := $(TOOLCHAIN)ranlib
OBJCOPY  := $(TOOLCHAIN)objcopy

BASE_CFLAGS := -g -Wall -mlittle-endian -mthumb -mcpu=cortex-m4 \
               -mfloat-abi=hard -mfpu=fpv4-sp-d16

CFLAGS   += $(BASE_CFLAGS) -std=gnu99
CXXFLAGS += $(BASE_CFLAGS) -fno-exceptions -fno-rtti
LDSCRIPT += stm32f4/support/stm32_flash.ld
LDFLAGS  += -mlittle-endian -mcpu=cortex-m4 -mthumb -mfloat-abi=hard \
            -mfpu=fpv4-sp-d16 -Wl,--script=$(LDSCRIPT)

STARTUP_OBJECTS := source/startup_stm32f4xx.o \
                   source/system_stm32f4xx.o
