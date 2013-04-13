
all:

include config.mk
include toolchain.mk
include stm32f4/build.mk
include FreeRTOS/build.mk
