.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT: $"
    MSG2 DB 10,13,"OUTPUT: $"
.CODE
MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV BX,0
    MOV CX,8
    
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,13
    JE OUTPUT
    
    AND AL,0FH
    SHL BL,1
    OR BL,AL
    LOOP INPUT
    
    OUTPUT:
    AND BL,7FH
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV CX,8
    
    OUTPUT_DIG:
    SHL BL,1
    JNC ZERO
    MOV DL,49
    MOV AH,2
    INT 21H
    JMP OUTPUT_2
    
    ZERO:
    MOV DL,48
    MOV AH,2
    INT 21H
    
    OUTPUT_2:
    LOOP OUTPUT_DIG

    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN



;HEX MODE I/O

.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT:$"
    MSG2 DB 10,13,"OUTPUT:$"
    MSG3 DB 10,13,"INVALID:$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV CX,4
    MOV BX,0
    
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
    AND AL,0FH
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
    AND BL,7FH
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV CX,4
    
    FOR2:
    MOV AH,2
    MOV DL,BH
    SHR DL,4
    ROL BX,4
    CMP DL,10
    JGE LETTER
    ADD DL,30H
    INT 21H
    JMP FOR3
    
    LETTER:
    ADD DL,37H
    INT 21H
    
    FOR3:
    LOOP FOR2
    JMP EXIT
    
    INVALID:
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
