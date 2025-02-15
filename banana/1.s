.data
array:  .word  29, 10, 14, 37, 13 
n:      .word  5                  

.text
    LDR R0, =array    
    LDR R1, =n 
    LDR R1, [R1] 
    SUB R1, R1, #1 

outer_loop:
    MOV R2, R0 
    MOV R3, R2 
    MOV R4, R1  

inner_loop:
    ADD R5, R2, #4 
    LDR R6, [R5]   
    LDR R7, [R3]    
    CMP R6, R7      
    MOVLT R3, R5  
    SUBS R4, R4, #1 
    BNE inner_loop

    LDR R6, [R2]    
    LDR R7, [R3]
    STR R7, [R2]
    STR R6, [R3]

    ADD R0, R0, #4  
    SUBS R1, R1, #1 
    BNE outer_loop

exit:
    SWI 0x011      
