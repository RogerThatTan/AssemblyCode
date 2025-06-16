.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT VALID HEX:$"
    MSG2 DB 10,13,"OUTPUT IN BINARY:$"
    MSG3 DB 10,13,"NOT A VALID HEX INPUT$" 
    ONE_COUNT  DW ?
    ZERO_COUNT DW ?
    MSG4 DB 10,13,"EVEN$"
    MSG5 DB 10,13,"ODD$"
    MSG6 DB 10,13,"COUNT OF 1's: $"
    MSG7 DB 10,13,"COUNT OF 0's:$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9
    LEA DX,MSG1
    INT 21H

    MOV BX,0
    MOV CX,4
    MOV ONE_COUNT,0
    MOV ZERO_COUNT,0

INPUT_LOOP:

    MOV AH,1
    INT 21H
    CMP AL,13
    JE  OUTPUT

    CMP AL,'0'
    JB INVALID
    CMP AL,'9'
    JBE DIGIT
    CMP AL,'A'
    JB INVALID
    CMP AL,'F'
    JBE UPPER_LETTER
    CMP AL,'a'
    JB INVALID
    CMP AL,'f'
    JBE LOWER_LETTER
    JMP INVALID

    DIGIT:
    SUB AL,30H
    JMP SHIFT

    UPPER_LETTER:
    SUB AL,37H
    JMP SHIFT

    LOWER_LETTER:
    SUB AL,57H

    SHIFT:
    SHL BX,4
    OR BL,AL
    LOOP INPUT_LOOP

    OUTPUT:
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    MOV CX,16

    OUTPUT_BIN:
    SHL BX,1
    JNC ZERO
    INC ONE_COUNT
    MOV DL,49
    MOV AH,2
    INT 21H
    JMP OUTPUT_2

    ZERO: 
    INC ZERO_COUNT
    MOV DL,48
    MOV AH,2
    INT 21H

    OUTPUT_2:
    LOOP OUTPUT_BIN 
    
        ; Print count of 1's
    MOV AH,9
    LEA DX,MSG6
    INT 21H
    MOV AX,ONE_COUNT
    CALL PRINT_NUM
    
    ; Print count of 0's
    MOV AH,9
    LEA DX,MSG7
    INT 21H
    MOV AX,ZERO_COUNT
    CALL PRINT_NUM
    
    ; Check parity
    TEST ONE_COUNT,1
    JZ EVEN_NUM
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    JMP EXIT
    
    EVEN_NUM:
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    JMP EXIT

    INVALID:
    MOV AH,9
    LEA DX,MSG3
    INT 21H


    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
    
    PRINT_NUM PROC
    MOV CX,0        ; Digit counter
    MOV BX,10       ; Base 10 divisor

    EXTRACT_DIGITS:
    XOR DX,DX       ; Clear DX (high word for DIV)
    DIV BX          ; AX = quotient, DX = digit
    PUSH DX         ; Save digit
    INC CX          ; Count digits
    TEST AX,AX      ; Quotient zero?
    JNZ EXTRACT_DIGITS ; No, continue

    PRINT_DIGITS:
    POP DX          ; Get digit
    ADD DL,'0'      ; Convert to ASCII
    MOV AH,2        ; Print char function
    INT 21H
    LOOP PRINT_DIGITS
    RET
PRINT_NUM ENDP

END MAIN
