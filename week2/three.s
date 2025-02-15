.data
ARRAY: .word 10,50,41,55,30,20,11,5,100,77
LOCA: .word 0,0,0,0,0
LOCB: .word 0,0,0,0,0

    .text
LDR R1, =ARRAY
LDR R2, =LOCA
LDR R3, =LOCB
MOV R4, #0

loop:
  LDR R5, [R1], #4
  ANDS R6, R5, #1
  BEQ even
  BNE odd
even:
  STR R5, [R3], #4
  ADD R4, R4, #1
  CMP R4, #10
  BEQ end
  BNE loop
odd:
  STR R5, [R2], #4
  ADD R4, R4, #1
  CMP R4, #10
  BEQ end
  BNE loop
end:
  SWI 0x011


  