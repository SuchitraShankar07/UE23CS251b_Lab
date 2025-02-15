.data
A: .word 1,2,3,4,5,6,7,8
g: .word 0
h: .word 0

.text
LDR R1, =g
LDR R2, =h
LDR R3, =A
LDR R2, [R2]
MOV R4, #8
MOV R5, #0

LOOP:
    LDR R6, [R3]
    ADD R5, R5, R6
    ADD R3, R3, #4
    SUB R4, R4, #1
    CMP R4, #0
    BNE LOOP

STR R5, [R1]

SWI 0x011
