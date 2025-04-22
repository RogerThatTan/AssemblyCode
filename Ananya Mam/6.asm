.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "ENTER A CHARACTER: $"
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    MOV CX,50
    
    LOOPMAMA:
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    DEC CX
    JNZ LOOPMAMA
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN