.MODEL SMALL
.STACK 100H
.DATA 
    M1 DB "FNum:$"
    M2 DB 10,13,"SNum:$"
    M3 DB 10,13,"TNum:$"
    C1 DB ?
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    MOV BH,52
    MOV CX,8
    MOV AH,9
    LEA DX,M1
    INT 21H
    
L1:
    ROL BH,1
    MOV AH,2
    
    JNC L2
    MOV DL,'1'
    INT 21H
    LOOP L1
    JMP L3
L2:
    
    MOV DL,'0'
    INT 21H
    LOOP L1 
L3:
    MOV AH,9
    LEA DX,M2
    INT 21H
    MOV AH,2
    SUB BH,37H
    CMP BH,10
    JGE L4
    MOV DL,BH
    ADD DL,48
    INT 21H
L4:
    MOV DL,BH
    ADD DL,37H
    INT 21H
L5:
    MOV AH,9
    LEA DX,M3
    INT 21H
    MOV AH,2
    MOV C1,BH
    ADD C1,27H
    MOV DL,C1
    
    INT 21H
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN
    