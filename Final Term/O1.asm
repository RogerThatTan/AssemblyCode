.MODEL SMALL 
.STACK 100H
.DATA
    CHAR1 DB ?
    CHAR2 DB ?
CR EQU 0DH
LF EQU 0AH

.CODE MAIN

PRINT_NEWLINE PROC
    MOV DL,CR
    MOV AH,02H
    INT 21H
    MOV DL,LF
    INT 21H
    RET
PRINT_NEWLINE ENDP

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BL,'1'
    MOV CX,3
   
TOP:
    MOV AH,02H
    MOV DL,BL
    INT 21H
    INC BL
    LOOP TOP
    
    CALL PRINT_NEWLINE
    
    MOV AL,'0'
    ADD AL,5
    MOV AH,02H
    MOV DL,AL
    INT 21H
    
    CALL PRINT_NEWLINE 
    
    MOV CHAR1,'S'
    ADD CHAR1,3
    
    MOV AH,02H
    MOV DL,CHAR1
    INT 21H
    
    CALL PRINT_NEWLINE
    
    MOV CHAR2,'6'
    SUB CHAR2,2
    
    MOV AH,02H
    MOV DL,CHAR2
    INT 21H
    CALL PRINT_NEWLINE 
    
    MOV DL,'Z'
    OR DL,20H
    
    MOV AH,02H
    INT 21H
    
    CALL PRINT_NEWLINE 
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP 
END MAIN

    