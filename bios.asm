[BITS 16]

; Entry routine
init:

    jmp $

times 65536-0x10-($-$$) db 0

; Entry point
jmp init

times 65536-($-$$) db 0
