OUTPUT_ARCH(i386)

MEMORY 
{
    ROM (rx) : org = 4096M - 512K, len = 512K
}

SECTIONS
{
    ENTRY(main)

    .text : { *(.text.startup) *(.text) } >ROM

    .reset 4096M - 0x10 : { *(reset) } 
    . = 1024K - 64K;
    stext = .;
    . = 1024K - 128;
    sinit = .;
}
