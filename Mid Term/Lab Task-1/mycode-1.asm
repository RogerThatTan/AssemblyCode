.MODEL SMALL
.STACK 100H
.DATA
    
 MSG1 DB " $" 
 MSG2 DB 10,13, "$"

.CODE

MAIN PROC 
   MOV AX,@DATA
   MOV DS,AX      
         
         
   MOV AH,1
   INT 21H
   SUB AL,30H
   MOV BL,AL
             
   MOV AH,9
   LEA DX,MSG1
   INT 21H
            
             
   MOV AH,1
   INT 21H 
   SUB AL,30H
   MOV BH,AL        
    
   CMP BL,BH
   JG  EXCHANGE  
   JMP DISPLAY
            
   EXCHANGE:
   XCHG BL,BH 
   
   
   DISPLAY:
   MOV AH,9
   LEA DX,MSG2
   INT 21H  
   
   MOV AH,2
   MOV DL,BL
   ADD DL,30H
   INT 21H
   
   MOV AH,9
   LEA DX,MSG1
   INT 21H
   
   MOV AH,2
   MOV DL,BH 
   ADD DL,30H
   INT 21H
   
    
    EXIT:
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN

