
        LDR R0, =0x788     
        MOV R1, #0         
        MOV R2, #8         

LOOP:
        AND R3, R0, #0xF  
        ADD R1, R1, R3
        LSR R0, R0, #4 
        SUBS R2, R2, #1 
        BNE LOOP           

