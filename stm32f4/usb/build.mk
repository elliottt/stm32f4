
libstm32_usb.a_SOURCES := $(addprefix stm32f4/usb/src/,\
	usb_bsp.c                               \
	usb_core.c                              \
	usb_dcd.c                               \
	usb_dcd_int.c                           \
	usbd_cdc_core.c                         \
	usbd_cdc_vcp.c                          \
	usbd_core.c                             \
	usbd_desc.c                             \
	usbd_ioreq.c                            \
	usbd_req.c                              \
	usbd_usr.c)

libstm32_usb.a_OBJECTS := $(patsubst stm32f4/usb/src/%.c,stm32f4/usb/build/%.o,$(libstm32_usb.a_SOURCES))

stm32f4/usb/build/%.o: stm32f4/usb/src/%.c
	$(CC) -o $@ $(CFLAGS) -c $<

$(eval $(call toolchain,stm32f4/usb/build/libstm32_usb.a))
stm32f4/usb/build/libstm32_usb.a: OBJECTS := $(libstm32_usb.a_OBJECTS)
stm32f4/usb/build/libstm32_usb.a: CFLAGS  += -Iinclude \
                                             -Istm32f4/include \
                                             -Istm32f4/usb/include/usb
stm32f4/usb/build/libstm32_usb.a: $(libstm32_usb.a_OBJECTS)
stm32f4/usb/build/libstm32_usb.a: | stm32f4/usb/build
	$(AR) rcs $@ $(OBJECTS)

stm32f4/usb/build:
	mkdir -p $@

clean::
	$(RM) -r stm32f4/usb/build
