.MODEL SMALL
.STACK 100H
.DATA

   MSG1 DB "ENTER CHAR: $"
   MSG2 DB 10,13,"CONVERTED CHAR: $"   
   NUM DB ?
   
.CODE
MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV NUM,AL 
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
     
    CMP NUM,'A'
    JL NOT_LETTER
    CMP NUM,'Z'
    JLE CONVERT_1
    
   
    CMP NUM,'a'
    JL NOT_LETTER
    CMP NUM,'z'
    JG NOT_LETTER
  
    MOV BL, NUM
    SUB BL, 20H
    JMP CONVERT_2
    
CONVERT_1:
   
    MOV BL, NUM
    OR BL, 20H
    JMP CONVERT_2
    
CONVERT_2:

    MOV AH,2
    MOV DL, BL
    INT 21H
    JMP EXIT    
    
NOT_LETTER:
  
    MOV AH,2
    MOV DL, NUM
    INT 21H
    
EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN 