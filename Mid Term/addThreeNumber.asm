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
    
    MOV AH,1
    INT 21H
    MOV CH,AL
    
    
    
    ADD BL,BH  ;BL=BL+BH 
    SUB BL,48  
    ADD BL,CH
    
    
    MOV AH,2
    MOV DL,BL 
    SUB DL,48
    INT 21H
    
    
    
   

    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP

END MAIN
    