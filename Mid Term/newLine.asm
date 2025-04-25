.MODEL SMALL
.STACK 100h
.CODE

MAIN PROC
    
    MOV AH,1
    INT 21H   ;input
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10 ;newline
    INT 21H
    MOV DL,13
    INT 21H
    
    
    MOV AH,2
    MOV DL,BL  ;output
    INT 21H
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    