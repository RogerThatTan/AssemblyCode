.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB "INPUT:$"
    MSG2 DB 10,13,"OUTPUT IN BINARY:$"
    MSG3 DB 10,13,"COUNT OF 1's: $"
    MSG4 DB 10,13,"COUNT OF 0's: $"
    MSG5 DB 10,13,"EVEN$"
    MSG6 DB 10,13,"ODD$"
    MSG7 DB 10,13,"INVALID INPUT$"
    MSG8 DB 10,13,"REVERSED BINARY:$"
    MSG9 DB 10,13,"CONVERTED REV INTO HEX:$"  
    ONE DW 0
    ZER DW 0  
    ORG DW ?
    REV DW ?
        

.CODE
MAIN PROC
    
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AH,9
     LEA DX, MSG1
     INT 21H
     
     MOV CX,4
     MOV BX,0
     
     INPUT_LOOP:
     MOV AH,1
     INT 21H
     
     CMP AL,13
     JE OUTPUT
     
     CMP AL,'0'
     JB INVALID
     
     CMP AL,'9'
     JBE DIGIT
     
     CMP AL,'A'
     JB INVALID
     
     CMP AL,'F'
     JBE UPPER_LETTER
     
     CMP AL,'a'
     JB INVALID
     
     CMP AL,'f'
     JBE LOWER_LETTER
     
     JMP INVALID
     
     DIGIT:
     AND AL,0FH
     JMP SHIFT
     
     UPPER_LETTER:
     SUB AL,37H
     JMP SHIFT
     
     LOWER_LETTER:
     SUB AL,57H
     
     SHIFT:
     SHL BX,4
     OR BL,AL
     LOOP INPUT_LOOP
     
     MOV ORG,BX
     
     
     OUTPUT:
     
     MOV AH,9
     LEA DX,MSG2
     INT 21H
     
     MOV CX,16
     
     OUTPUT_BIN:
     SHL BX,1
     JNC ZERO
     
     INC ONE
     MOV AH,2
     MOV DL,49
     INT 21H
     
     JMP OUTPUT_BIN2
     
     ZERO:
     INC ZER
     MOV AH,2
     MOV DL,48
     INT 21H
     
     OUTPUT_BIN2:
     LOOP OUTPUT_BIN
    
     MOV AH,9
     LEA DX,MSG3
     INT 21H
     
     MOV AH,2
     MOV DX,ONE
     ADD DX,30H
     INT 21H
     
     
     MOV AH,9
     LEA DX,MSG4
     INT 21H
     
     MOV AH,2
     MOV DX,ZER
     ADD DX,30H
     INT 21H
    
    
     TEST ONE,1
     JZ EVEN_NUM
     
     MOV AH,9
     LEA DX,MSG6
     INT 21H
     JMP REVERSE_MODE
     
     EVEN_NUM:
     MOV AH,9
     LEA DX,MSG5
     INT 21H
     
     REVERSE_MODE:
     MOV CX,16
     MOV DX,0
     MOV BX,ORG
     
     REVERSE_LOOP:
     SHR BX,1
     RCL DX,1
     LOOP REVERSE_LOOP
     
     MOV REV,DX 
     
     MOV AH,9
     LEA DX,MSG8
     INT 21H
     
     MOV CX,16
     MOV BX,REV
     
     
     OUTPUT_REV:
     SHL BX,1
     JNC ZERO_REV
     
     
     MOV AH,2
     MOV DL,49
     INT 21H
     
     JMP OUTPUT_BIN2_REV
     
     ZERO_REV:
     
     MOV AH,2
     MOV DL,48
     INT 21H
     
     OUTPUT_BIN2_REV:
     LOOP OUTPUT_REV
    
    
     MOV AH,9
     LEA DX,MSG9
     INT 21H 
     
     MOV CX,4
     MOV BX,REV
     
     FOR2:
     MOV AH,2
     MOV DL,BH
     SHR DL,4
     ROL BX,4
     CMP DL,10
     JGE LETTER
     ADD DL,30H
     INT 21H
     JMP FOR3
     
     LETTER:
     ADD DL,37H
     INT 21H
     
     FOR3:
     LOOP FOR2
     JMP EXIT
    
    
    
    
    INVALID:
    MOV AH,9
    LEA DX,MSG7
    INT 21H
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
