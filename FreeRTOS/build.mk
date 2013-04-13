


libFreeRTOS.a_SOURCES := $(addprefix $(FREERTOS_PREFIX)/,\
  src/list.c                                     \
  src/croutine.c                                 \
  src/queue.c                                    \
  src/tasks.c                                    \
  src/timers.c                                   \
  src/portable/GCC/ARM_CM4F/port.c               \
  src/portable/MemMang/heap_1.c                  \
  support/default_hooks.c                        \
  support/default_handlers.c                     \
  support/syscalls.c)

libFreeRTOS.a_OBJECTS := $(libFreeRTOS.a:.c=.o)

FreeRTOS/build/libFreeRTOS.a: OBJECTS := $(libFreeRTOS.a_OBJECTS)
FreeRTOS/build/libFreeRTOS.a: CFLAGS  += -I$(FREERTOS_PREFIX)/FreeRTOS/Source/include
FreeRTOS/build/libFreeRTOS.a: | FreeRTOS/build
	ar rcs -o $@ $(OBJECTS)

$(libFreeRTOS.a_OBJECTS): FreeRTOS/build/%.o: FreeRTOS/src/%.c

FreeRTOS/build:
	mkdir $@

clean::
	$(RM) -r FreeRTOS/build
