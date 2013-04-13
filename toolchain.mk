

TOOLCHAIN_GCC := $(TOOLCHAIN)gcc
TOOLCHAIN_LD  := $(TOOLCHAIN)ld
TOOLCHAIN_AR  := $(TOOLCHAIN)ar

define toolchain
$1: CC := $(TOOLCHAIN)gcc
$1: LD := $(TOOLCHAIN)ld
$1: AR := $(TOOLCHAIN)ar
endef
