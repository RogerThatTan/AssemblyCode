.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'Enter a number: $'
    MSG_LT DB 13,10, 'Less than 5$'
    MSG_GT DB 13,10, 'Greater than 5$'
    MSG_EQ DB 13,10, 'Equal to 5$'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 
   
    MOV CL, 5
 
    
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
 
   
    MOV AH, 1
    INT 21H
    SUB AL, 30H     
 
   
    CMP AL, CL
    JE EQUAL
    JL LESS
    JG GREATER
 
LESS:
    LEA DX, MSG_LT
    MOV AH, 9
    INT 21H
    JMP EXIT
 
GREATER:
    LEA DX, MSG_GT
    MOV AH, 9
    INT 21H
    JMP EXIT
 
EQUAL:
    LEA DX, MSG_EQ
    MOV AH, 9
    INT 21H
 
EXIT:
    
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
 