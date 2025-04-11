.MODEL SMALL

.STACK 100H
 
.DATA

    MSG DB 10, 13, '$'
 
.CODE

MAIN PROC

    MOV AX, @DATA

    MOV DS, AX
 
    MOV AH,1

    INT 21h

    MOV BL, AL
 
    MOV AH,1

    INT 21h

    MOV BH, AL
 
    MOV AH,9

    LEA DX, MSG

    INT 21h
 
    MOV AH,2

    MOV DL, BL

    INT 21h 

    MOV AH,2

    MOV DL, BH

    INT 21h
 
    

    MOV AH, 4Ch

    INT 21h

MAIN ENDP
 
END MAIN

 