#include "bios.h"
#include "pci.h"

void setup_hw(void)
{
	const int bdf = 0;
	const uint8_t *bios_start = &stext + 0xfff00000;
	const uint8_t *init_start = &sinit + 0xfff00000;
	volatile uint8_t *rom_check = &stext;
	int rom_check_value;
	int pambase;

	uint32_t id = pci_config_readl(bdf, 0);
}