.intel_syntax noprefix
.code16

.globl main

/**************************************************************************
 * reset: this section must reside at 0xfffffff0, and be exactly 16 bytes *
 **************************************************************************/
.section reset, "ax"
    .byte 0xe9
    .int main - ( . + 2 )
    .align 16, 0xff
