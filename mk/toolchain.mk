
define toolchain
$1: CC      := $(TOOLCHAIN)gcc
$1: LD      := $(TOOLCHAIN)ld
$1: AR      := $(TOOLCHAIN)ar
$1: OBJCOPY := $(TOOLCHAIN)objcopy
endef
