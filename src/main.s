@;
@;  A simple program to blink the OK/ACT LED on Raspberry Pi 3
@;  NIM : 47135

.section .init                      @; kernel initialization code must be on 0x8000
.global _start                      @; define _start label globally available for the linker
_start:
    mov         sp, #0x8000         @; set up the stack pointer
    b           _main               @; branch to main routine

.section .text
_main:
    loop$:                          @; main loop
        mov     r4, #4              @; first nim digit
        bl      nim                @; brach to _nim function

        mov     r4, #7              @; second nim digit
        bl      nim                @; brach to _nim function

        mov     r4, #1              @; third nim digit
        bl      nim                @; brach to _nim function

        mov     r4, #3              @; fourth nim digit
        bl      nim                @; brach to _nim function

        mov     r4, #5              @; fifth nim digit
        bl      nim                @; brach to _nim function

        b       loop$               @; branch to loop
