.data
expr:    .asciz  "-+344"
result:  .word  0             

.text        
__MAIN:
        LDR     R0, =expr   
        LDR     R1, =result 

        MOV     R13, #0x8000 

        BL      evaluating_prefix 

        STR     R0, [R1]
        B       END     

evaluating_prefix:
        MOV     R3, #0
        LDR     R4, =expr  

finding_length_of_exp:
        LDRB    R5, [R4, R3]
        CMP     R5, #0      
        BEQ     eval_main 
        ADD     R3, R3, #1  
        B       finding_length_of_exp 

eval_main:
        SUB     R3, R3, #1  

eval_inner_loop:
        CMP     R3, #-1    
        BLT     eval_end

        LDRB    R5, [R4, R3] 
        SUB     R3, R3, #1 

        CMP     R5, #'0' 
        BLT     is_operator
        CMP     R5, #'9'
        BGT     is_operator

        SUB     R5, R5, #'0' 
        STMDB   SP!, {R5}   
        B       eval_inner_loop

is_operator:
        LDMIA   SP!, {R6}  
        LDMIA   SP!, {R7}  

        CMP     R5, #'+'  
        BNE     if_sub
        ADD     R6, R6, R7  
        B       store_result

if_sub:
        CMP     R5, #'-'  
        BNE     eval_inner_loop
        SUB     R6, R6, R7  

store_result:
        STMDB   SP!, {R6} 
        B       eval_inner_loop

eval_end:
        LDMIA   SP!, {R0}  
        MOV     PC, LR       

END:
        SWI 0x011

   