.MODEL SMALL
.STACK 100H
.DATA

   MSG2 DB 10,13,"IS A NUMBER $"
   MSG3 DB 10,13,"IS NOT A NUMBER$"   
   MSG4 DB 10,13,"NUMBER IS EVEN$"   
   MSG5 DB 10,13,"NUMBER IS ODD$"   
   NUM DB ?
   
.CODE
MAIN PROC 
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV AH,1
    INT 21H
    MOV NUM,AL
    
    CMP NUM,'0'
    JL NOT_NUMBER
    CMP NUM,'9'
    JG NOT_NUMBER
    
    MOV AH,9
    LEA DX,MSG2
    INT 21H
    
    SUB NUM,'0'
    
    TEST NUM,1
    JZ EVEN
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    JMP EXIT
    
    EVEN:
    MOV AH,9
    LEA DX,MSG4
    INT 21H
    JMP EXIT
    
    NOT_NUMBER:
    MOV AH,9
    LEA DX,MSG3
    INT 21H 

    
EXIT:
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN 