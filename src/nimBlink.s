@;
@;  A simple program to blink the OK/ACT LED on Raspberry Pi 3
@;  0.2s = #0x3A980 ; 2s = #0x249F00 in 1.2 GHz processor clock ; 

.section .text
.global nim
nim:
    push        {lr}
    loop1$:                          @; main loop
        @; enable led
        mov     r0, #1              @; led state 1 = on
        bl      set_led_state       @; set led state

        ldr     r0, =0x3A980        @; delay in microseconds (0.2s)
        bl      delay               @; branch to delay function

        @; disable led
        mov     r0, #0              @; led state 0 = off
        bl      set_led_state       @; set led state

        ldr     r0, =0x3A980        @; delay in microseconds (0.2s)
        bl      delay               @; branch to delay function

        subs    r4, r4, #1
        bne     loop1$              @; branch to loop1$
    ldr         r0, =0x249F00       @; gap between digits
    bl          delay               @; branch to delay function
    pop         {pc}                @; return
       
