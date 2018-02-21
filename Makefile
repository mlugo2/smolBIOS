all:
	nasm -fbin bios.asm -o bios.rom

run:
	qemu-system-i386 -net none -bios bios.rom -debugcon stdio
