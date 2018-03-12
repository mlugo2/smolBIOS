#ifndef BIOS_PCI_H
#define BIOS_PCI_H

#include "ioport.h"

static inline uint32_t pci_config_readl(uint16_t bdf, uint32_t addr)
{
	outl(0xcf8, 0x80000000 | (bdf << 8) | (addr & 0xfc));
	return inl(0xcfc);
}

#endif
