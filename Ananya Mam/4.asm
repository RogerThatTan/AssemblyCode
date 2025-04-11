.MODEL SMALL

.STACK 100H
 
.DATA

    posMsg  DB 13, 10, 'Number is Positive$'

    negMsg  DB 13, 10, 'Number is Negative$'

    zeroMsg DB 13, 10, 'Number is Zero$'
 
.CODE

MAIN PROC

    MOV AX, @DATA

    MOV DS, AX
 
   

    MOV AH, 01H

    INT 21H

    MOV BL, AL         
 
    CMP BL, '-'       

    JNE NOT_NEGATIVE
 
 

    MOV AH, 01H

    INT 21H

    CMP AL, '0'

    JE PRINT_ZERO

    JMP PRINT_NEGATIVE
 
NOT_NEGATIVE:

    CMP BL, '0'

    JE PRINT_ZERO

    JMP PRINT_POSITIVE
 
PRINT_POSITIVE:

    LEA DX, posMsg

    JMP PRINT
 
PRINT_NEGATIVE:

    LEA DX, negMsg

    JMP PRINT
 
PRINT_ZERO:

    LEA DX, zeroMsg
 
PRINT:

    MOV AH, 09H

    INT 21H
 


    MOV AH, 4CH

    INT 21H

MAIN ENDP
 
END MAIN

 