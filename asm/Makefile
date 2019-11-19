ASM = macro11
BIN = obj2bkb

all: test.bin

test.lst test.obj: test.mac
	$(ASM) -l test.lst -o test.obj test.mac

test.bin: test.obj
	$(BIN) --base 0400 --binary -o test.bin test.obj

