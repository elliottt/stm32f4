
libstm32f4.a_SOURCES := $(addprefix stm32f4/src/,\
	eeprom.c \
	fault.c \
	gpio.c \
	i2c.c \
	interrupt.c \
	led.c \
	rcc.c \
	spi.c \
	timer.c \
	usart.c \
	usb_cdc.c)

libstm32f4.a_OBJECTS := $(patsubst stm32f4/src/%.c,stm32f4/build/%.o,$(libstm32f4.a_SOURCES))

$(eval $(call toolchain,stm32f4/build/libstm32f4.a))
stm32f4/build/libstm32f4.a: CFLAGS  += -Istm32f4/include
stm32f4/build/libstm32f4.a: OBJECTS := $(libstm32f4.a_OBJECTS)
stm32f4/build/libstm32f4.a: $(libstm32f4.a_OBJECTS)
stm32f4/build/libstm32f4.a: | stm32f4/build
	ar rcs $@ $(OBJECTS)

$(libstm32f4.a_OBJECTS): stm32f4/build/%.o: stm32f4/src/%.c
	$(CC) -o $@ $(CFLAGS) -c $<

all: stm32f4/build/libstm32f4.a

stm32f4/build:
	mkdir -p $@
