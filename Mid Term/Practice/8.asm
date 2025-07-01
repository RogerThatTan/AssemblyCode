.MODEL SMALL

.STACK 100H
 
.DATA

    A  DB 13, 10, 'ENTER YOUR PASSWORD : $'

    B  DB 13, 10, 'PASSWORD MATCHED$'

    PASS DB 'MYPASSWORD$'
 
.CODE

MAIN PROC

    MOV AX, @DATA

    MOV DS, AX
 
    MOV AH,9

    LEA DX,A

    INT 21H  


    MOV AH,9

    LEA DX,PASS

    INT 21H 

    MOV BL,PASS
 
    CMP BL,PASS      

    JE MASS

    JMP NMASS
 
 
MASS:

    MOV AH,9

    LEA DX,B

    INT 21H
 
    

NMASS:    
 
 
    MOV AH, 4CH

    INT 21H

MAIN ENDP
 
END MAIN

 