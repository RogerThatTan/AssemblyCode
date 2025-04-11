.MODEL SMALL
.STACK 100H
.DATA
 A DB "My name is Tanvir$"

.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A          ;Load efective area
    INT 21H
    
   
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN