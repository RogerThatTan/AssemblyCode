.MODEL SMALL
.STACK 100H
.DATA
   A DB "NON-NEGATIVE$"  
   B DB 10,13,"NEGATIVE $"
    
   
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV BX,-10 
    
    CMP BX,0
    JGE L1
    JMP L2
    
    L1:
    MOV AH,9
    LEA DX,A
    INT 21H
    JMP EXIT:
    
    L2:
    MOV AH,9
    LEA DX,b
    INT 21h
    JMP EXIT:
    
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN