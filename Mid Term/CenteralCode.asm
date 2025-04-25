.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "Enter a number: $"
    MSG2 DB 10,13,"Enter another number: $"
    MSG3 DB 10,13,"Bigger Number is: $" 
    MSG4 DB 10,13,"GREATER THAN 5.$"
    MSG5 DB 10,13,"lESSER THAN 5.$"  
    MSG6 DB 10,13,"EQUAL TO 5.$"
    NUM1 DB ?
    NUM2 DB ?
    BIGGER DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM1,AL
    
    MOv AH,9
    LEA DX,MSG2
    INT 21H
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV NUM2,AL 
    
    MOV AL,NUM1
    MOV BL,NUM2
    
    
    CMP AL,BL
    JG NM1
    MOV AL,NUM2
    JMP DISPLAY
     
    NM1:
    MOV AL,NUM1
    
    DISPLAY:
    MOV BIGGER,AL
    MOV AH,9
    LEA DX,MSG3
    INT 21H
    MOV DL,BIGGER
    ADD DL,30H
    MOV AH,2
    INT 21H
    
    
    MOV AL,BIGGER
    CMP AL,5
    JE SAME
    JG BIG
    JMP SMALLER 
    
    SAME:
    MOV AH,9
    LEA DX,MSG6
    INT 21H 
    JMP EXIT:
    
    BIG:
    MOV AH,9
    LEA DX,MSG4
    INT 21H 
    JMP EXIT:
    
    SMALLER:
    MOV AH,9
    LEA DX,MSG5
    INT 21H
    JMP EXIT:
    
        
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN