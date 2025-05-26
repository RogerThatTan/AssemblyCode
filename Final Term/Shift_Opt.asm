.MODEL SMALL
.STACK 100H
.DATA



.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX 
    
    MOV AX,4
    ;SHL AX,1
    SHR AX,1 
     
    MOV AH,2
    MOV DX,AX 
    ADD DX,48
    INT 21H

    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN