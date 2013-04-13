
libusb.a_SOURCES := $(addprefix stm32f4/usb/src,\
	usb_bsp.c                               \
	usb_core.c                              \
	usb_dcd.c                               \
	usbd_cdc_core.c                         \
	usbd_cdc_if_template.c                  \
	usbd_cdc_vcp.c                          \
	usb_dcd_int.c                           \
	usbd_core.c                             \
	usbd_desc.c                             \
	usbd_ioreq.c                            \
	usbd_req.c                              \
	usbd_usr.c                              \
	usb_hcd.c                               \
	usb_hcd_int.c                           \
	usb_otg.c)

libusb.a_OBJECTS := $(patsubst stm32f4/usb/src/%.c,stm32f4/usb/build/%.o,$(libusb.a_SOURCES))

$(eval $(call toolchain,stm32f4/usb/build/libusb.a))
stm32f4/usb/build/libusb.a: OBJECTS := $(libusb.a_OBJECTS)
stm32f4/usb/build/libusb.a: | stm32f4/usb/build
	$(AR) rcs $@ $(OBJECTS)

stm32f4/usb/build:
	mkdir -p $@
