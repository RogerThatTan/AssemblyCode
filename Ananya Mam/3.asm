.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER THREE LETTERS IN LOWERCASE: $'
    MSG2 DB 13,10,'THE OUTPUTS IN UPPERCASE ARE: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
 
  
    LEA DX, MSG1
    MOV AH, 9
    INT 21H
 
   
    MOV AH, 1
    INT 21H
    MOV BL, AL   
    
   
    MOV AH, 1
    INT 21H
    MOV CL, AL   
    
   
    MOV AH, 1
    INT 21H
    MOV CH, AL   
 
   
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
 
  
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
 
    
    MOV AL, BL
    SUB AL, 20H     
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
    
    MOV AL, CL
    SUB AL, 20H
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
    
    MOV AL, CH      
    SUB AL, 20H     
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
   
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN