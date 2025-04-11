.MODEL SMALL
.STACK 100H
 
.DATA
    MSG1 DB 'Enter a character: $'
    NEWLINE DB 13, 10, '$'
 
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 
   
    MOV AH,9
    LEA DX, MSG1
    INT 21h
 

    MOV AH,1
    INT 21h
    MOV BL, AL   
 
 
    MOV AH,9
    LEA DX, NEWLINE
    INT 21h
 
    MOV CX, 50
 
PRINT_LOOP:
    MOV AH, 2
    MOV DL, BL
    INT 21h
 
    DEC CX           
    JNZ PRINT_LOOP  
 
 
    MOV AH, 4Ch
    INT 21h
MAIN ENDP
 
END MAIN