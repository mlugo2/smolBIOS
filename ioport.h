#ifndef BIOS_IOPORT_H
#define BIOS_IOPORT_H 1

static inline unsigned inl(unsigned short port)
{
	unsigned val;
	asm volatile("inl %1, %0" : "=a"(val) : "Nd"(port));
	return val;
}

static inline void outl(unsigned short port, unsigned val)
{
	asm volatile("outl %0, %1" : : "a"(val), "Nd"(port));
}

#endif