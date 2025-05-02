.MODEL SMALL
.STACK 100H
.DATA

.CODE
MAIN PROC   
    
   MOV AH,1
   INT 21H
   MOV BL,AL
   SUB AL,30H  
   
   MOV CX,0
   MOV CL,AL
   
   FOR:
   MOV AH,2
   MOV DL,BL
   INT 21H 

   
   DEC BL
   LOOP FOR:


   EXIT:
   MOV AH,4CH
   INT 21H
   MAIN ENDP
END MAIN
    
    
    
    
    
    
    
    
    
    
    
    