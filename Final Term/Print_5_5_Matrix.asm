.MODEL SMALL
.STACK 100H
.DATA
    A DB 10,13,"*****$"
.CODE
MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV CX,5
    
    MOV AH,9
    LEA DX,A

    
    TOP:
    INT 21H
    
    LOOP TOP:
    

    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
