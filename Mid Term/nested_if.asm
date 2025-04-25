.MODEL SMALL
.STACK 100H
.CODE
.DATA  

    A DB 10,13, 'GREATER THAN 5$'
    B DB 10,13, 'LESS THAN 5$'       
    C DB 10,13, 'EQUAL TO 5$'
    

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    CMP BL,53
    JE L1   ;IF
    JG L2   ;ELSE IF
    JMP L3  ;ELSE
    
    L1:
    MOV AH,9
    LEA DX,C
    INT 21H
    JMP EXIT:
    
    L2:
    MOV AH,9
    LEA DX,A
    INT 21H
    JMP EXIT:
    
    L3:
    MOV AH,9
    LEA DX,B
    INT 21H
    JMP EXIT:
    

    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN