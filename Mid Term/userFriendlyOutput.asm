.MODEL SMALL
.STACK 100H
.DATA
 
 A DB "ENTER A NUMBER: $" 
 B DB "The Number is : $"

.CODE

MAIN PROC
    
   MOV AX,@DATA
   MOV DS,AX
   
   MOV AH,9   ;Printing A Line
   LEA DX,A
   INT 21H
   
   
   MOV AH,1    ;GIVING INPUT
   INT 21H
   MOV BL,AL
    
   MOV AH,2
   MOV DL,10  ;NEW LINE
   INT 21H
   MOV DL,13
   INT 21H
    
    
   MOV AH,9   ;Printing B  Line
   LEA DX,B
   INT 21H
   
   MOV AH,2   ;OUTPUT B
   MOV DL,BL
   INT 21H

    
   EXIT:
   MOV AH,4CH
   INT 21H
   MAIN ENDP  

END MAIN