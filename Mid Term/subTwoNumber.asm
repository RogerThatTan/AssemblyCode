.MODEL SMALL
.STACK 100H
.DATA



.CODE
MAIN PROC
    
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    SUB BL,BH
    ADD BL,48
    
    MOV AH,2
    MOV DL,BL
    INT 21H
 
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN


