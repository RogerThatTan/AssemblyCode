.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT VALID HEX: $"
    MSG2 DB 10,13,"OUTPUT IN BIN: $"
    MSG3 DB 10,13,"COUNT OF 1'S: $"
    MSG4 DB 10,13,"COUNT OF 0'S: $"
    MSG_EVEN DB 10,13,"EVEN$"
    MSG_ODD DB 10,13,"ODD$"  
    MSG_INVALID DB 10,13,"NOT A VALID HEX INPUT$"
    MSG_REV_BIN DB 10,13,"REVERSED BIN: $"
    MSG_REV_HEX DB 10,13,"REVERSED HEX: $"
    ORIG_BYTE DB ?      ; Store original byte
    REV_BYTE DB ?       ; Store reversed byte
    ONE_COUNT DB ?
    ZERO_COUNT DB ? 
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV BX,0
    MOV CX,2
    MOV ONE_COUNT,0
    MOV ZERO_COUNT,0 
    
INPUT_LOOP: 
    MOV AH,1
    INT 21H
    
    CMP AL,13
    JE OUTPUT
    
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
    
    ;ORIGINAL BYTE STORING
    MOV ORIG_BYTE,BL
    
OUTPUT:
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV CX,8
    MOV BL,ORIG_BYTE
    
OUTPUT_BIN:
    SHL BL,1
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
    
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    
    MOV DL,ONE_COUNT
    ADD DL,30H
    MOV AH,2
    INT 21H 
    
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    
    MOV DL,ZERO_COUNT
    ADD DL,30H
    MOV AH,2
    INT 21H 
    
    TEST ONE_COUNT,1
    JZ EVEN_NUM
    
    MOV AH,9
    LEA DX,MSG_ODD
    INT 21H
    JMP REVERSE_MODE
    
EVEN_NUM:
    MOV AH,9
    LEA DX,MSG_EVEN
    INT 21H
    
REVERSE_MODE:
    ; Initialize reverse loop
    MOV BL, ORIG_BYTE   ; Reload original byte
    MOV CX, 8           ; Initialize loop counter
    MOV BH,0         ; BH will hold reversed byte
    
REVERSE_LOOP:
    SHR BL, 1           ; Shift LSB into CF
    RCL BH, 1           ; Rotate CF into reversed byte
    LOOP REVERSE_LOOP   ; Loop 8 times
    
    MOV REV_BYTE, BH    ; Store reversed byte
    
    ; Print reversed binary
    MOV AH,9
    LEA DX,MSG_REV_BIN
    INT 21H
    
    MOV CX,8
    MOV BL,REV_BYTE
    
OUTPUT_REV:
    SHL BL,1
    JNC ZERO_REV
    
    MOV DL,49
    MOV AH,2
    INT 21H
    JMP OUTPUT_REV_2
    
ZERO_REV:
    MOV DL,48
    MOV AH,2
    INT 21H
    
OUTPUT_REV_2:
    LOOP OUTPUT_REV
    
    ; Print reversed hex
    MOV AH,9
    LEA DX,MSG_REV_HEX
    INT 21H
    
    MOV BL,REV_BYTE
    MOV DL,BL
    SHR DL,4
    CMP DL,9
    JLE DIGIT_HIGH
    ADD DL,37H
    JMP PRINT_HIGH
    
DIGIT_HIGH:
    ADD DL,30H
    
PRINT_HIGH:
    MOV AH,2
    INT 21H
    
    MOV DL,BL
    AND DL,0FH
    CMP DL,9
    JLE DIGIT_LOW
    ADD DL,37H 
    JMP PRINT_LOW
    
DIGIT_LOW:
    ADD DL,30H
    
PRINT_LOW:
    MOV AH,2
    INT 21H
    JMP EXIT
   
INVALID: 
    MOV AH,9
    LEA DX,MSG_INVALID
    INT 21H
    
EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN