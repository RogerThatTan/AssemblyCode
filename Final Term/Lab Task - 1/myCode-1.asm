.MODEL SMALL
.STACK 100H
.DATA

  MSG1 DB 10,13,"$"

.CODE
MAIN PROC
          
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,255
    MOV BL,0
    
    TOP:
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    INC BL
    
    
    LOOP TOP:

    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN