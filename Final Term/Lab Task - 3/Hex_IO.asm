.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT:$"
    MSG2 DB 10,13,"OUTPUT:$"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV BX,0
    MOV CX,4
    
    INPUT:
    MOV AH,1
    INT 21H
    CMP AL,13 
    JE OUTPUT
    CMP AL,41H ;41H =A
    JGE LETTER
    AND AL,0FH ;sub al, 30h  ; if input = 6 then 36h -30h = 6h
    JMP SHIFT
   
    
    LETTER:
    SUB AL,37H ; 41h - 37h = 10(A)
    
    SHIFT:
    SHL BX,4
    OR BL,AL
    LOOP INPUT
    
    OUTPUT:
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
    JGE OUTPUT_LETTER
    
    ADD DL,30H
    INT 21H
    JMP EXIT
    
    OUTPUT_LETTER:
    ADD DL,37H
    INT 21H 
    
    
    EXIT:
    LOOP FOR2
    MOV  AH,4CH
    INT 21H
    MAIN ENDP
END MAIN