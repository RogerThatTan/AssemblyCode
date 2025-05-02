.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC
    
   MOV AH,1
   INT 21H 
   MOV BL,AL
   
 
   
   WHILE:
   CMP BL,'0'
   JE EXIT:
   
   MOV AH,2
   MOV DL,BL
   INT 21H
   
   DEC BL
   JMP WHILE:
   

   
   EXIT:
   MOV AH,4CH
   INT 21H
 

    MAIN ENDP
END MAIN





