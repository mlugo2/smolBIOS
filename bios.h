#ifndef BIOS_H_
#define BIOS_H_

#include <inttypes.h>
#include <stddef.h>
#include <stdbool.h>

extern void setup_hw(void);

extern uint8_t stext;
extern uint8_t sinit;

#endif