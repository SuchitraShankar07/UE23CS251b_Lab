.data
A:       .word 10,50,41,55,30,20,11,5,100,77
B:       .word

        .text

LDR     R1, =A
LDR     R4, =B
MOV     R7, #0
MOV     R2, #0

loop:
        LDR     R3, [R1], #4
        CMP     R3, R7
        BLE     skip
        MOV     R7, R3

skip:
        ADD     R2, R2, #1
        CMP     R2, #10
        BNE     loop

end:
        STR     R7, [R4]
        SWI     0x011


        