obj = entry.o main.o hwsetup.o

CC = gcc

CFLAGS := -O2 -g

BIOS_CFLAGS += $(autodepend-flags) -Wall
BIOS_CFLAGS += -m32
BIOS_CFLAGS += -march=i386
BIOS_CFLAGS += -mregparm=3
BIOS_CFLAGS += -fno-stack-protector -fno-delete-null-pointer-checks
BIOS_CFLAGS += -ffreestanding
BIOS_CFLAGS += -mstringop-strategy=rep_byte -minline-all-stringops
BIOS_CFLAGS += -Iinclude

all: bios.rom

.PRECIOUS: %.o
%.o: %.c
	$(CC) $(CFLAGS) $(BIOS_CFLAGS) -c -s $< -o $@
%.o: %.S
	$(CC) $(CFLAGS) $(BIOS_CFLAGS) -c -s $< -o $@


bios.elf: $(obj) link.ld
	ld -T link.ld -o bios.elf $(obj)

bios.rom: bios.elf
	objcopy -O binary bios.elf bios.rom

run:
	qemu-system-i386 -net none -bios bios.rom -debugcon stdio

clean:
	rm *.rom
	rm *.o
	rm *.elf
