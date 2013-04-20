
.PHONY: all
all:

.PHONY: clean
clean::

CFLAGS := -Iinclude

include config.mk
include mk/arch/cortex-m4.mk
include mk/board/stm32f4.mk
include mk/toolchain.mk
include mk/command.mk
include source/build.mk
include FreeRTOS/build.mk
include stm32f4/build.mk
include stm32f4/usb/build.mk
include stm32f4/tests/ledtest/build.mk
