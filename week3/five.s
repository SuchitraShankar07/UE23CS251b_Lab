.data
A:       .word 1,2,3,4,5
B:       .word 6,7,8,9,10
.text
    LDR R1, =A
    LDR R2, =B
    MOV R0, #5
    MOV R3, #0

loop:
    LDR R4, [R1], #4
    LDR R5, [R2], #4

    MUL R6, R4, R5
    ADD R3, R3, R6
    SUB R0, R0, #1    
    CMP R0, #0
    BNE loop
SWI 0x11    


