

source/startup_stm32f4xx.o: source/startup_stm32f4xx.s
	$(call cmd,cc_o_s)

source/system_stm32f4xx.o: source/system_stm32f4xx.c
	$(call cmd,cc_o_c)

clean::
	$(RM) source/startup_stm32f4xx.o
	$(RM) source/system_stm32f4xx.o
