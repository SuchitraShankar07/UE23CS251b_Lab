.data
NUMBER: .word   0x5B
.text

START:
        LDR     R0, =NUMBER
        LDR     R1, [R0]
        MOV     R2, #0

CHECK_PARITY:
        TST     R1, #1
        ADDNE   R2, R2, #1
        LSR     R1, R1, #1
        CMP     R1, #0
        BNE     CHECK_PARITY

        AND     R3, R2, #1
        CMP     R3, #0
        BEQ     EVEN_PARITY
        B       ODD_PARITY

EVEN_PARITY:
        MOV     R0, #1
        B       END

ODD_PARITY:
        MOV     R0, #0

END:
SWI 0x11