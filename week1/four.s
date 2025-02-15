MOV R1, #5
MOV R0, #5
CMP R0, R1
BEQ branch1
B branch2

branch1:
  ADD R2, R0, R1
  SWI 0x11

branch2:
  SUB R2, R1, R0
  SWI 0x11

