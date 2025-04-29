.MODEL SMALL
.STACK 100H
.DATA
   
   MSG1 DB 10,13,"$"

.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV AH,1
    INT 21H
    CMP AL,"-"
    JE NEGU
    
    SUB AL,30H
    MOV BL,AL
    JMP CHECK_NUM    
    
    NEGU:
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV BL,AL
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H 
             
    MOV AH,2         
    MOV DL,BL 
    ADD DL,30H 
    INT 21H
    JMP EXIT:
              
              
    CHECK_NUM:
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,2         
    MOV DL,BL
    ADD DL,30H  
    INT 21H
 
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
