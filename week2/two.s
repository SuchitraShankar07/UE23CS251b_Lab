.data
Array:.WORD 15,10,12,13,9,45,16,8,25,33
evensum:.WORD 0
.text
    LDR R0, =Array
    LDR R1, =evensum
    MOV R2, #0
    MOV R3,#10

   
even_loop:
     LDR  R4, [R0], #4
     AND R5,R4,#1
     CMP R5, #0
     BNE skip
     ADD R2 , R2, R4
   
skip: 
    SUBS R3, R3, #1
    BNE even_loop

    STR R2, [R1]

SWI 0x11


