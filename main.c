#include <stdbool.h>
#include "bios.h"

void __attribute__ ((section (".text.startup"))) main(void)
{
	setup_hw();
}
