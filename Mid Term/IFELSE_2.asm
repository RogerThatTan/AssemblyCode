.MODEL SMALL
.STACK 100H
.DATA
.CODE
MAIN PROC
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    CMP BL,BH
    
    JGE L1
    JMP L2
    
    L1:
    MOV AH,2
    MOV DL,BL
    INT 21H
    JMP EXIT:
    
    L2:
    MOV AH,2
    MOV DL,BH
    INT 21H
    JMP EXIT:
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN