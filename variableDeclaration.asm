.MODEL SMALL
.STACK 100H
.DATA 
    A DB 5
    B db ?   ;USER INPUT
  
.CODE

MAIN PROC
     MOV AX,@DATA
     MOV DS,AX
     
     MOV AH,1
     INT 21H
     MOV B,AL   ;this one will keep the user input value in B
     
     MOV AH,2
     MOV DL,A
     ADD DL,48
     INT 21H
     
     MOV AH,2
     MOV DL,B
     INT 21H
     
    
     EXIT:
     MOV AH,4CH
     INT 21H
     
    
    
    
    
    MAIN ENDP
END MAIN