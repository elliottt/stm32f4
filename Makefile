
.PHONY: all
all:

.PHONY: clean
clean::

CFLAGS := -Iinclude

include config.mk
include arch/cortex-m4.mk
include board/stm32f4.mk

CFLAGS += -Iinclude

include toolchain.mk
include stm32f4/build.mk
include stm32f4/usb/build.mk
include FreeRTOS/build.mk
