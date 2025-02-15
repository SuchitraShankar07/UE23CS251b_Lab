MOV R0, #0x06
ANDS R1, R0, #1
BEQ even
odd:
    MOV R2, #1
    MOV r0, #0xFF
    b end
even: 
    MOV R2, #0
    MOV R0, #0x00
end:

SWI 0x6B