.MODEL SMALL
.STACK 100H
.DATA
    A DB ?
    B DB ?
    CR EQU 0DH
    LF EQU 0AH
.CODE

MN PROC
    MOV DL,CR
    MOV AH,2H
    INT 21H
    MOV DL,LF
    INT 21H
    RET
MN ENDP 


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV BL,'5'
    MOV CX,4
TOP:
    MOV AH,2H
    MOV DL,BL
    INT 21H
    INC BL
    
    INT 21H
    CALL MN
    LOOP TOP
    
    MOV AL,'0'
    ADD AL,7
    MOV AH,2H
    MOV DL,AL
    INT 21H
    CALL MN
    
    MOV A,'A'
    ADD A,3
    MOV B,'9'
    SUB B,5
    MOV AH,2H
    MOV DL,A
    INT 21H
    INT 21H
    CALL MN
    
    MOV AH,2H
    MOV DL,B
    INT 21H
    CALL MN
    
    MOV DL,'Z'
    INT 21H
    OR DL,32
    MOV AH,2H
    INT 21H
    
    AND DL,0DFH
    INT 21H
    
    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN