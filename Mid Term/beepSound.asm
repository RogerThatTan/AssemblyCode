.MODEL SMALL
.STACK 100H
.DATA


.CODE

MAIN PROC
    
    MOV AH,2
    MOV DL,07
    INT 21H 
    
    MOV AH,2
    MOV DL,07
    INT 21H
    
    MOV AH,2
    MOV DL,07
    INT 21H
    
    MOV AH,2
    MOV DL,07
    INT 21H
    
    MOV AH,2
    MOV DL,07
    INT 21H

    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN
    