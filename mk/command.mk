
ifneq "$(V)" "1"
Q     := @
quiet := quiet_
else
Q     :=
quiet :=
endif


echo-cmd = $(if $($(quiet)cmd_$1),echo '  $($(quiet)cmd_$1)';)
cmd      = @$(call echo-cmd,$1) $(cmd_$1)


quiet_cmd_cc_o_c = CC      $@
      cmd_cc_o_c = "$(CC)" -o "$@" $(CFLAGS) -c "$<"

quiet_cmd_cc_o_s = AS      $@
      cmd_cc_o_s = "$(CC)" -o "$@" $(ASFLAGS) -c "$<"

quiet_cmd_ar     = AR      $@
      cmd_ar     = "$(AR)" rcs "$@" $(OBJECTS)

quiet_cmd_link   = LINK    $@
      cmd_link   = "$(CC)" -o "$@" $(LDFLAGS) "-Wl,-Map=$@.map" $(OBJECTS) $(LIBS)

quiet_cmd_mkdir  = MKDIR   $@
      cmd_mkdir  = mkdir "$@"

quiet_cmd_bin    = BIN     $@
      cmd_bin    = "$(OBJCOPY)" -O binary "$<" "$@"

quiet_cmd_ihex   = IHEX    $@
      cmd_ihex   = "$(OBJCOPY)" -O ihex "$<" "$@"
