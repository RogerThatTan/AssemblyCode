.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER TWO DECIMAL DIGITS: $'
    MSG2 DB 13,10,'THE DIFFERENCE OF ', '$'
    MSG3 DB ' AND ', '$'
    MSG4 DB ' IS ', '$'
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
    SUB BL, 30H        
 
   
    MOV AH, 2
    MOV DL, ' '
    INT 21H
    MOV DL, 'A'
    INT 21H
    MOV DL, 'N'
    INT 21H
    MOV DL, 'D'
    INT 21H
    MOV DL, ' '
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BH, AL
    SUB BH, 30H
 
    MOV AH, 2
    MOV DL, 13
    INT 21H
    MOV DL, 10
    INT 21H
 
   
    LEA DX, MSG2
    MOV AH, 9
    INT 21H
 
   
    MOV AL, BL
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
    
    LEA DX, MSG3
    MOV AH, 9
    INT 21H
 
   
    MOV AL, BH
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
    
    LEA DX, MSG4
    MOV AH, 9
    INT 21H
 
    
    MOV AL, BL
    ADD AL, BH
    ADD AL, 30H
 
    
    MOV DL, AL
    MOV AH, 2
    INT 21H
 
   
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
 