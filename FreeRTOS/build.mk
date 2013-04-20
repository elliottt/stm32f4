
FREERTOS_INCLUDES := -I$(FREERTOS_PREFIX)/FreeRTOS/Source/include \
                     -I$(FREERTOS_PREFIX)/FreeRTOS/Source/portable/GCC/ARM_CM4F

FreeRTOS_SOURCES := $(addprefix $(FREERTOS_PREFIX)/FreeRTOS/Source/,\
  list.c                                     \
  croutine.c                                 \
  queue.c                                    \
  tasks.c                                    \
  timers.c                                   \
  portable/GCC/ARM_CM4F/port.c               \
  portable/MemMang/heap_1.c)

FreeRTOS_OBJECTS := \
  $(patsubst $(FREERTOS_PREFIX)/FreeRTOS/Source/%.c,FreeRTOS/build/%.o,$(FreeRTOS_SOURCES))

$(FreeRTOS_OBJECTS): FreeRTOS/build/%.o: $(FREERTOS_PREFIX)/FreeRTOS/Source/%.c
	$(call cmd,cc_o_c)

FreeRTOS_local_SOURCES := $(addprefix FreeRTOS/support/,\
  default_hooks.c                                       \
  default_handlers.c                                    \
  syscalls.c)

FreeRTOS_local_OBJECTS := $(patsubst FreeRTOS/support/%.c,FreeRTOS/build/%.o,$(FreeRTOS_local_SOURCES))

libFreeRTOS.a_OBJECTS := $(FreeRTOS_local_OBJECTS) $(FreeRTOS_OBJECTS)

$(FreeRTOS_local_OBJECTS): FreeRTOS/build/%.o: FreeRTOS/support/%.c
	$(call cmd,cc_o_c)

FreeRTOS/build/libFreeRTOS.a: OBJECTS := $(libFreeRTOS.a_OBJECTS)
FreeRTOS/build/libFreeRTOS.a: CFLAGS  += -I$(FREERTOS_INCLUDES)
FreeRTOS/build/libFreeRTOS.a: $(libFreeRTOS.a_OBJECTS)
FreeRTOS/build/libFreeRTOS.a: | FreeRTOS/build/portable/GCC/ARM_CM4F \
                                FreeRTOS/build/portable/MemMang
	$(call cmd,ar)

FreeRTOS/build/portable/GCC/ARM_CM4F: | FreeRTOS/build/portable/GCC
	$(call cmd,mkdir)

FreeRTOS/build/portable/GCC FreeRTOS/build/portable/MemMang: | FreeRTOS/build/portable
	$(call cmd,mkdir)

FreeRTOS/build/portable: | FreeRTOS/build
	$(call cmd,mkdir)

FreeRTOS/build:
	$(call cmd,mkdir)

clean::
	$(RM) -r FreeRTOS/build
