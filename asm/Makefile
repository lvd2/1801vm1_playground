ASM = macro11
BIN = obj2bkb

targets = test t401



.PHONY: all

#all: $(targets:%=%.bin) $(targets:%=%.lst)
all: $(targets:%=%.lst) $(targets:%=%.bin)



%.lst: %.mac
	$(ASM) -l $@ $<

%.obj: %.mac
	$(ASM) -o $@ $<

#%.bin: %.obj
#	$(BIN) --base 0000 --binary -o $@ $<

test.bin: test.obj
	$(BIN) --base 0400 --binary -o $@ $<

t401.bin: t401.obj
	$(BIN) --base 0000 --binary -o $@ $<



#test.lst test.obj: test.mac
#	$(ASM) -l test.lst -o test.obj test.mac

#test.bin: test.obj
#	$(BIN) --base 0400 --binary -o test.bin test.obj

clean:
	rm $(targets:%=%.lst) $(targets:%=%.obj) $(targets:%=%.bin) 

