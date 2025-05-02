.MODEL SMALL
.STACK 100H
.DATA
    
    MSG1 DB 10,13,'Inside$'
    MSG2 DB 10,13,'Outside$'
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    SUB AL,30H
    MOV BL,AL
    
    CMP BL,5
    JLE OUTS
    
    CMP BL,8
    JGE OUTS
    
    INS:
    MOV AH,9
    LEA DX,MSG1
    INT 21H
    JMP EXIT
    
    OUTS:
    MOV AH,9
    LEA DX,MSG2
    INT 21H

    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
