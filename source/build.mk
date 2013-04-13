

source/startup_stm32f4xx.o: source/startup_stm32f4xx.s
	$(CC) -o $@ $(CFLAGS) -c $<

source/system_stm32f4xx.o: source/system_stm32f4xx.c
	$(CC) -o $@ $(CFLAGS) -c $<

clean::
	$(RM) source/startup_stm32f4xx.o
	$(RM) source/system_stm32f4xx.o
