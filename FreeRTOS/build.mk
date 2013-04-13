
FreeRTOS_SOURCES := $(addprefix $(FREERTOS_PREFIX)/FreeRTOS/Source/,\
  list.c                                     \
  croutine.c                                 \
  queue.c                                    \
  tasks.c                                    \
  timers.c                                   \
  portable/GCC/ARM_CM4F/port.c               \
  portable/MemMang/heap_1.c)

FreeRTOS_OBJECTS := $(patsubst %.c,%.o,$(FreeRTOS_SOURCES))

$(FreeRTOS_OBJECTS): %.o: %.c
	$(CC) -o $@ $(CFLAGS) -c $<

FreeRTOS_local_SOURCES := $(addprefix FreeRTOS/support/,\
  FreeRTOS/support/default_hooks.c           \
  FreeRTOS/support/default_handlers.c        \
  FreeRTOS/support/syscalls.c)

FreeRTOS_local_OBJECTS := $(patsubst FreeRTOS/support/%.c,FreeRTOS/build/%.o,$(libFreeRTOS.a_SOURCES))

libFreeRTOS.a_OBJECTS := $(FreeRTOS_local_OBJECTS) $(FreeRTOS_OBJECTS)

$(FreeRTOS_local_OBJECTS): FreeRTOS/build/%.o: FreeRTOS/support/%.c
	$(CC) -o $@ $(CFLAGS) -c $<

FreeRTOS/build/libFreeRTOS.a: OBJECTS := $(libFreeRTOS.a_OBJECTS)
FreeRTOS/build/libFreeRTOS.a: CFLAGS  += -I$(FREERTOS_PREFIX)/FreeRTOS/Source/include
FreeRTOS/build/libFreeRTOS.a: $(libFreeRTOS.a_OBJECTS)
FreeRTOS/build/libFreeRTOS.a: | FreeRTOS/build
	ar rcs -o $@ $(OBJECTS)

FreeRTOS/build:
	mkdir $@

clean::
	$(RM) -r FreeRTOS/build
