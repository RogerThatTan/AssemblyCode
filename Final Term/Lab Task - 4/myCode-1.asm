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
